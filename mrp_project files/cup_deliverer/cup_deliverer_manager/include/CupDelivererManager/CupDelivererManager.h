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
#include <mob_rob_17_msgs/DeliverCupAction.h>

/**!
 * @brief Motion executor for the cup picker robot.
 *
 */
class CupDelivererManager
{
public:

  CupDelivererManager(ros::NodeHandle &nh);
  ~CupDelivererManager();

  void manipulationPreemptCB();
  void manipulationCB_as(const mob_rob_17_msgs::DeliverCupGoalConstPtr &goal);
  void manipulationCB_sub(geometry_msgs::Pose goal_pose);

private:
  
  actionlib::SimpleActionClient<mob_rob_17_msgs::MotionExecutorAction> motion_executor_ac;
  actionlib::SimpleActionServer<mob_rob_17_msgs::DeliverCupAction> state_manager_as;

  ros::Subscriber localization_sub;
  
  mob_rob_17_msgs::MotionExecutorResult motion_result;
  mob_rob_17_msgs::MotionExecutorFeedback motion_feedback;
  mob_rob_17_msgs::DeliverCupResult state_manager_result;
  mob_rob_17_msgs::DeliverCupFeedback state_manager_feedback;
  
  geometry_msgs::Pose received_goal_pose;
  bool pose_received;
  double gripper_close_val;
  
};
