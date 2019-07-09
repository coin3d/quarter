if(Qt5_FOUND)
  # If this directory is not explicitly included build fails with message "error: Undefined interface"
  include_directories(${Qt5Designer_INCLUDE_DIRS})
  QT5_ADD_RESOURCES(ResourceSources QuarterWidgetPlugin.qrc coinlogo.qrc)
  QT5_WRAP_CPP(MocHeaders QuarterWidgetPlugin.h)
else()
  # If this directory is not explicitly included build fails with message "error: Undefined interface"
  include_directories(${QtDesigner_INCLUDE_DIRS})
  QT4_ADD_RESOURCES(ResourceSources QuarterWidgetPlugin.qrc coinlogo.qrc)
  QT4_WRAP_CPP(MocHeaders QuarterWidgetPlugin.h)
endif()

# ############################################################################
# Create the QtDesigner plugin
# ############################################################################

add_library(QuarterWidgetPlugin SHARED QuarterWidgetPlugin.cpp QuarterWidgetPlugin.h ${ResourceSources} ${MocHeaders})
if(WIN32)
  configure_file(QuarterWidgetPlugin.rc.cmake.in QuarterWidgetPlugin.rc)
  target_sources(QuarterWidgetPlugin PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/QuarterWidgetPlugin.rc")
endif()
target_link_libraries(QuarterWidgetPlugin PUBLIC Quarter ${QUARTER_PLUGIN_QT_TARGETS})

set_target_properties(QuarterWidgetPlugin PROPERTIES VERSION ${QUARTER_VERSION} SOVERSION ${QUARTER_SO_VERSION})

# ############################################################################
# Install the QtDesigner plugin
# ############################################################################

if(QT_PLUGINS_DIR)
  # Legacy FindQt4.
  install(TARGETS QuarterWidgetPlugin RUNTIME DESTINATION "${QT_PLUGINS_DIR}/designer")
else()
  # Call qmake to query the plugin installation directory.
  get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake LOCATION)
  execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PLUGINS
    OUTPUT_VARIABLE QT_INSTALL_PLUGINS OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  install(TARGETS QuarterWidgetPlugin
    RUNTIME DESTINATION "${QT_INSTALL_PLUGINS}/designer" COMPONENT development
    LIBRARY DESTINATION "${QT_INSTALL_PLUGINS}/designer" COMPONENT development
  )
endif()
