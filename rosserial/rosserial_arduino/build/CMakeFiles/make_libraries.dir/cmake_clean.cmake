FILE(REMOVE_RECURSE
  "CMakeFiles/make_libraries"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/make_libraries.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
