FILE(REMOVE_RECURSE
  "../src/rosserial_arduino_tutorials/msg"
  "../msg_gen"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/Adc.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Adc.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
