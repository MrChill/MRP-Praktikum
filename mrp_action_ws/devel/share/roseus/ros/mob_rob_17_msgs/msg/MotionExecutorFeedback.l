;; Auto-generated. Do not edit!


(when (boundp 'mob_rob_17_msgs::MotionExecutorFeedback)
  (if (not (find-package "MOB_ROB_17_MSGS"))
    (make-package "MOB_ROB_17_MSGS"))
  (shadow 'MotionExecutorFeedback (find-package "MOB_ROB_17_MSGS")))
(unless (find-package "MOB_ROB_17_MSGS::MOTIONEXECUTORFEEDBACK")
  (make-package "MOB_ROB_17_MSGS::MOTIONEXECUTORFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude MotionExecutorFeedback.msg.html


(defclass mob_rob_17_msgs::MotionExecutorFeedback
  :super ros::object
  :slots (_feedback ))

(defmethod mob_rob_17_msgs::MotionExecutorFeedback
  (:init
   (&key
    ((:feedback __feedback) "")
    )
   (send-super :init)
   (setq _feedback (string __feedback))
   self)
  (:feedback
   (&optional __feedback)
   (if __feedback (setq _feedback __feedback)) _feedback)
  (:serialization-length
   ()
   (+
    ;; string _feedback
    4 (length _feedback)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _feedback
       (write-long (length _feedback) s) (princ _feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _feedback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _feedback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mob_rob_17_msgs::MotionExecutorFeedback :md5sum-) "c14cdf907e5c7c7fd47292add15660f0")
(setf (get mob_rob_17_msgs::MotionExecutorFeedback :datatype-) "mob_rob_17_msgs/MotionExecutorFeedback")
(setf (get mob_rob_17_msgs::MotionExecutorFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

# ---------- Feedback --------------
#   Live feedback for debug purposes.
string feedback 


")



(provide :mob_rob_17_msgs/MotionExecutorFeedback "c14cdf907e5c7c7fd47292add15660f0")

