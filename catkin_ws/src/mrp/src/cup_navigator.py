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
from deliver import *


def random_duration(min=0.0, max=1.5):
    """
    :return: A random duration in seconds between *min* and *max*.
    """
    return random.uniform(min, max)


class CupNavigator(actionlib.SimpleActionServer, object):
    def __init__(self):
        super(CupNavigator, self).__init__('navigate_cup', NavigateCupAction, self.execute, False)
        rospy.loginfo('Initialized cup navigator dummy!')

    def execute(self, goal):
        if goal.destination == CupDestination.Acceptor:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup acceptor...'))
            goal = True
            aim = goal
            deliver_coffee(aim)
            self.publish_result(NavigateCupResult('Navigated to cup acceptor successfully!'))
            
        elif goal.destination == CupDestination.Deliverer:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup deliverer...'))
            goal = False
            aim = goal
            deliver_coffee(aim)
            self.publish_result(NavigateCupResult('Navigated to cup deliverer successfully!'))

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

