FILE(REMOVE_RECURSE
  "../msg_gen"
  "../src/rosserial_msgs/msg"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/rosserial_msgs/msg/__init__.py"
  "../src/rosserial_msgs/msg/_TopicInfo.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
