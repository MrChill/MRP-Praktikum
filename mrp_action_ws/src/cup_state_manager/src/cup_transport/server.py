#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 18 13:45:41 2018

The state manager controls the individual robots
and represents the state of the whole system.

@author: Moritz Renftle
"""

import rospy
import actionlib
import threading

from cup_transport.common import *

from mob_rob_17_msgs.msg import *

"""
ActionServer responsible for the complete system consisting of
the three robots
  - cup acceptor
  - cup navigator
  - cup deliverer

Provides the "transport cup" action that starts and controls
all three robots until the cup was transported from the start table
to the goal table.
"""


class CupTransportServer(actionlib.SimpleActionServer, object):
    """
    ActionServer responsible for the complete system consisting of
    the three robots
        - cup acceptor
        - cup navigator
        - cup deliverer

    Provides the *TransportCup* action that starts and controls
    all three robots until the cup was transported from the start table
    to the goal table.
    """
    def __init__(self, action_name='transport_cup'):
        rospy.loginfo('Initializing...')
        super(CupTransportServer, self).__init__(action_name, TransportCupAction, self.execute, False)
        rospy.loginfo('Initialized!')
        self.state = CupState.Idle

        self.acceptor = actionlib.SimpleActionClient('accept_cup', AcceptCupAction)
        self.navigator = actionlib.SimpleActionClient('navigate_cup', NavigateCupAction)
        self.deliverer = actionlib.SimpleActionClient('deliver_cup', DeliverCupAction)

        self.success_flag = threading.Event()
        
    def publish_feedback(self, msg):
        msg = '[' + self.state + '] ' + msg
        super(CupTransportServer, self).publish_feedback(TransportCupFeedback(feedback=msg))
    
    def publish_new_state(self):
        msg = 'Entering new state: [' + self.state + ']'
        super(CupTransportServer, self).publish_feedback(TransportCupFeedback(feedback=msg))

    def fail(self, failed_robot_id, failed_robot_result_code):
        super(CupTransportServer, self).set_aborted(TransportCupResult(failed_robot_id, failed_robot_result_code))

    def execute(self, goal):
        """
        Starts the cup transport process.

        :param goal: empty goal
        """
        rospy.loginfo('Received request to transport cup!')
        self.navigate_to_acceptor()
        self.deliver_cup()
        # Stay here until the action completed.
        self.success_flag.wait()
        self.set_succeeded(TransportCupResult(result_code=TransportResult.SUCCESS))

    # ----------- STEP 1: Navigate the mobile platform to the acceptor. -----------

    def navigate_to_acceptor(self):
        self.navigator.wait_for_server()
        self.navigator.send_goal(NavigateCupGoal(destination=CupDestination.Acceptor),
                                 self.on_navigate_to_acceptor_done, self.on_navigate_to_acceptor_active,
                                 self.on_navigate_to_acceptor_feedback)

    def on_navigate_to_acceptor_active(self):
        self.state = CupState.NavigatingToAcceptor
        self.publish_new_state()

    def on_navigate_to_acceptor_feedback(self, feedback):
        self.publish_feedback('cup_navigator provided new feedback: ' + feedback.feedback)

    def on_navigate_to_acceptor_done(self, goal_state, result):
        self.publish_feedback('cup_navigator finished. Goal state: ' + str(goal_state) + '. Result: ' + str(result))
        if result.result_code == NavigationResult.SUCCESS:
            self.accept_cup()
        else:
            self.fail(Robots.CupNavigator, result.result_code)

    # ----------- STEP 2: Accept the cup from the user. -----------

    def accept_cup(self):
        self.acceptor.wait_for_server()
        self.acceptor.send_goal(AcceptCupGoal(), self.on_accept_cup_done, self.on_accept_cup_active,
                                self.on_accept_cup_feedback)

    def on_accept_cup_active(self):
        self.state = CupState.Accepting
        self.publish_new_state()

    def on_accept_cup_feedback(self, feedback):
        self.publish_feedback('cup_acceptor provided new feedback: ' + feedback.feedback)

    def on_accept_cup_done(self, goal_state, result):
        self.publish_feedback('cup_acceptor finished. Goal state: ' + str(goal_state) + '. Result: ' + str(result))
        if result.result_code == CupGraspResult.SUCCESS:
            self.navigate_to_deliverer()
        else:
            self.fail(Robots.CupAcceptor, result.result_code)

    # ----------- STEP 3: Navigate the cup to the deliverer. -----------

    def navigate_to_deliverer(self):
        self.navigator.wait_for_server()
        self.navigator.send_goal(NavigateCupGoal(CupDestination.Deliverer), self.on_navigate_to_deliverer_done,
                                 self.on_navigate_to_deliverer_active,
                                 self.on_navigate_to_deliverer_feedback)

    def on_navigate_to_deliverer_active(self):
        self.state = CupState.NavigatingToDeliverer
        self.publish_new_state()

    def on_navigate_to_deliverer_feedback(self, feedback):
        self.publish_feedback('cup_navigator provided new feedback: ' + feedback.feedback)

    def on_navigate_to_deliverer_done(self, goal_state, result):
        self.publish_feedback('cup_navigator finished. Goal state: ' + str(goal_state) + '. Result: ' + str(result))
        if result.result_code == NavigationResult.SUCCESS:
            self.deliver_cup()
        else:
            self.fail(Robots.CupNavigator, result.result_code)

    # ----------- STEP 4: Deliver the cup to the user. -----------

    def deliver_cup(self):
        rospy.loginfo('Waiting for cup deliverer to come online...')
        self.deliverer.wait_for_server()
        rospy.loginfo('Cup deliverer is online! Sending request to deliver cup...')
        self.deliverer.send_goal(DeliverCupGoal(), self.on_deliverer_done, self.on_deliverer_active,
                                 self.on_deliverer_feedback)

    def on_deliverer_active(self):
        self.state = CupState.Delivering
        self.publish_new_state()

    def on_deliverer_feedback(self, feedback):
        self.publish_feedback('cup_deliverer provided new feedback: ' + feedback.feedback)

    def on_deliverer_done(self, goal_state, result):
        self.publish_feedback('cup_deliverer finished. Goal state: ' + str(goal_state) + '. Result: ' + str(result))
        if result.result_code == CupGraspResult.SUCCESS:
            self.success_flag.set()
        else:
            self.fail(Robots.CupDeliverer, result.result_code)


def main():
    rospy.init_node('cup_transport_server')
    s = CupTransportServer()
    s.start()
    rospy.spin()


if __name__ == '__main__':
    main()
