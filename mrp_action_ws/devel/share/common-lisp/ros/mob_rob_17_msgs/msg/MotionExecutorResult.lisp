; Auto-generated. Do not edit!


(cl:in-package mob_rob_17_msgs-msg)


;//! \htmlinclude MotionExecutorResult.msg.html

(cl:defclass <MotionExecutorResult> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MotionExecutorResult (<MotionExecutorResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionExecutorResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionExecutorResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mob_rob_17_msgs-msg:<MotionExecutorResult> is deprecated: use mob_rob_17_msgs-msg:MotionExecutorResult instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MotionExecutorResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:success-val is deprecated.  Use mob_rob_17_msgs-msg:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionExecutorResult>) ostream)
  "Serializes a message object of type '<MotionExecutorResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionExecutorResult>) istream)
  "Deserializes a message object of type '<MotionExecutorResult>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionExecutorResult>)))
  "Returns string type for a message object of type '<MotionExecutorResult>"
  "mob_rob_17_msgs/MotionExecutorResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionExecutorResult)))
  "Returns string type for a message object of type 'MotionExecutorResult"
  "mob_rob_17_msgs/MotionExecutorResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionExecutorResult>)))
  "Returns md5sum for a message object of type '<MotionExecutorResult>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionExecutorResult)))
  "Returns md5sum for a message object of type 'MotionExecutorResult"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionExecutorResult>)))
  "Returns full string definition for message of type '<MotionExecutorResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionExecutorResult)))
  "Returns full string definition for message of type 'MotionExecutorResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionExecutorResult>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionExecutorResult>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionExecutorResult
    (cl:cons ':success (success msg))
))