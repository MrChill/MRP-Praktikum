; Auto-generated. Do not edit!


(cl:in-package mob_rob_17_msgs-msg)


;//! \htmlinclude AcceptCupAction.msg.html

(cl:defclass <AcceptCupAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type mob_rob_17_msgs-msg:AcceptCupActionGoal
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:AcceptCupActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type mob_rob_17_msgs-msg:AcceptCupActionResult
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:AcceptCupActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type mob_rob_17_msgs-msg:AcceptCupActionFeedback
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:AcceptCupActionFeedback)))
)

(cl:defclass AcceptCupAction (<AcceptCupAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AcceptCupAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AcceptCupAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mob_rob_17_msgs-msg:<AcceptCupAction> is deprecated: use mob_rob_17_msgs-msg:AcceptCupAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <AcceptCupAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_goal-val is deprecated.  Use mob_rob_17_msgs-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <AcceptCupAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_result-val is deprecated.  Use mob_rob_17_msgs-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <AcceptCupAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_feedback-val is deprecated.  Use mob_rob_17_msgs-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AcceptCupAction>) ostream)
  "Serializes a message object of type '<AcceptCupAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AcceptCupAction>) istream)
  "Deserializes a message object of type '<AcceptCupAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AcceptCupAction>)))
  "Returns string type for a message object of type '<AcceptCupAction>"
  "mob_rob_17_msgs/AcceptCupAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AcceptCupAction)))
  "Returns string type for a message object of type 'AcceptCupAction"
  "mob_rob_17_msgs/AcceptCupAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AcceptCupAction>)))
  "Returns md5sum for a message object of type '<AcceptCupAction>"
  "5f9591ce0d0424f3950df71fd1f7177f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AcceptCupAction)))
  "Returns md5sum for a message object of type 'AcceptCupAction"
  "5f9591ce0d0424f3950df71fd1f7177f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AcceptCupAction>)))
  "Returns full string definition for message of type '<AcceptCupAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%AcceptCupActionGoal action_goal~%AcceptCupActionResult action_result~%AcceptCupActionFeedback action_feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%AcceptCupGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%#   No information required.~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%AcceptCupResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%#   Whether cup was successfully accepted from the user~%#   and placed on the mobile platform or which kind of failure~%#   occurred.~%#   Error codes:~%#     200 Success.~%#     301 Cup not reachable.~%#     302 Mobile platform not reachable.~%#     401 Cup not found.~%#     402 Mobile platform not found.~%#     500 Path planning failed.~%#     600 Unknown.~%~%uint16 result_code~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%AcceptCupFeedback feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ---------- Feedback --------------~%#   Live feedback for debug purposes.~%string feedback~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AcceptCupAction)))
  "Returns full string definition for message of type 'AcceptCupAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%AcceptCupActionGoal action_goal~%AcceptCupActionResult action_result~%AcceptCupActionFeedback action_feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%AcceptCupGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%#   No information required.~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%AcceptCupResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%#   Whether cup was successfully accepted from the user~%#   and placed on the mobile platform or which kind of failure~%#   occurred.~%#   Error codes:~%#     200 Success.~%#     301 Cup not reachable.~%#     302 Mobile platform not reachable.~%#     401 Cup not found.~%#     402 Mobile platform not found.~%#     500 Path planning failed.~%#     600 Unknown.~%~%uint16 result_code~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%AcceptCupFeedback feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/AcceptCupFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ---------- Feedback --------------~%#   Live feedback for debug purposes.~%string feedback~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AcceptCupAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AcceptCupAction>))
  "Converts a ROS message object to a list"
  (cl:list 'AcceptCupAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))