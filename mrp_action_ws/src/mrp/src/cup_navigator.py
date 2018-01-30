#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import sleep
import random


import rospy
import actionlib
from mob_rob_17_msgs.msg import *
from cup_transport.common import *

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from actionlib_msgs.msg import GoalStatusArray
from std_msgs.msg import String
import pickle
import time

WAIT = -1
ACTIVE = 1
goal_stat = ACTIVE	# goal status
rob1_stat = ""
rob2_stat = ""

def random_duration(min=0.0, max=1.5):
    """
    :return: A random duration in seconds between *min* and *max*.
    """
    return random.uniform(min, max)


class CupNavigator(actionlib.SimpleActionServer, object):
    def __init__(self):
        global goal_stat
        global rob1_stat
        global rob2_stat
        
        super(CupNavigator, self).__init__('navigate_cup', NavigateCupAction, self.execute, False)
        rospy.loginfo('Initialized cup navigator!')
        
        
     

    def execute(self, goal):
        if goal.destination == CupDestination.Acceptor:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup acceptor...'))
        elif goal.destination == CupDestination.Deliverer:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup deliverer...'))
			#navigation
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
			#rospy.Subscriber('rob1_stat', String, rob1_stat_callback)
			#rospy.Subscriber('rob2_stat', String, rob2_stat_callback)

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
                self.publish_feedback(NavigateCupFeedback('Arrived at ' + goal.destination + '!'))
			    self.set_succeeded(AcceptCupResult(NavigationResult.SUCCESS))
				goal_stat = WAIT


				elif robot_stat is RUN and pose is 2:
				robot_stat = ARRIVE2
                self.publish_feedback(NavigateCupFeedback('Arrived at ' + goal.destination + '!'))
			    self.set_succeeded(AcceptCupResult(NavigationResult.SUCCESS))
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

		else:
            self.publish_feedback(NavigateCupFeedback('Received illegal goal destination: ' + goal.destination))
            self.set_aborted(NavigateCupResult(NavigationResult.UNKNOWN_ERROR))
            return
        sleep(random_duration())
		
			self.publish_feedback(NavigateCupFeedback('Arrived at ' + goal.destination + '!'))
			self.set_succeeded(AcceptCupResult(NavigationResult.SUCCESS))

    

def main():
    """
    Starts dummy action servers for the
        - 'cup_navigator'
	"""
    rospy.init_node('cup_navigator')

    CupNavigator().start()


    rospy.spin()
   
    

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass

