#! /usr/bin/env python

import rospy
import tf
from geometry_msgs.msg import Pose 
from geometry_msgs.msg import PoseWithCovarianceStamped
import sys
import pickle
import thread
import time
import os


file_dir = ""
pose = Pose()
i = '0'
def setkey(a):
    global i
    
    while True:
        i = sys. stdin.read(1)
	time.sleep(1)
        #rospy.logwarn(i)
def savepose(a):
    global pose
    
    
    while True:
	global i
        #rospy.logwarn(i)
        #time.sleep(1)
        if i=='1':
            
            pickle.dump(pose, open(file_dir+'pose1', 'w'))
            
            i = '0'
        if i=='2':
            pickle.dump(pose, open(file_dir+'pose2','w'))
            i = '0'
        





def get_pose_callback(msg):
    global pose
    pose = msg.pose.pose

def get_pose():
    global file_dir
    
    rospy.init_node('get_pose', anonymous=True)
    rate = rospy.Rate(2) #2hz
    file_dir = rospy.get_param("/save_dir")
    thread.start_new_thread(setkey, ('t1',))
    thread.start_new_thread(savepose, ('t2',))
    
    while not rospy.is_shutdown():
        rospy.Subscriber('amcl_pose', PoseWithCovarianceStamped, get_pose_callback)


        rate.sleep()
        
if __name__ == '__main__':
    try:
        get_pose()
    except rospy.ROSInterruptException:
        pass
