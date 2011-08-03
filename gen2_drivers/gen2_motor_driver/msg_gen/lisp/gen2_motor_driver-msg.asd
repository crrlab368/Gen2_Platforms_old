
(cl:in-package :asdf)

(defsystem "gen2_motor_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "pid_plot" :depends-on ("_package_pid_plot"))
    (:file "_package_pid_plot" :depends-on ("_package"))
    (:file "drive_msg" :depends-on ("_package_drive_msg"))
    (:file "_package_drive_msg" :depends-on ("_package"))
    (:file "encoder_gyro" :depends-on ("_package_encoder_gyro"))
    (:file "_package_encoder_gyro" :depends-on ("_package"))
  ))