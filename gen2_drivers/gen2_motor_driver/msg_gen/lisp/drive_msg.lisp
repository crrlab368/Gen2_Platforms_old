; Auto-generated. Do not edit!


(cl:in-package gen2_motor_driver-msg)


;//! \htmlinclude drive_msg.msg.html

(cl:defclass <drive_msg> (roslisp-msg-protocol:ros-message)
  ((left_pwm
    :reader left_pwm
    :initarg :left_pwm
    :type cl:fixnum
    :initform 0)
   (right_pwm
    :reader right_pwm
    :initarg :right_pwm
    :type cl:fixnum
    :initform 0)
   (left_dir
    :reader left_dir
    :initarg :left_dir
    :type cl:boolean
    :initform cl:nil)
   (right_dir
    :reader right_dir
    :initarg :right_dir
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass drive_msg (<drive_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <drive_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'drive_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gen2_motor_driver-msg:<drive_msg> is deprecated: use gen2_motor_driver-msg:drive_msg instead.")))

(cl:ensure-generic-function 'left_pwm-val :lambda-list '(m))
(cl:defmethod left_pwm-val ((m <drive_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:left_pwm-val is deprecated.  Use gen2_motor_driver-msg:left_pwm instead.")
  (left_pwm m))

(cl:ensure-generic-function 'right_pwm-val :lambda-list '(m))
(cl:defmethod right_pwm-val ((m <drive_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:right_pwm-val is deprecated.  Use gen2_motor_driver-msg:right_pwm instead.")
  (right_pwm m))

(cl:ensure-generic-function 'left_dir-val :lambda-list '(m))
(cl:defmethod left_dir-val ((m <drive_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:left_dir-val is deprecated.  Use gen2_motor_driver-msg:left_dir instead.")
  (left_dir m))

(cl:ensure-generic-function 'right_dir-val :lambda-list '(m))
(cl:defmethod right_dir-val ((m <drive_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gen2_motor_driver-msg:right_dir-val is deprecated.  Use gen2_motor_driver-msg:right_dir instead.")
  (right_dir m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <drive_msg>) ostream)
  "Serializes a message object of type '<drive_msg>"
  (cl:let* ((signed (cl:slot-value msg 'left_pwm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_pwm)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_dir) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_dir) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <drive_msg>) istream)
  "Deserializes a message object of type '<drive_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_pwm) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_pwm) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'left_dir) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_dir) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<drive_msg>)))
  "Returns string type for a message object of type '<drive_msg>"
  "gen2_motor_driver/drive_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'drive_msg)))
  "Returns string type for a message object of type 'drive_msg"
  "gen2_motor_driver/drive_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<drive_msg>)))
  "Returns md5sum for a message object of type '<drive_msg>"
  "cfda8c2c59f5a59911f03e77663c870f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'drive_msg)))
  "Returns md5sum for a message object of type 'drive_msg"
  "cfda8c2c59f5a59911f03e77663c870f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<drive_msg>)))
  "Returns full string definition for message of type '<drive_msg>"
  (cl:format cl:nil "~%int8 left_pwm~%int8 right_pwm~%bool left_dir~%bool right_dir~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'drive_msg)))
  "Returns full string definition for message of type 'drive_msg"
  (cl:format cl:nil "~%int8 left_pwm~%int8 right_pwm~%bool left_dir~%bool right_dir~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <drive_msg>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <drive_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'drive_msg
    (cl:cons ':left_pwm (left_pwm msg))
    (cl:cons ':right_pwm (right_pwm msg))
    (cl:cons ':left_dir (left_dir msg))
    (cl:cons ':right_dir (right_dir msg))
))
