#!/usr/bin/env python

"""
Server: grasper
Client: robot
"""

import rospy
from grasp_planning.srv import *

 def handle_grasping(request):
    print request
    if (request == "close"):
        #Schliessen des Greifers
        return GraspingResponse(True)
    elif (request == "open"):
        #Oeffnen des Greifers
        return GraspingResponse(False)
    else: 
        print "unknown request"
    
def init_grasping_server():
    rospy.init_node('handle_grasping_server')
    s = rospy.Service('grasping', Grasping, handle_grasping)
    print "Ready for Grasping"
    rospy.spin()
    
if __name__ == "__main__":
    init_grasping_server()
    