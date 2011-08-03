; Auto-generated. Do not edit!


(cl:in-package gen2_motor_driver-msg)


;//! \htmlinclude pid_plot.msg.html

(cl:defclass <pid_plot> (roslisp-msg-protocol:ros-message)
  ((left_vel
    :reader left_vel
    :initarg :left_vel
    :type cl:float
    :initform 0.0)
   (right_vel
    :reader right_vel
    :initarg :right_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass pid_plot (<pid_plot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pid_plot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pid_plot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gen2_motor_driver-msg:<pid_plot> is deprecated: use gen2_motor_driver-msg:pid_plot instead.")))

(cl:ensure-generic-function 'left_vel-val :lambda-list '(m))
(cl:defmethod left_vel-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:left_vel-val is deprecated.  Use gen2_motor_driver-msg:left_vel instead.")
  (left_vel m))

(cl:ensure-generic-function 'right_vel-val :lambda-list '(m))
(cl:defmethod right_vel-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:right_vel-val is deprecated.  Use gen2_motor_driver-msg:right_vel instead.")
  (right_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pid_plot>) ostream)
  "Serializes a message object of type '<pid_plot>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pid_plot>) istream)
  "Deserializes a message object of type '<pid_plot>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_vel) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pid_plot>)))
  "Returns string type for a message object of type '<pid_plot>"
  "gen2_motor_driver/pid_plot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pid_plot)))
  "Returns string type for a message object of type 'pid_plot"
  "gen2_motor_driver/pid_plot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pid_plot>)))
  "Returns md5sum for a message object of type '<pid_plot>"
  "74ad8f7ea4d888606e4f41069cec47ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pid_plot)))
  "Returns md5sum for a message object of type 'pid_plot"
  "74ad8f7ea4d888606e4f41069cec47ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pid_plot>)))
  "Returns full string definition for message of type '<pid_plot>"
  (cl:format cl:nil "float32 left_vel~%float32 right_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pid_plot)))
  "Returns full string definition for message of type 'pid_plot"
  (cl:format cl:nil "float32 left_vel~%float32 right_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pid_plot>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pid_plot>))
  "Converts a ROS message object to a list"
  (cl:list 'pid_plot
    (cl:cons ':left_vel (left_vel msg))
    (cl:cons ':right_vel (right_vel msg))
))
