; Auto-generated. Do not edit!


(cl:in-package mrp_action-msg)


;//! \htmlinclude cup_navigatorGoal.msg.html

(cl:defclass <cup_navigatorGoal> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type cl:integer
    :initform 0))
)

(cl:defclass cup_navigatorGoal (<cup_navigatorGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cup_navigatorGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cup_navigatorGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mrp_action-msg:<cup_navigatorGoal> is deprecated: use mrp_action-msg:cup_navigatorGoal instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <cup_navigatorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mrp_action-msg:pose-val is deprecated.  Use mrp_action-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cup_navigatorGoal>) ostream)
  "Serializes a message object of type '<cup_navigatorGoal>"
  (cl:let* ((signed (cl:slot-value msg 'pose)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cup_navigatorGoal>) istream)
  "Deserializes a message object of type '<cup_navigatorGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pose) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cup_navigatorGoal>)))
  "Returns string type for a message object of type '<cup_navigatorGoal>"
  "mrp_action/cup_navigatorGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cup_navigatorGoal)))
  "Returns string type for a message object of type 'cup_navigatorGoal"
  "mrp_action/cup_navigatorGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cup_navigatorGoal>)))
  "Returns md5sum for a message object of type '<cup_navigatorGoal>"
  "d44f52d3d32c29788eac455c41de3a94")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cup_navigatorGoal)))
  "Returns md5sum for a message object of type 'cup_navigatorGoal"
  "d44f52d3d32c29788eac455c41de3a94")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cup_navigatorGoal>)))
  "Returns full string definition for message of type '<cup_navigatorGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%int32 pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cup_navigatorGoal)))
  "Returns full string definition for message of type 'cup_navigatorGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal definition~%int32 pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cup_navigatorGoal>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cup_navigatorGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'cup_navigatorGoal
    (cl:cons ':pose (pose msg))
))