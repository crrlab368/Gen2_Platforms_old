
(cl:in-package :asdf)

(defsystem "rosserial_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TopicInfo" :depends-on ("_package_TopicInfo"))
    (:file "_package_TopicInfo" :depends-on ("_package"))
  ))