; Auto-generated. Do not edit!


(cl:in-package mob_rob_17_msgs-msg)


;//! \htmlinclude TransportCupGoal.msg.html

(cl:defclass <TransportCupGoal> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass TransportCupGoal (<TransportCupGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TransportCupGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TransportCupGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mob_rob_17_msgs-msg:<TransportCupGoal> is deprecated: use mob_rob_17_msgs-msg:TransportCupGoal instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TransportCupGoal>) ostream)
  "Serializes a message object of type '<TransportCupGoal>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TransportCupGoal>) istream)
  "Deserializes a message object of type '<TransportCupGoal>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TransportCupGoal>)))
  "Returns string type for a message object of type '<TransportCupGoal>"
  "mob_rob_17_msgs/TransportCupGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TransportCupGoal)))
  "Returns string type for a message object of type 'TransportCupGoal"
  "mob_rob_17_msgs/TransportCupGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TransportCupGoal>)))
  "Returns md5sum for a message object of type '<TransportCupGoal>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TransportCupGoal)))
  "Returns md5sum for a message object of type 'TransportCupGoal"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TransportCupGoal>)))
  "Returns full string definition for message of type '<TransportCupGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%#   No information required.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TransportCupGoal)))
  "Returns full string definition for message of type 'TransportCupGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%#   No information required.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TransportCupGoal>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TransportCupGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TransportCupGoal
))