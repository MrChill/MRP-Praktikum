#! /usr/bin/env python
# -*- coding: utf-8 -*-

from time import sleep
import random

import rospy
import actionlib
from mob_rob_17_msgs.msg import *
from cup_transport.common import *


def rare_occasion():
    """
    :return: either true or false. P(true) = 0.1 < 0.9 = P(false).
    """
    return False
    # return bool(random.random() > 0.9)


def random_duration(min=0.0, max=1.5):
    """
    :return: A random duration in seconds between *min* and *max*.
    """
    return random.uniform(min, max)


class CupAcceptorDummy(actionlib.SimpleActionServer, object):
    def __init__(self):
        super(CupAcceptorDummy, self).__init__('accept_cup', AcceptCupAction, self.execute, False)
        rospy.loginfo('Initialized cup acceptor dummy!')

    def execute(self, goal):
        self.publish_feedback(AcceptCupFeedback('Searching cup...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an error in the cup localization.
            self.set_aborted(AcceptCupResult(CupGraspResult.CUP_NOT_FOUND))
            return
        self.publish_feedback(AcceptCupFeedback('Localized cup! Searching turtlebot...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an error in the platform localization.
            self.set_aborted(AcceptCupResult(CupGraspResult.PLATFORM_NOT_FOUND))
            return
        self.publish_feedback(AcceptCupFeedback('Localized turtlebot! Path planning...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an error related to path planning
            error = random.choice([CupGraspResult.PLANNING_FAILED,
                                   CupGraspResult.CUP_NOT_REACHABLE,
                                   CupGraspResult.PLATFORM_NOT_REACHABLE])
            self.set_aborted(AcceptCupResult(error))
            return
        self.publish_feedback(AcceptCupFeedback('Found path plan. Moving to cup...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an unknown error (e.g. the robot hit an obstacle)
            self.set_aborted(AcceptCupResult(CupGraspResult.UNKNOWN_ERROR))

        self.publish_feedback(AcceptCupFeedback('Arrived at cup! Grasping...'))
        sleep(random_duration())

        self.publish_feedback(AcceptCupFeedback('Grasped cup! Moving to turtlebot...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an unknown error (e.g. the robot hit an obstacle)
            self.set_aborted(AcceptCupResult(CupGraspResult.UNKNOWN_ERROR))

        self.publish_feedback(AcceptCupFeedback('Cup was successfully placed on the turtlebot!'))
        self.set_succeeded(AcceptCupResult(CupGraspResult.SUCCESS))


class CupNavigatorDummy(actionlib.SimpleActionServer, object):
    def __init__(self):
        super(CupNavigatorDummy, self).__init__('navigate_cup', NavigateCupAction, self.execute, False)
        rospy.loginfo('Initialized cup navigator dummy!')

    def execute(self, goal):
        if goal.destination == CupDestination.Acceptor:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup acceptor...'))
        elif goal.destination == CupDestination.Deliverer:
            self.publish_feedback(NavigateCupFeedback('Navigating to cup deliverer...'))
        else:
            self.publish_feedback(NavigateCupFeedback('Received illegal goal destination: ' + goal.destination))
            self.set_aborted(NavigateCupResult(NavigationResult.UNKNOWN_ERROR))
            return
        sleep(random_duration())

        self.publish_feedback(NavigateCupFeedback('Arrived at ' + goal.destination + '!'))
        self.set_succeeded(AcceptCupResult(NavigationResult.SUCCESS))


class CupDelivererDummy(actionlib.SimpleActionServer, object):
    def __init__(self):
        super(CupDelivererDummy, self).__init__('deliver_cup', DeliverCupAction, self.execute, False)
        rospy.loginfo('Initialized cup deliverer dummy!')

    def execute(self, goal):
        self.publish_feedback(DeliverCupFeedback('Searching cup...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an error in the cup localization.
            self.set_aborted(DeliverCupResult(CupGraspResult.CUP_NOT_FOUND))
            return
        self.publish_feedback(DeliverCupFeedback('Localized cup! Path planning...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an error related to path planning
            error = random.choice([CupGraspResult.PLANNING_FAILED,
                                   CupGraspResult.CUP_NOT_REACHABLE,
                                   CupGraspResult.PLATFORM_NOT_REACHABLE])
            self.set_aborted(DeliverCupResult(error))
            return
        self.publish_feedback(DeliverCupFeedback('Found path plan. Moving to cup...'))
        sleep(random_duration())

        self.publish_feedback(DeliverCupFeedback('Arrived at cup! Grasping...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an unknown error (e.g. the robot hit an obstacle)
            self.set_aborted(DeliverCupResult(CupGraspResult.UNKNOWN_ERROR))

        self.publish_feedback(DeliverCupFeedback('Grasped cup! Moving to table...'))
        sleep(random_duration())

        if rare_occasion():
            # we simulate an unknown error (e.g. the robot hit an obstacle)
            self.set_aborted(DeliverCupResult(CupGraspResult.UNKNOWN_ERROR))

        self.publish_feedback(DeliverCupFeedback('Cup was successfully placed on the table!'))
        self.set_succeeded(DeliverCupResult(CupGraspResult.SUCCESS))


dummy_servers = {
    'cup_acceptor': CupAcceptorDummy,
    'cup_navigator': CupNavigatorDummy,
    'cup_deliverer': CupDelivererDummy,
}


def main(robot_names):
    """
    Starts dummy action servers for the specified *robot_names*
    (a list of robot names). Possible robot names are:
        - 'cup_acceptor'
        - 'cup_navigator'
        - 'cup_deliverer'

    :param robot_names: list of robot names to start in dummy mode
    """
    rospy.init_node('cup_dummy_robots')

    for robot_name in robot_names:
        dummy_servers[robot_name]().start()
    rospy.spin()


if __name__ == '__main__':
    main(sys.argv[1:])