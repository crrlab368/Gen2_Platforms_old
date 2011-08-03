FILE(REMOVE_RECURSE
  "../src/gen2_motor_driver/msg"
  "../msg_gen"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/pid_plot.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_pid_plot.lisp"
  "../msg_gen/lisp/encoder_gyro.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_encoder_gyro.lisp"
  "../msg_gen/lisp/drive_msg.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_drive_msg.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
