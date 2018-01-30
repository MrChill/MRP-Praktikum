#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <mob_rob_17_msgs/MotionExecutorAction.h>

int main (int argc, char **argv)
{
  ros::init(argc, argv, "test_client");

  // create the action client
  // true causes the client to spin its own thread
  actionlib::SimpleActionClient<mob_rob_17_msgs::MotionExecutorAction> ac("MotionExecutorCupPicker", true);

  // wait for the action server to start
  ROS_INFO("Waiting for action server to start.");
  ac.waitForServer();
  ROS_INFO("Action server started, sending goal.");

  // send a goal to the action
  mob_rob_17_msgs::MotionExecutorGoal goal;
  goal.goal_pose.position.x = -0.078118;
  goal.goal_pose.position.y =  0.450284;
  goal.goal_pose.position.z = -0.400000;
  goal.goal_pose.orientation.x = 1.0;
  goal.goal_pose.orientation.y = 0.0;
  goal.goal_pose.orientation.z = 0.0;
  goal.goal_pose.orientation.w = 0.000296327;
  goal.gripper_close_val = 0.02;

  ROS_INFO("Send goal pose: (%f, %f, %f - %f, %f, %f, %f)", goal.goal_pose.position.x, goal.goal_pose.position.y, goal.goal_pose.position.z, goal.goal_pose.orientation.x, goal.goal_pose.orientation.y, goal.goal_pose.orientation.z, goal.goal_pose.orientation.w );

  ac.sendGoal(goal);

  //wait for the action to return
  bool finished_before_timeout = ac.waitForResult(ros::Duration(180.0));

  if (finished_before_timeout)
  {
    actionlib::SimpleClientGoalState state = ac.getState();
    ROS_INFO("Action finished: %s",state.toString().c_str());
  }
  else
    ROS_INFO("Action did not finish before the time out.");

  //exit
  return 0;
}
