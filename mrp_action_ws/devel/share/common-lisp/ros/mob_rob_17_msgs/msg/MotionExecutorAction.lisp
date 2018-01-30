; Auto-generated. Do not edit!


(cl:in-package mob_rob_17_msgs-msg)


;//! \htmlinclude MotionExecutorAction.msg.html

(cl:defclass <MotionExecutorAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type mob_rob_17_msgs-msg:MotionExecutorActionGoal
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:MotionExecutorActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type mob_rob_17_msgs-msg:MotionExecutorActionResult
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:MotionExecutorActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type mob_rob_17_msgs-msg:MotionExecutorActionFeedback
    :initform (cl:make-instance 'mob_rob_17_msgs-msg:MotionExecutorActionFeedback)))
)

(cl:defclass MotionExecutorAction (<MotionExecutorAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionExecutorAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionExecutorAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mob_rob_17_msgs-msg:<MotionExecutorAction> is deprecated: use mob_rob_17_msgs-msg:MotionExecutorAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <MotionExecutorAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_goal-val is deprecated.  Use mob_rob_17_msgs-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <MotionExecutorAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_result-val is deprecated.  Use mob_rob_17_msgs-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <MotionExecutorAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mob_rob_17_msgs-msg:action_feedback-val is deprecated.  Use mob_rob_17_msgs-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionExecutorAction>) ostream)
  "Serializes a message object of type '<MotionExecutorAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionExecutorAction>) istream)
  "Deserializes a message object of type '<MotionExecutorAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionExecutorAction>)))
  "Returns string type for a message object of type '<MotionExecutorAction>"
  "mob_rob_17_msgs/MotionExecutorAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionExecutorAction)))
  "Returns string type for a message object of type 'MotionExecutorAction"
  "mob_rob_17_msgs/MotionExecutorAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionExecutorAction>)))
  "Returns md5sum for a message object of type '<MotionExecutorAction>"
  "117e6afe245919647b84e5922af456e2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionExecutorAction)))
  "Returns md5sum for a message object of type 'MotionExecutorAction"
  "117e6afe245919647b84e5922af456e2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionExecutorAction>)))
  "Returns full string definition for message of type '<MotionExecutorAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%MotionExecutorActionGoal action_goal~%MotionExecutorActionResult action_result~%MotionExecutorActionFeedback action_feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MotionExecutorGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%geometry_msgs/Pose goal_pose~%float32 gripper_close_val~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MotionExecutorResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%bool success~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MotionExecutorFeedback feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ---------- Feedback --------------~%#   Live feedback for debug purposes.~%string feedback ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionExecutorAction)))
  "Returns full string definition for message of type 'MotionExecutorAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%MotionExecutorActionGoal action_goal~%MotionExecutorActionResult action_result~%MotionExecutorActionFeedback action_feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%MotionExecutorGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# -------------- Goal --------------~%geometry_msgs/Pose goal_pose~%float32 gripper_close_val~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MotionExecutorResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ------------ Result --------------~%bool success~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%MotionExecutorFeedback feedback~%~%================================================================================~%MSG: mob_rob_17_msgs/MotionExecutorFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%# ---------- Feedback --------------~%#   Live feedback for debug purposes.~%string feedback ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionExecutorAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionExecutorAction>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionExecutorAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))