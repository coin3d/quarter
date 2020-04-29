include_directories(${CMAKE_BINARY_DIR})

set(QUARTER_SRCS
  ContextMenu.cpp
  DragDropHandler.cpp
  EventFilter.cpp
  FocusHandler.cpp
  ImageReader.cpp
  InputDevice.cpp
  InteractionMode.cpp
  Keyboard.cpp
  KeyboardP.cpp
  Mouse.cpp
  NativeEvent.cpp
  QtCoinCompatibility.cpp
  Quarter.cpp
  QuarterP.cpp
  QuarterWidget.cpp
  QuarterWidgetP.cpp
  SensorManager.cpp
  SignalThread.cpp
  SpaceNavigatorDevice.cpp
)

set(QUARTER_PRIVATE_HDRS
  ContextMenu.h
  ImageReader.h
  InteractionMode.h
  KeyboardP.h
  NativeEvent.h
  QuarterP.h
  QuarterWidgetP.h
  SensorManager.h
  SignalThread.h
)

set(MOCCABLE_FILES
  "${CMAKE_SOURCE_DIR}/include/Quarter/QuarterWidget.h"
  "${CMAKE_SOURCE_DIR}/include/Quarter/eventhandlers/EventFilter.h"
  "${CMAKE_SOURCE_DIR}/include/Quarter/eventhandlers/DragDropHandler.h"
  "${CMAKE_SOURCE_DIR}/include/Quarter/eventhandlers/FocusHandler.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/SensorManager.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/ContextMenu.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/SignalThread.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/InteractionMode.h"
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

if(Spacenav_FOUND)
  add_definitions(-DHAVE_SPACENAV_LIB)
  include_directories(${Spacenav_INCLUDE_DIR})
  set(Extra_libraries ${Spacenav_LIBRARIES} ${Spacenav_LIBRARY})
endif()

# ############################################################################
# Create the library
# FIXME: Support building as a framework on Mac OS X. kintel 20080707.
# ############################################################################

if(WIN32)
  if(MINGW)
    set(QUARTER_DEFAULT_SHARED_POSTFIX "")
    set(QUARTER_DEFAULT_STATIC_POSTFIX "")
  else()
    # On Windows the major version number is part of the library name
    set(QUARTER_DEFAULT_SHARED_POSTFIX ${PROJECT_VERSION_MAJOR})
    set(QUARTER_DEFAULT_STATIC_POSTFIX ${PROJECT_VERSION_MAJOR}s)
  endif()
  if(QUARTER_BUILD_SHARED_LIBS)
    set(QUARTER_DEFAULT_POSTFIX ${QUARTER_DEFAULT_SHARED_POSTFIX})
    set(QUARTER_PKG_FLAGS "-DQUARTER_DLL" CACHE INTERNAL "Compilation flags for package config" FORCE)
  else()
    set(QUARTER_DEFAULT_POSTFIX ${QUARTER_DEFAULT_STATIC_POSTFIX})
    set(QUARTER_PKG_FLAGS "-DQUARTER_NOT_DLL" CACHE INTERNAL "Compilation flags for package config" FORCE)
  endif()
  set(CMAKE_RELEASE_POSTFIX ${QUARTER_DEFAULT_POSTFIX})
  set(CMAKE_MINSIZEREL_POSTFIX ${QUARTER_DEFAULT_POSTFIX})
  set(CMAKE_RELWITHDEBINFO_POSTFIX ${QUARTER_DEFAULT_POSTFIX})
  set(CMAKE_DEBUG_POSTFIX ${QUARTER_DEFAULT_POSTFIX}d)
elseif(APPLE)
else()
  set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()
set(QUARTER_PKG_LIBS "-l${PROJECT_NAME}" CACHE INTERNAL "Link libraries for package config" FORCE)

if(QUARTER_BUILD_SHARED_LIBS)
  add_library(${PROJECT_NAME} SHARED ${QUARTER_SRCS} ${QUARTER_PRIVATE_HDRS} ${INST_HDRS} ${INST_EVENTHANDLERS_HDRS} ${MOCCABLE_FILES})
else()
  add_library(${PROJECT_NAME} STATIC ${QUARTER_SRCS} ${QUARTER_PRIVATE_HDRS} ${QUARTER_PUBLIC_HDRS} ${MOCCABLE_FILES})
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${QUARTER_VERSION} SOVERSION ${QUARTER_SO_VERSION})

target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_CONFIG_H QUARTER_INTERNAL QUARTER_DEBUG=$<CONFIG:Debug>)

if(WIN32)
  if(MSVC)
    target_compile_definitions(${PROJECT_NAME} PRIVATE _CRT_NONSTDC_NO_DEPRECATE _CRT_SECURE_NO_DEPRECATE _CRT_SECURE_NO_WARNINGS _USE_MATH_DEFINES)
  endif()
  if(QUARTER_BUILD_SHARED_LIBS)
    configure_file(${PROJECT_NAME}.rc.cmake.in ${PROJECT_NAME}.rc)
    target_sources(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.rc")
    target_compile_definitions(${PROJECT_NAME} PRIVATE QUARTER_MAKE_DLL INTERFACE QUARTER_DLL)
  else()
    target_compile_definitions(${PROJECT_NAME} INTERFACE QUARTER_NOT_DLL)
    if(MSVC)
      set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /Z7")                       # Override default /Zi to embed
      set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} /Z7")     # debugging info in the .lib.
    endif()
  endif()
endif()

target_include_directories(${PROJECT_NAME}
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/src>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    ${OPENGL_INCLUDE_DIR}
)

target_link_libraries(${PROJECT_NAME} PUBLIC Coin::Coin ${OPENGL_gl_LIBRARY} ${QUARTER_QT_TARGETS} ${Extra_libraries})

# ############################################################################
# Install targets
# ############################################################################

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT development
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT runtime NAMELINK_SKIP
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT runtime
)

if(QUARTER_BUILD_SHARED_LIBS)
  install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT development NAMELINK_ONLY)
  if(MSVC)
    install(FILES $<TARGET_PDB_FILE:${PROJECT_NAME}> DESTINATION ${CMAKE_INSTALL_BINDIR} CONFIGURATIONS Debug RelWithDebInfo COMPONENT debug)
  endif()
endif()
