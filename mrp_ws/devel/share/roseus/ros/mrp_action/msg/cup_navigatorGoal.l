;; Auto-generated. Do not edit!


(when (boundp 'mrp_action::cup_navigatorGoal)
  (if (not (find-package "MRP_ACTION"))
    (make-package "MRP_ACTION"))
  (shadow 'cup_navigatorGoal (find-package "MRP_ACTION")))
(unless (find-package "MRP_ACTION::CUP_NAVIGATORGOAL")
  (make-package "MRP_ACTION::CUP_NAVIGATORGOAL"))

(in-package "ROS")
;;//! \htmlinclude cup_navigatorGoal.msg.html


(defclass mrp_action::cup_navigatorGoal
  :super ros::object
  :slots (_pose ))

(defmethod mrp_action::cup_navigatorGoal
  (:init
   (&key
    ((:pose __pose) 0)
    )
   (send-super :init)
   (setq _pose (round __pose))
   self)
  (:pose
   (&optional __pose)
   (if __pose (setq _pose __pose)) _pose)
  (:serialization-length
   ()
   (+
    ;; int32 _pose
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _pose
       (write-long _pose s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _pose
     (setq _pose (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mrp_action::cup_navigatorGoal :md5sum-) "d44f52d3d32c29788eac455c41de3a94")
(setf (get mrp_action::cup_navigatorGoal :datatype-) "mrp_action/cup_navigatorGoal")
(setf (get mrp_action::cup_navigatorGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal definition
int32 pose

")



(provide :mrp_action/cup_navigatorGoal "d44f52d3d32c29788eac455c41de3a94")

