FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/gen2_motor_driver/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/gen2_motor_driver/msg/__init__.py"
  "../src/gen2_motor_driver/msg/_pid_plot.py"
  "../src/gen2_motor_driver/msg/_drive_msg.py"
  "../src/gen2_motor_driver/msg/_encoder_gyro.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
