;; Auto-generated. Do not edit!


(when (boundp 'mob_rob_17_msgs::AcceptCupFeedback)
  (if (not (find-package "MOB_ROB_17_MSGS"))
    (make-package "MOB_ROB_17_MSGS"))
  (shadow 'AcceptCupFeedback (find-package "MOB_ROB_17_MSGS")))
(unless (find-package "MOB_ROB_17_MSGS::ACCEPTCUPFEEDBACK")
  (make-package "MOB_ROB_17_MSGS::ACCEPTCUPFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude AcceptCupFeedback.msg.html


(defclass mob_rob_17_msgs::AcceptCupFeedback
  :super ros::object
  :slots (_feedback ))

(defmethod mob_rob_17_msgs::AcceptCupFeedback
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

(setf (get mob_rob_17_msgs::AcceptCupFeedback :md5sum-) "c14cdf907e5c7c7fd47292add15660f0")
(setf (get mob_rob_17_msgs::AcceptCupFeedback :datatype-) "mob_rob_17_msgs/AcceptCupFeedback")
(setf (get mob_rob_17_msgs::AcceptCupFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

# ---------- Feedback --------------
#   Live feedback for debug purposes.
string feedback

")



(provide :mob_rob_17_msgs/AcceptCupFeedback "c14cdf907e5c7c7fd47292add15660f0")

