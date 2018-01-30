   1 #! /usr/bin/env python
   2 
   3 import rospy
   4 
   5 import actionlib
   6 
   7 import mrp_action.msg
   8 
   9 class FibonacciAction(object):
  10     # create messages that are used to publish feedback/result
  11     _feedback = actionlib_tutorials.msg.FibonacciFeedback()
  12     _result = actionlib_tutorials.msg.FibonacciResult()
  13 
  14     def __init__(self, name):
  15         self._action_name = name
  16         self._as = actionlib.SimpleActionServer(self._action_name, actionlib_tutorials.msg.FibonacciAction, execute_cb=self.execute_cb, auto_start = False)
  17         self._as.start()
  18       
  19     def execute_cb(self, goal):
  20         # helper variables
  21         r = rospy.Rate(1)
  22         success = True
  23         
  24         # append the seeds for the fibonacci sequence
  25         self._feedback.sequence = []
  26         self._feedback.sequence.append(0)
  27         self._feedback.sequence.append(1)
  28         
  29         # publish info to the console for the user
  30         rospy.loginfo('%s: Executing, creating fibonacci sequence of order %i with seeds %i, %i' % (self._action_name, goal.order, self._feedback.sequence[0], self._feedback.sequence[1]))
  31         
  32         # start executing the action
  33         for i in range(1, goal.order):
  34             # check that preempt has not been requested by the client
  35             if self._as.is_preempt_requested():
  36                 rospy.loginfo('%s: Preempted' % self._action_name)
  37                 self._as.set_preempted()
  38                 success = False
  39                 break
  40             self._feedback.sequence.append(self._feedback.sequence[i] + self._feedback.sequence[i-1])
  41             # publish the feedback
  42             self._as.publish_feedback(self._feedback)
  43             # this step is not necessary, the sequence is computed at 1 Hz for demonstration purposes
  44             r.sleep()
  45           
  46         if success:
  47             self._result.sequence = self._feedback.sequence
  48             rospy.loginfo('%s: Succeeded' % self._action_name)
  49             self._as.set_succeeded(self._result)
  50         
  51 if __name__ == '__main__':
  52     rospy.init_node('fibonacci')
  53     server = FibonacciAction(rospy.get_name())
  54     rospy.spin()
