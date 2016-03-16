SET(Library QuarterWidgetPlugin)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

ADD_DEFINITIONS(-DQUARTER_DLL)

FILE(GLOB_RECURSE Sources RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)
FILE(GLOB_RECURSE Headers RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.h)
FILE(GLOB_RECURSE Resources RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qrc)

if(Qt5_FOUND)
  QT5_ADD_RESOURCES(ResourceSources ${Resources})
else()
  QT4_ADD_RESOURCES(ResourceSources ${Resources})
endif()

# Some convenient variables. The inclusion of the headers in the source variable is to force CMake to include the headers in VS project generation.
SET(AllSources ${Sources} ${ResourceSources} ${Headers})
SET(AllLibs ${Coin_LIBRARY} ${QT_LIBRARIES} ${OPENGL_gl_LIBRARY} Quarter)

ADD_LIBRARY(${Library} SHARED ${AllSources})
TARGET_LINK_LIBRARIES(${Library} ${AllLibs})

SIM_VS_GENERATE_BASIC_TREE()

#Install the designer plugin
if(QT_PLUGINS_DIR)
  # Legacy FindQt4.
  install(TARGETS ${Library}
    RUNTIME DESTINATION "${QT_PLUGINS_DIR}/designer"
  )
else()
  # Call qmake to query the plugin installation directory.
  get_target_property(QT_QMAKE_EXECUTABLE Qt5::qmake LOCATION)
  execute_process(COMMAND ${QT_QMAKE_EXECUTABLE} -query QT_INSTALL_PLUGINS
    OUTPUT_VARIABLE QT_INSTALL_PLUGINS OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  install(TARGETS ${Library}
    RUNTIME DESTINATION "${QT_INSTALL_PLUGINS}/designer"
  )
endif()
