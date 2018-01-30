#include <ros/ros.h>
#include <ros/console.h>
#include <boost/random.hpp>

#include <CupDelivererManager/CupDelivererManager.h>

CupDelivererManager::CupDelivererManager(ros::NodeHandle &nh)
    : motion_executor_ac("/cup_picker/motion_interface/trac_ik", true)
    , state_manager_as( "CupDelivererManager", boost::bind(&CupDelivererManager::manipulationCB_as, this, _1), false)
{

    ROS_INFO("Waiting for MotionExecutor Action Server ...");
    motion_executor_ac.waitForServer();
    ROS_INFO("... Found it!");

    ROS_INFO("Starting StateManager Action Server ...");
    state_manager_as.registerPreemptCallback(boost::bind(&CupDelivererManager::manipulationPreemptCB, this));
    state_manager_as.start();
    ROS_INFO("... Done!");

    ROS_INFO("Subscribe to 'cup_position' ...");
    pose_received =false;
    localization_sub = nh.subscribe("cup_position", 1, &CupDelivererManager::manipulationCB_sub, this);

}

CupDelivererManager::~CupDelivererManager()
{
    motion_executor_ac.cancelAllGoals();
    state_manager_as.shutdown();
}

void CupDelivererManager::manipulationPreemptCB()
{
  ROS_WARN("Motion was preempted!");
  motion_executor_ac.cancelAllGoals();
}


void CupDelivererManager::manipulationCB_as(const mob_rob_17_msgs::DeliverCupGoalConstPtr &goal){

    ROS_INFO("Action Goal recieved");
    mob_rob_17_msgs::MotionExecutorGoal motion_executor_goal;

    //checks weather a goal is received for 2*60 sec
    size_t counter= 0;
    while (!pose_received){
        state_manager_result.result_code = 401;
        sleep(2);
        counter++;
        if(counter>= 60){
            state_manager_as.setSucceeded(state_manager_result);
            return;
        }
    }

    motion_executor_goal.goal_pose = received_goal_pose;
    motion_executor_goal.gripper_close_val = 0.2;
    ROS_INFO("Start execution to goal pose: (%f, %f, %f - %f, %f, %f, %f)", motion_executor_goal.goal_pose.position.x, motion_executor_goal.goal_pose.position.y, motion_executor_goal.goal_pose.position.z,
             motion_executor_goal.goal_pose.orientation.x, motion_executor_goal.goal_pose.orientation.y, motion_executor_goal.goal_pose.orientation.z, motion_executor_goal.goal_pose.orientation.w );


    actionlib::SimpleClientGoalState state = motion_executor_ac.sendGoalAndWait(motion_executor_goal, ros::Duration(180.0), ros::Duration(30.0));
    ROS_INFO("Action finished: %s",state.toString().c_str());

    if(state == actionlib::SimpleClientGoalState::SUCCEEDED)
        state_manager_result.result_code = 200;
    else if(state == actionlib::SimpleClientGoalState::REJECTED)
        state_manager_result.result_code = 500;
    else
        state_manager_result.result_code = 600;

    // set the action state to succeeded
    state_manager_as.setSucceeded(state_manager_result);

}

void CupDelivererManager::manipulationCB_sub(geometry_msgs::Pose goal_pose){

    //muss noch ausgemessen werden
    if (goal_pose.position.y >=  -0.078118 & goal_pose.position.y <=  -0.078118){
        if(goal_pose.position.y >=  0.450284 & goal_pose.position.y <=  0.450284){
            if(goal_pose.position.z >= -0.400000 & goal_pose.position.z <= -0.400000){
                received_goal_pose = goal_pose;
                pose_received = true;
            }
        }
    }
    state_manager_result.result_code = 301;
}




// ------------------------
//   ROS Node Execution
// ------------------------
int main(int argc, char* argv[])
{

  ros::init(argc, argv, "motion_executor_cup_picker");
  ros::NodeHandle priv_nh("~");
  ros::NodeHandle nh;

  CupDelivererManager mecp(priv_nh);

  ROS_INFO("Starting Motion Executor Cup Picker!");

  ros::spin();

  ROS_INFO("Motion Executor Cup Picker is terminating.");

  return 0;
}
