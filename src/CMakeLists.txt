add_subdirectory(Quarter)

if(QUARTER_BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()
if(QUARTER_BUILD_PLUGIN)
  add_subdirectory(plugins)
endif()
