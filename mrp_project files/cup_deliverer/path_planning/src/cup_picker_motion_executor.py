# -*- coding: utf-8 -*-
"""
Created on Mon Jan 15 12:39:15 2018



@author: Moritz Renftle
"""

import rospy
import actionlib

from fzi_manipulation.msg import PlayTrajectoryAction, CartesianTrajectoryAction, GripperAction

class CupPickerMotionExecutor:
    def __init__(self, node_name="cup_picker_motion_executor",
                 namespace="cup_picker"):
        self.node_name = node_name
        rospy.init_node(self.node_name)
        
        pathloader = actionlib.SimpleActionClient(namespace + "/pathloader",
                                                  PlayTrajectoryAction)
        rospy.loginfo("Waiting for Pathloader Action Server ...")
        pathloader.wait_for_server()
        rospy.loginfo("Found it!")
        
        motion_interface = actionlib.SimpleActionClient(namespace +
            "/motion_interface/trac_ik", CartesianTrajectoryAction)
        rospy.loginfo("Waiting for Motion Interface Action Server ...")
        motion_interface.wait_for_server()
        rospy.loginfo("Found it!")
        
        gripper = actionlib.SimpleActionClient(namespace +
            "/schunk_canopen_gripper_node/gripper_control", GripperAction)
        rospy.loginfo("Waiting for Gripper Action Server ...")
        gripper.wait_for_server()
        rospy.loginfo("Found it!")


if __name__ == "__main__":
    e = CupPickerMotionExecutor()
