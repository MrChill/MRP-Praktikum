#! /usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import actionlib
from mob_rob_17_msgs.msg import TransportCupAction, TransportCupFeedback, TransportCupGoal


def on_transport_cup_active():
    rospy.loginfo('Transport action is now active!')


def on_transport_cup_feedback(feedback):
    rospy.loginfo(feedback.feedback)


def on_transport_cup_done(goal_state, result):
    rospy.loginfo('Transport action terminated. Goal state: ' + str(goal_state) + '. Result: ' + str(result))
    rospy.signal_shutdown('Successfully executed the transport action.')


if __name__ == '__main__':
    rospy.init_node('cup_transport_client')
    transport = actionlib.SimpleActionClient('transport_cup', TransportCupAction)
    rospy.loginfo('Initialized transport action client. Waiting for server...')
    transport.wait_for_server()
    rospy.loginfo('Transport server is online! Sending goal...')
    transport.send_goal(TransportCupGoal(), on_transport_cup_done, on_transport_cup_active, on_transport_cup_feedback)
    rospy.spin()