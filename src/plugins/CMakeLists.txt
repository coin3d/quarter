set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# If this directory is not explicitly included build fails with message "error: Undefined interface"
if(Qt6_FOUND)
  include_directories(${Qt6Designer_INCLUDE_DIRS})
elseif(Qt5_FOUND)
  include_directories(${Qt5Designer_INCLUDE_DIRS})
else()
  include_directories(${QtDesigner_INCLUDE_DIRS})
endif()

# ############################################################################
# Create the QtDesigner plugin
# ############################################################################

add_library(QuarterWidgetPlugin SHARED QuarterWidgetPlugin.cpp QuarterWidgetPlugin.h QuarterWidgetPlugin.qrc coinlogo.qrc)
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
  if(Qt6_FOUND)
    # Call qmake to query the plugin installation directory.
    get_target_property(QT_QMAKE_EXECUTABLE Qt6::qmake LOCATION)
    execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PLUGINS
      OUTPUT_VARIABLE QT_INSTALL_PLUGINS OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  else()
    # Call qmake to query the plugin installation directory.
    get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake LOCATION)
    execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PLUGINS
      OUTPUT_VARIABLE QT_INSTALL_PLUGINS OUTPUT_STRIP_TRAILING_WHITESPACE
   )
  endif()
  install(TARGETS QuarterWidgetPlugin
    RUNTIME DESTINATION "${QT_INSTALL_PLUGINS}/designer" COMPONENT development
    LIBRARY DESTINATION "${QT_INSTALL_PLUGINS}/designer" COMPONENT development
  )
endif()
