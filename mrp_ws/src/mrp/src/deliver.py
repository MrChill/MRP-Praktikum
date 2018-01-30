#! /usr/bin/env python

import rospy
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import GoalStatusArray
import actionlib
from std_msgs.msg import String
import pickle
import time

WAIT = -1
ACTIVE = 1
goal_stat = ACTIVE	# goal status
rob1_stat = ""
rob2_stat = ""


def stat_callback(msg):
    global goal_stat
    
    if goal_stat is not WAIT:
        goal_stat = msg.status_list[-1].status
    rospy.logwarn(goal_stat)

def rob1_stat_callback(msg):
    global rob1_stat 
    rob1_stat = msg.data
    #rospy.logwarn(rob1_stat)

def rob2_stat_callback(msg):
    global rob2_stat
    rob2_stat = msg.data
    

def deliver_coffee():
    global goal_stat
    global rob1_stat
    global rob2_stat
    # status for robot_stat, robot_stat is self defined robot status
    RUN = 'run'
    STOP = 'stop'
    ARRIVE1 = 'arrive1'
    ARRIVE2 = 'arrive2'
    
    # status for goal_stat, goal_stat is goal status
    WAIT = -1
    PENDING = 0
    ACTIVE = 1
    PREEMPTED = 2
    SUCCEEDED = 3

    goal_stat = ACTIVE
    robot_stat = RUN
    


    stat_pub = rospy.Publisher('stat', String, queue_size=10)
    rospy.init_node('deliver_coffee', anonymous=True)
    rate = rospy.Rate(2)
    file_dir = rospy.get_param("/save_dir")
    pose1 = pickle.load(open(file_dir+'pose1', 'r'))
    pose2 = pickle.load(open(file_dir+'pose2', 'r'))
    move_base = actionlib.SimpleActionClient('move_base', MoveBaseAction)

    move_base.wait_for_server()

    goal_sent = False
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = 'map'
    goal.target_pose.pose = pose1
    pose = 1

    rospy.Subscriber('move_base/status', GoalStatusArray, stat_callback)
    rospy.Subscriber('rob1_stat', String, rob1_stat_callback)
    rospy.Subscriber('rob2_stat', String, rob2_stat_callback)

    while not rospy.is_shutdown():
        if not goal_sent and robot_stat is RUN:
            move_base.send_goal(goal)
            goal.target_pose.header.stamp = rospy.Time.now()
            goal_sent = True
	    goal_stat = ACTIVE
	if goal_stat is not WAIT:
	    pass

	if goal_stat is PREEMPTED or goal_stat>SUCCEEDED:
	    robot_stat = STOP
	    stat_pub.publish(robot_stat)
	    time.sleep(10)
	    

        if robot_stat is STOP and goal_stat>SUCCEEDED:
	    
	    #TODO process STOP stat
	    move_base.cancel_goal()
	    goal.target_pose.header.frame_id = 'base_link'
	    goal.target_pose.header.stamp = rospy.Time.now()
	    goal.target_pose.pose.position.x = 0.2 
            goal.target_pose.pose.orientation.w = 1.0
	    move_base.send_goal(goal)
	    move_base.wait_for_result()
	    goal.target_pose.header.frame_id = 'map'
	    if pose is 1:
		goal.target_pose.pose = pose1
	    else:
		goal.target_pose.pose = pose2
	    goal_sent = False
	    robot_stat = RUN

	elif goal_stat is SUCCEEDED:
	    if robot_stat is RUN and pose is 1:
		robot_stat = ARRIVE1
		goal_stat = WAIT
		
		
	    elif robot_stat is RUN and pose is 2:
		robot_stat = ARRIVE2
		goal_stat = WAIT

	elif goal_stat is WAIT:
	    if robot_stat is ARRIVE1 and rob1_stat == 'finish':
			#TODO subscript topic of robot 1
	        
		goal_sent = False
		goal.target_pose.pose = pose2
    		pose = 2
		robot_stat = RUN
		    
		pass
	    elif robot_stat is ARRIVE2:
			#TODO subscript topic of robot 2
			#if ...
		pass
		
	stat_pub.publish(robot_stat)
	    
        rate.sleep()
    

if __name__ == '__main__':
    try:
        deliver_coffee()
    except rospy.ROSInterruptException:
        pass
