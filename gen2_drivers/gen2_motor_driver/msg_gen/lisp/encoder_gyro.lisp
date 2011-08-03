; Auto-generated. Do not edit!


(cl:in-package gen2_motor_driver-msg)


;//! \htmlinclude encoder_gyro.msg.html

(cl:defclass <encoder_gyro> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (right_count
    :reader right_count
    :initarg :right_count
    :type cl:integer
    :initform 0)
   (left_count
    :reader left_count
    :initarg :left_count
    :type cl:integer
    :initform 0)
   (gyro_val
    :reader gyro_val
    :initarg :gyro_val
    :type cl:integer
    :initform 0))
)

(cl:defclass encoder_gyro (<encoder_gyro>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <encoder_gyro>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'encoder_gyro)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gen2_motor_driver-msg:<encoder_gyro> is deprecated: use gen2_motor_driver-msg:encoder_gyro instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <encoder_gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:header-val is deprecated.  Use gen2_motor_driver-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'right_count-val :lambda-list '(m))
(cl:defmethod right_count-val ((m <encoder_gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:right_count-val is deprecated.  Use gen2_motor_driver-msg:right_count instead.")
  (right_count m))

(cl:ensure-generic-function 'left_count-val :lambda-list '(m))
(cl:defmethod left_count-val ((m <encoder_gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:left_count-val is deprecated.  Use gen2_motor_driver-msg:left_count instead.")
  (left_count m))

(cl:ensure-generic-function 'gyro_val-val :lambda-list '(m))
(cl:defmethod gyro_val-val ((m <encoder_gyro>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:gyro_val-val is deprecated.  Use gen2_motor_driver-msg:gyro_val instead.")
  (gyro_val m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <encoder_gyro>) ostream)
  "Serializes a message object of type '<encoder_gyro>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'right_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gyro_val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <encoder_gyro>) istream)
  "Deserializes a message object of type '<encoder_gyro>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gyro_val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<encoder_gyro>)))
  "Returns string type for a message object of type '<encoder_gyro>"
  "gen2_motor_driver/encoder_gyro")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'encoder_gyro)))
  "Returns string type for a message object of type 'encoder_gyro"
  "gen2_motor_driver/encoder_gyro")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<encoder_gyro>)))
  "Returns md5sum for a message object of type '<encoder_gyro>"
  "9adda1f0cc5ef21e855eb2b02f332a52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'encoder_gyro)))
  "Returns md5sum for a message object of type 'encoder_gyro"
  "9adda1f0cc5ef21e855eb2b02f332a52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<encoder_gyro>)))
  "Returns full string definition for message of type '<encoder_gyro>"
  (cl:format cl:nil "Header header~%int32 right_count~%int32 left_count~%int32 gyro_val~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'encoder_gyro)))
  "Returns full string definition for message of type 'encoder_gyro"
  (cl:format cl:nil "Header header~%int32 right_count~%int32 left_count~%int32 gyro_val~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <encoder_gyro>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <encoder_gyro>))
  "Converts a ROS message object to a list"
  (cl:list 'encoder_gyro
    (cl:cons ':header (header msg))
    (cl:cons ':right_count (right_count msg))
    (cl:cons ':left_count (left_count msg))
    (cl:cons ':gyro_val (gyro_val msg))
))
