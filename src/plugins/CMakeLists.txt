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
    # Get qmake location.
    get_target_property(QT_QMAKE_EXECUTABLE Qt6::qmake LOCATION)
  else()
    # Get qmake location.
    get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake LOCATION)
  endif()
  # Call qmake to query the installation prefix.
  execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PREFIX
    OUTPUT_VARIABLE QT_INSTALL_PREFIX OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  # Call qmake to query the plugin installation directory.
  execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PLUGINS
    OUTPUT_VARIABLE QT_INSTALL_PLUGINS OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  # Compute relative plugin installation directory.
  file(RELATIVE_PATH CMAKE_INSTALL_QTPLUGINSDIR_DEFAULT
    "${QT_INSTALL_PREFIX}" "${QT_INSTALL_PLUGINS}"
  )
  # Set cache variable like in GNUInstallDirs module
  set(CMAKE_INSTALL_QTPLUGINSDIR "${CMAKE_INSTALL_QTPLUGINSDIR_DEFAULT}"
    CACHE PATH "Qt plugins (${CMAKE_INSTALL_QTPLUGINSDIR_DEFAULT})"
  )
  install(TARGETS QuarterWidgetPlugin
    RUNTIME DESTINATION "${CMAKE_INSTALL_QTPLUGINSDIR}/designer" COMPONENT development
    LIBRARY DESTINATION "${CMAKE_INSTALL_QTPLUGINSDIR}/designer" COMPONENT development
  )
endif()
