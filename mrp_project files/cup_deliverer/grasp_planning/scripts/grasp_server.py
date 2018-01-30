#!/usr/bin/env python

"""
Server: grasper
Client: robot
"""

from grasp_planning.srv import *
import rospy

def handle_grasping(request):
    print "request received"
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
    s = rospy.Service('grasping', Grasp_service, handle_grasping)
    print "Ready for Grasping"
    rospy.spin()
    
if __name__ == "__main__":
    init_grasping_server()
    