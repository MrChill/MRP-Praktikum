; Auto-generated. Do not edit!


(cl:in-package mrp_action-msg)


;//! \htmlinclude cup_navigatorResult.msg.html

(cl:defclass <cup_navigatorResult> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass cup_navigatorResult (<cup_navigatorResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cup_navigatorResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cup_navigatorResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mrp_action-msg:<cup_navigatorResult> is deprecated: use mrp_action-msg:cup_navigatorResult instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <cup_navigatorResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mrp_action-msg:success-val is deprecated.  Use mrp_action-msg:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cup_navigatorResult>) ostream)
  "Serializes a message object of type '<cup_navigatorResult>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'success))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'success))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cup_navigatorResult>) istream)
  "Deserializes a message object of type '<cup_navigatorResult>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'success) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'success)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cup_navigatorResult>)))
  "Returns string type for a message object of type '<cup_navigatorResult>"
  "mrp_action/cup_navigatorResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cup_navigatorResult)))
  "Returns string type for a message object of type 'cup_navigatorResult"
  "mrp_action/cup_navigatorResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cup_navigatorResult>)))
  "Returns md5sum for a message object of type '<cup_navigatorResult>"
  "bcd843eceece790591c2fbaefc95fa7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cup_navigatorResult)))
  "Returns md5sum for a message object of type 'cup_navigatorResult"
  "bcd843eceece790591c2fbaefc95fa7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cup_navigatorResult>)))
  "Returns full string definition for message of type '<cup_navigatorResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32[] success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cup_navigatorResult)))
  "Returns full string definition for message of type 'cup_navigatorResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result definition~%int32[] success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cup_navigatorResult>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'success) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cup_navigatorResult>))
  "Converts a ROS message object to a list"
  (cl:list 'cup_navigatorResult
    (cl:cons ':success (success msg))
))