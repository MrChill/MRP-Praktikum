#include <ros/ros.h>
#include <ros/console.h>
#include <boost/random.hpp>

#include <MotionExecutorCupPicker/MotionExecutorCupPicker.h>

MotionExecutorCupPicker::MotionExecutorCupPicker(ros::NodeHandle &nh)
    : pathloader_ac("/cup_picker/pathloader", true)
    , motion_interface_ac("/cup_picker/motion_interface/trac_ik", true)
    , gripper_ac("/cup_picker/schunk_canopen_driver_ns/schunk_canopen_gripper_node/gripper_control", true)
    , cup_picker_as( "MotionExecutorCupPicker", boost::bind(&MotionExecutorCupPicker::manipulationCB_as, this, _1), false)
{

    ROS_INFO("Waiting for Pathloader Action Server ...");
    pathloader_ac.waitForServer();
    ROS_INFO("... Found it!");
    ROS_INFO("Waiting for Motion Interface Action Server ...");
    motion_interface_ac.waitForServer();
    ROS_INFO("... Found it!");
    ROS_INFO("Waiting for Gripper Action Server ...");
    gripper_ac.waitForServer();
    ROS_INFO("... Found it!");

    ROS_INFO("Starting MotionExecutor Action Server ...");
    cup_picker_as.registerPreemptCallback(boost::bind(&MotionExecutorCupPicker::manipulationPreemptCB, this));
    cup_picker_as.start();
    ROS_INFO("... Done!");

    // Get configuration from parameter server
    fzi_manipulation_msgs::TrajectoryDesignerSettings pathloader_settings;
    ros::NodeHandle priv_nh("~");
    try
    {
        priv_nh.param<double>("max_vel_scaling_factor",max_vel_scaling_factor,0.2);
        ROS_INFO_STREAM("Read max_velocity_scaling_factor: " << max_vel_scaling_factor);

        priv_nh.param<double>("pathloader_velocity",pathloader_velocity,0.3);
        ROS_INFO_STREAM("Read pathloader_velocity: " << pathloader_velocity);

        priv_nh.param<double>("pathloader_acceleration",pathloader_acceleration,1.0);
        ROS_INFO_STREAM("Read pathloader_acceleration: " << pathloader_acceleration);

        priv_nh.param<double>("gripper_close_value",gripper_close_val, 0.4);
        ROS_INFO_STREAM("Read gripper_close_value: " << gripper_close_val);

        priv_nh.param<double>("gripper_open_value",gripper_open_val, 0.0663);
        ROS_INFO_STREAM("Read gripper_open_value: " << gripper_open_val);
    }
    catch(ros::InvalidNameException e){
        ROS_ERROR_STREAM("Could not read all parameters from param server. " << e.what());
    }



    load_traj_sc = nh.serviceClient<fzi_manipulation_msgs::LoadTrajectory>("/cup_picker/pathloader/loadTrajectory");
    config_traj_sc = nh.serviceClient<fzi_manipulation_msgs::TrajectoryDesignerSettings>("/cup_picker/pathloader/updateSettings");
    //cup_position_sub = nh.subscribe("cup_position", 1, &MotionExecutorCupPicker::manipulationCB, this);


    // Set the speeds of the pathloader:
    pathloader_settings.request.velocity = pathloader_velocity;
    pathloader_settings.request.acceleration = pathloader_acceleration;
    if(!config_traj_sc.call(pathloader_settings)){
        ROS_ERROR_STREAM("Could not change pathloader settings");
    }

    //==========
    // Params
    //==========

    trajectories.clear();
    trajectories.push_back("to_start.traj");
    trajectories.push_back("cup_traj2.traj");
    trajectories.push_back("to_idle.traj");


    fzi_manipulation_msgs::GripperGoal ggoal;
    ggoal.gripper_width = gripper_open_val;
    gripper_ac.sendGoal(ggoal);
    sleep(2);
    if(!gripper_ac.waitForResult(ros::Duration(10.0))){
        ROS_ERROR("Could not operate the gripper within time!");
    }

    // =======  Drive to Idle Pose =======
    LoadAndExecutePath(trajectories[2]);
}

MotionExecutorCupPicker::~MotionExecutorCupPicker()
{
    cup_picker_as.shutdown();
}

