FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/gen2_motor_driver/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/gen2_motor_driver/pid_plot.h"
  "../msg_gen/cpp/include/gen2_motor_driver/drive_msg.h"
  "../msg_gen/cpp/include/gen2_motor_driver/encoder_gyro.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
