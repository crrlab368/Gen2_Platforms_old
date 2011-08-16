; Auto-generated. Do not edit!


(cl:in-package gen2_motor_driver-msg)


;//! \htmlinclude pid_plot.msg.html

(cl:defclass <pid_plot> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (left_vel
    :reader left_vel
    :initarg :left_vel
    :type cl:float
    :initform 0.0)
   (right_vel
    :reader right_vel
    :initarg :right_vel
    :type cl:float
    :initform 0.0)
   (gyro_val
    :reader gyro_val
    :initarg :gyro_val
    :type cl:integer
    :initform 0))
)

(cl:defclass pid_plot (<pid_plot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pid_plot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pid_plot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gen2_motor_driver-msg:<pid_plot> is deprecated: use gen2_motor_driver-msg:pid_plot instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:header-val is deprecated.  Use gen2_motor_driver-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'left_vel-val :lambda-list '(m))
(cl:defmethod left_vel-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:left_vel-val is deprecated.  Use gen2_motor_driver-msg:left_vel instead.")
  (left_vel m))

(cl:ensure-generic-function 'right_vel-val :lambda-list '(m))
(cl:defmethod right_vel-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:right_vel-val is deprecated.  Use gen2_motor_driver-msg:right_vel instead.")
  (right_vel m))

(cl:ensure-generic-function 'gyro_val-val :lambda-list '(m))
(cl:defmethod gyro_val-val ((m <pid_plot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:gyro_val-val is deprecated.  Use gen2_motor_driver-msg:gyro_val instead.")
  (gyro_val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pid_plot>) ostream)
  "Serializes a message object of type '<pid_plot>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
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
  (cl:let* ((signed (cl:slot-value msg 'gyro_val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pid_plot>) istream)
  "Deserializes a message object of type '<pid_plot>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gyro_val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
  "5612a4a535c3e74f157826b8bff1e050")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pid_plot)))
  "Returns md5sum for a message object of type 'pid_plot"
  "5612a4a535c3e74f157826b8bff1e050")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pid_plot>)))
  "Returns full string definition for message of type '<pid_plot>"
  (cl:format cl:nil "Header header~%float32 left_vel~%float32 right_vel~%int32 gyro_val~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pid_plot)))
  "Returns full string definition for message of type 'pid_plot"
  (cl:format cl:nil "Header header~%float32 left_vel~%float32 right_vel~%int32 gyro_val~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pid_plot>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pid_plot>))
  "Converts a ROS message object to a list"
  (cl:list 'pid_plot
    (cl:cons ':header (header msg))
    (cl:cons ':left_vel (left_vel msg))
    (cl:cons ':right_vel (right_vel msg))
    (cl:cons ':gyro_val (gyro_val msg))
))