void MotionExecutorCupPicker::manipulationPreemptCB()
{
  ROS_WARN("Motion was preempted!");
  pathloader_ac.cancelAllGoals();
}


void MotionExecutorCupPicker::manipulationCB_as(const mob_rob_17_msgs::MotionExecutorGoalConstPtr &goal){


    ROS_INFO("Action Goal recieved");
    bool success = true;

    geometry_msgs::Pose goalPose = goal->goal_pose;
    ROS_INFO("Start execution to goal pose: (%f, %f, %f - %f, %f, %f, %f)", goal->goal_pose.position.x, goal->goal_pose.position.y, goal->goal_pose.position.z, goal->goal_pose.orientation.x, goal->goal_pose.orientation.y, goal->goal_pose.orientation.z, goal->goal_pose.orientation.w );

    if(goal->gripper_close_val <= 0.0663)
        gripper_close_val = goal->gripper_close_val;

    success = ExecuteMotion(goalPose);

    if(success)
        ROS_INFO("Trajectory execution succeed!");
    else
        ROS_INFO("Could not execute trajectory!");


    action_result.success = success;
    // set the action state to succeeded
    cup_picker_as.setSucceeded(action_result);

}


bool MotionExecutorCupPicker::ExecuteMotion(geometry_msgs::Pose& goal_pose){


    geometry_msgs::Quaternion quat;
    quat.x = 1.0;
    quat.y = 0.0;
    quat.z = 0.0;
    quat.w = 0.000296327;

    geometry_msgs::Pose IK_pose;
    IK_pose.orientation = quat;
    goal_pose.orientation = quat;


    /*tf::Quaternion quat;
    quat.setRPY(3.141, 0, 0);
    tf::Pose turtlebot_pose;
    poseMsgToTF(goal_pose, turtlebot_pose);
    turtlebot_pose.setRotation(quat);
    tf::Pose table_pose;
    table_pose.setRotation(quat);*/


    // ======= 0) Open Gripper =======
    if(!OperateGripper(false)) return false;

    // ======= 1) Drive above Turtle Bot =======
    if(!LoadAndExecutePath(trajectories[0])) return false;

    // ======= 2) Drive downwards via IK =======

    //table_pose.setOrigin(tf::Vector3(-0.0780, 0.4506, -0.400));
    if(!MoveViaIK("move_to_cup", goal_pose)) return false;

    // ======= 3) Close Gripper =======
    if(!OperateGripper(true)) return false;

    // ======= 4) Drive upwards via IK =======
    goal_pose.position.z += 0.05;
    //table_pose.setOrigin(tf::Vector3(-0.0780, 0.450, -0.273));
    if(!MoveViaIK("pick_cup", goal_pose))return false;

    // ======= 5) Execute Cup Trajectory =======
    if(!LoadAndExecutePath(trajectories[1])) return false;

    // ======= 6) Drive downwards via IK =======
    IK_pose.position.x = 0.240;
    IK_pose.position.y = 0.0016;
    IK_pose.position.z = 0.100;
    //table_pose.setOrigin(tf::Vector3(0.240, 0.0016, 0.100));
    if(!MoveViaIK("place_cup", IK_pose)) return false;

    // ======= 7) Open Gripper =======
    if(!OperateGripper(false)) return false;

    // ======= 8) Drive upwards via IK =======
    IK_pose.position.x = 0.240;
    IK_pose.position.y = 0.0016;
    IK_pose.position.z = 0.214;
    //table_pose.setOrigin(tf::Vector3(0.240, 0.0016, 0.214));
    if(!MoveViaIK("move_up", IK_pose)) return false;

    // ======= 11) Drive to Idle Pose =======
    if(!LoadAndExecutePath(trajectories[2])) return false;

    return true;
}

