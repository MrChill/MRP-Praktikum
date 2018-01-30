; Auto-generated. Do not edit!


(cl:in-package mob_rob_17_msgs-msg)


;//! \htmlinclude MotionExecutorGoal.msg.html

(cl:defclass <MotionExecutorGoal> (roslisp-msg-protocol:ros-message)
  ((goal_pose
    :reader goal_pose
    :initarg :goal_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (gripper_close_val
    :reader gripper_close_val
    :initarg :gripper_close_val
    :type cl:float
    :initform 0.0))
)

(cl:defclass MotionExecutorGoal (<MotionExecutorGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionExecutorGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionExecutorGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mob_rob_17_msgs-msg:<MotionExecutorGoal> is deprecated: use mob_rob_17_msgs-msg:MotionExecutorGoal instead.")))

(cl:ensure-generic-function 'goal_pose-val :lambda-list '(m))
(cl:defmethod goal_pose-val ((m <MotionExecutorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:goal_pose-val is deprecated.  Use mob_rob_17_msgs-msg:goal_pose instead.")
  (goal_pose m))

(cl:ensure-generic-function 'gripper_close_val-val :lambda-list '(m))
(cl:defmethod gripper_close_val-val ((m <MotionExecutorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:gripper_close_val-val is deprecated.  Use mob_rob_17_msgs-msg:gripper_close_val instead.")
  (gripper_close_val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionExecutorGoal>) ostream)
  "Serializes a message object of type '<MotionExecutorGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gripper_close_val))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionExecutorGoal>) istream)
  "Deserializes a message object of type '<MotionExecutorGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gripper_close_val) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionExecutorGoal>)))
  "Returns string type for a message object of type '<MotionExecutorGoal>"
  "mob_rob_17_msgs/MotionExecutorGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionExecutorGoal)))
  "Returns string type for a message object of type 'MotionExecutorGoal"
  "mob_rob_17_msgs/MotionExecutorGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionExecutorGoal>)))
  "Returns md5sum for a message object of type '<MotionExecutorGoal>"
  "04f6519cc2b7bf795da0507c01848460")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionExecutorGoal)))
  "Returns md5sum for a message object of type 'MotionExecutorGoal"
  "04f6519cc2b7bf795da0507c01848460")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionExecutorGoal>)))
  "Returns full string definition for message of type '<MotionExecutorGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%geometry_msgs/Pose goal_pose~%float32 gripper_close_val~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionExecutorGoal)))
  "Returns full string definition for message of type 'MotionExecutorGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%geometry_msgs/Pose goal_pose~%float32 gripper_close_val~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionExecutorGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_pose))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionExecutorGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionExecutorGoal
    (cl:cons ':goal_pose (goal_pose msg))
    (cl:cons ':gripper_close_val (gripper_close_val msg))
))