; Auto-generated. Do not edit!


(cl:in-package rosserial_msgs-msg)


;//! \htmlinclude TopicInfo.msg.html

(cl:defclass <TopicInfo> (roslisp-msg-protocol:ros-message)
  ((topic_id
    :reader topic_id
    :initarg :topic_id
    :type cl:fixnum
    :initform 0)
   (topic_name
    :reader topic_name
    :initarg :topic_name
    :type cl:string
    :initform "")
   (message_type
    :reader message_type
    :initarg :message_type
    :type cl:string
    :initform ""))
)

(cl:defclass TopicInfo (<TopicInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TopicInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TopicInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rosserial_msgs-msg:<TopicInfo> is deprecated: use rosserial_msgs-msg:TopicInfo instead.")))

(cl:ensure-generic-function 'topic_id-val :lambda-list '(m))
(cl:defmethod topic_id-val ((m <TopicInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_msgs-msg:topic_id-val is deprecated.  Use rosserial_msgs-msg:topic_id instead.")
  (topic_id m))

(cl:ensure-generic-function 'topic_name-val :lambda-list '(m))
(cl:defmethod topic_name-val ((m <TopicInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_msgs-msg:topic_name-val is deprecated.  Use rosserial_msgs-msg:topic_name instead.")
  (topic_name m))

(cl:ensure-generic-function 'message_type-val :lambda-list '(m))
(cl:defmethod message_type-val ((m <TopicInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rosserial_msgs-msg:message_type-val is deprecated.  Use rosserial_msgs-msg:message_type instead.")
  (message_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TopicInfo>) ostream)
  "Serializes a message object of type '<TopicInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'topic_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'topic_id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topic_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topic_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message_type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TopicInfo>) istream)
  "Deserializes a message object of type '<TopicInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'topic_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'topic_id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topic_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topic_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TopicInfo>)))
  "Returns string type for a message object of type '<TopicInfo>"
  "rosserial_msgs/TopicInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TopicInfo)))
  "Returns string type for a message object of type 'TopicInfo"
  "rosserial_msgs/TopicInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TopicInfo>)))
  "Returns md5sum for a message object of type '<TopicInfo>"
  "5b7118c667875cbc7c47734d38bc9992")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TopicInfo)))
  "Returns md5sum for a message object of type 'TopicInfo"
  "5b7118c667875cbc7c47734d38bc9992")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TopicInfo>)))
  "Returns full string definition for message of type '<TopicInfo>"
  (cl:format cl:nil "uint16 topic_id~%string topic_name~%string message_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TopicInfo)))
  "Returns full string definition for message of type 'TopicInfo"
  (cl:format cl:nil "uint16 topic_id~%string topic_name~%string message_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TopicInfo>))
  (cl:+ 0
     2
     4 (cl:length (cl:slot-value msg 'topic_name))
     4 (cl:length (cl:slot-value msg 'message_type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TopicInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'TopicInfo
    (cl:cons ':topic_id (topic_id msg))
    (cl:cons ':topic_name (topic_name msg))
    (cl:cons ':message_type (message_type msg))
))