bool MotionExecutorCupPicker::LoadAndExecutePath(const std::string &path_name)
{
  fzi_manipulation_msgs::PlayTrajectoryGoal play_current_goal;
  fzi_manipulation_msgs::LoadTrajectory path_service_object;

  if(path_name.empty()) // ignore empty entries
  {
    return true;
  }

  play_current_goal.mode = fzi_manipulation_msgs::PlayTrajectoryGoal::CURRENT;
  play_current_goal.repeat = false;

  path_service_object.request.filename = path_name;
  path_service_object.request.invert_trajectory = false;
  if(!load_traj_sc.call(path_service_object))
  {
    ROS_ERROR_STREAM("Could not load path " << path_service_object.request.filename);
    return false;
  }

  pathloader_ac.sendGoal(play_current_goal);
  if(!pathloader_ac.waitForResult(ros::Duration(60.0)))
  {
    ROS_ERROR_STREAM("Could not execute path " << path_service_object.request.filename << " within time!");
    return false;
  }

  if(pathloader_ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
  {
    return true;
  }else{
    ROS_ERROR_STREAM("Could not execute path " << path_service_object.request.filename << " due to some error!");
    return false;
  }
}

bool MotionExecutorCupPicker::MoveViaIK(const std::string &execution_command, const geometry_msgs::Pose &IK_pose)
{
  fzi_manipulation_msgs::CartesianTrajectoryGoal trajectory_goal;


  trajectory_goal.endeffector_frame = "grasping_center";
  trajectory_goal.reference_frame = "base_link";
  trajectory_goal.inverse_kinematics_type = fzi_manipulation_msgs::CartesianTrajectoryGoal::TRAC_IK;
  trajectory_goal.trajectory_type = fzi_manipulation_msgs::CartesianTrajectoryGoal::POSES;
  trajectory_goal.max_velocity_scaling_factor = max_vel_scaling_factor;

  fzi_manipulation_msgs::CartesianTrajectoryPoint tmp;
  tmp.pose = IK_pose;
  trajectory_goal.trajectory.points.push_back(tmp);


  motion_interface_ac.sendGoal(trajectory_goal);
  if(!motion_interface_ac.waitForResult(ros::Duration(60.0)))
  {
    ROS_ERROR_STREAM("Could not drive to " << execution_command << " within time!");
    return false;
  }

  if(motion_interface_ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
  {
    return true;
  }else{
    ROS_ERROR_STREAM("Could not drive to " << execution_command << " due to some error!");
    return false;
  }
}

bool MotionExecutorCupPicker::OperateGripper(bool close)
{
  static bool state(false);

  fzi_manipulation_msgs::GripperGoal ggoal;

  if(close && state) ROS_INFO("Gripper was already closed");
  if(close && !state)
  {
    ROS_INFO("Closing gripper");
    ggoal.gripper_width = gripper_close_val;
  }

  if(!close && !state) ROS_INFO("Gripper was already open");
  if(!close && state)
  {
    ROS_INFO("Opening gripper");
    ggoal.gripper_width = gripper_open_val;
  }
  if (state != close)
  {
    gripper_ac.sendGoal(ggoal);
    state = close;
    sleep(2);
    if(!gripper_ac.waitForResult(ros::Duration(10.0)))
    {
      ROS_ERROR("Could not operate the gripper within time!");
      return false;
    }

    if(gripper_ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    {
      return true;
    }
    else
    {
      ROS_ERROR_STREAM("Could not operate the gripper due to some error!");
      return false;
    }
  }
  return true;
}


/*void MotionExecutorCupPicker::manipulationCB( geometry_msgs::Pose goal_pose){

    ROS_INFO("recieved");
    geometry_msgs::Pose goalPose = goal_pose;
    ROS_INFO("Start execution to goal pose: (%f, %f, %f - %f, %f, %f, %f)", goal_pose.position.x, goal_pose.position.y, goal_pose.position.z, goal_pose.orientation.x, goal_pose.orientation.y, goal_pose.orientation.z, goal_pose.orientation.w );
    result = ExecuteMotion(goalPose);

    if(result)
        ROS_INFO("Trajectory execution succeed!");
    else
        ROS_INFO("Could not execute trajectory!");
}*/


// ------------------------
//   ROS Node Execution
// ------------------------
int main(int argc, char* argv[])
{

  ros::init(argc, argv, "motion_executor_cup_picker");
  ros::NodeHandle priv_nh("~");
  ros::NodeHandle nh;

  MotionExecutorCupPicker mecp(priv_nh);

  ROS_INFO("Starting Motion Executor Cup Picker!");

  ros::spin();

  ROS_INFO("Motion Executor Cup Picker is terminating.");

  return 0;
}
