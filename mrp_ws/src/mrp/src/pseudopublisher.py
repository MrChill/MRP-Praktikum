#! /usr/bin/env python

import rospy
from std_msgs.msg import String


def send_msgs():

    FINISH = 'finish'

    pub1 = rospy.Publisher('rob1_stat', String, queue_size=10)
    pub2 = rospy.Publisher('rob2_stat', String, queue_size=10)
    
    rospy.init_node('pseudopubliser', anonymous=True)
    rate = rospy.Rate(0.1)

    while not rospy.is_shutdown():
	pub1.publish(FINISH)
	pub2.publish(FINISH)
        rate.sleep()

if __name__ == '__main__':
    
    try:
        send_msgs()
    except rospy.ROSInterruptException:
        pass
