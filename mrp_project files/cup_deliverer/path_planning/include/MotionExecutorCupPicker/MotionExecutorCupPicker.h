#include <vector>
#include <string>

#include <ros/ros.h>

// TFs for the pick and place poses
#include <tf/transform_listener.h>
#include <tf/transform_datatypes.h>

#include <fzi_manipulation_msgs/PlayTrajectoryAction.h>
#include <fzi_manipulation_msgs/LoadTrajectory.h>
#include <fzi_manipulation_msgs/TrajectoryDesignerSettings.h>
#include <fzi_manipulation_msgs/CartesianTrajectoryAction.h>
#include <fzi_manipulation_msgs/GripperAction.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/server/simple_action_server.h>
#include <mob_rob_17_msgs/MotionExecutorAction.h>


/**!
 * @brief Motion executor for the cup picker robot.
 *
 */
class MotionExecutorCupPicker
{
public:

  MotionExecutorCupPicker(ros::NodeHandle &nh);
  ~MotionExecutorCupPicker();

  void manipulationPreemptCB();
  //void manipulationCB(geometry_msgs::Pose goal_pose);
  void manipulationCB_as(const mob_rob_17_msgs::MotionExecutorGoalConstPtr &goal);

private:
  
  bool ExecuteMotion(geometry_msgs::Pose& goal_pose);  
  bool LoadAndExecutePath(const std::string &trajectory_name);
  bool MoveViaIK(const std::string &execution_command,  const geometry_msgs::Pose &offset);
  bool OperateGripper(bool close);

  std::vector<std::string> trajectories;

  actionlib::SimpleActionClient<fzi_manipulation_msgs::PlayTrajectoryAction> pathloader_ac;
  actionlib::SimpleActionClient<fzi_manipulation_msgs::CartesianTrajectoryAction> motion_interface_ac;
  actionlib::SimpleActionClient<fzi_manipulation_msgs::GripperAction> gripper_ac;
  actionlib::SimpleActionServer<mob_rob_17_msgs::MotionExecutorAction> cup_picker_as;

  //ros::Subscriber cup_position_sub;
  
  bool result;
  double max_vel_scaling_factor;
  double pathloader_velocity;
  double pathloader_acceleration;
  double gripper_open_val;
  double gripper_close_val;

  ros::ServiceClient load_traj_sc;
  ros::ServiceClient config_traj_sc;
  
  mob_rob_17_msgs::MotionExecutorResult action_result;
  mob_rob_17_msgs::MotionExecutorFeedback action_feedback;
};

 
