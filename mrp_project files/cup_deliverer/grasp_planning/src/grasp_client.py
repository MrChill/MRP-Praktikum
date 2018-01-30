#!/usr/bin/env python

"""
Server: grasper
Client: robot
"""

import sys
import rospy
from grasp_planning.srv import *

"""
Roboter = Client
@para request: 'open' if grasp should be opened, 'close' if grasp should be closed 
"""
def grasping_client(request):
    rospy.wait_for_service('grasping')
    try:
        grasping = rospy.ServiceProxy('grasping', Grasping)
        #bool response        
        response = grasping(request)
        return response #true if grasp_closed else false if grasp_open
    except rospy.ServiceException, e:
            print "Service call failed: %s " %e
    

if __name__ == "__main__":
    request = str(sys.argv[1])
    print "Got a grasping Request. grasper_closed is now "  + grasping_client(request)
    
    #grasping_client(request)
