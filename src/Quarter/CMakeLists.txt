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

if(Qt5_FOUND)
  QT5_WRAP_CPP(MOC_HDRS ${MOCCABLE_FILES})
else()
  QT4_WRAP_CPP(MOC_HDRS ${MOCCABLE_FILES})
endif()

if(Spacenav_FOUND)
  add_definitions(-DHAVE_SPACENAV_LIB)
  include_directories(${Spacenav_INCLUDE_DIR})
  set(Extra_libraries ${Spacenav_LIBRARIES} ${Spacenav_LIBRARY})
endif()

# ############################################################################
# Create the library
# FIXME: Support building as a framework on Mac OS X. kintel 20080707.
# ############################################################################

if(QUARTER_BUILD_SHARED_LIBS)
  add_library(${PROJECT_NAME} SHARED ${QUARTER_SRCS} ${QUARTER_PRIVATE_HDRS} ${INST_HDRS} ${INST_EVENTHANDLERS_HDRS} ${MOC_HDRS})
  target_compile_definitions(${PROJECT_NAME} INTERFACE QUARTER_DLL)
  if(WIN32)
    configure_file(${PROJECT_NAME}.rc.cmake.in ${PROJECT_NAME}.rc)
    target_sources(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.rc")
    target_compile_definitions(${PROJECT_NAME} PRIVATE QUARTER_MAKE_DLL)
  endif()
else()
  add_library(${PROJECT_NAME} STATIC ${QUARTER_SRCS} ${QUARTER_PRIVATE_HDRS} ${QUARTER_PUBLIC_HDRS} ${MOC_HDRS})
  target_compile_definitions(${PROJECT_NAME} INTERFACE QUARTER_NOT_DLL)
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${QUARTER_VERSION} SOVERSION ${QUARTER_SO_VERSION})

target_compile_definitions(${PROJECT_NAME} PRIVATE HAVE_CONFIG_H QUARTER_INTERNAL QUARTER_DEBUG=$<CONFIG:Debug>)
if(MSVC)
  target_compile_definitions(${PROJECT_NAME} PRIVATE _CRT_NONSTDC_NO_DEPRECATE _CRT_SECURE_NO_DEPRECATE _CRT_SECURE_NO_WARNINGS _USE_MATH_DEFINES)
  if(NOT QUARTER_BUILD_SHARED_LIBS)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /Z7")                       # Override default /Zi to embed
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} /Z7")     # debugging info in the .lib.
  endif()
endif()

target_include_directories(${PROJECT_NAME}
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/src>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src>
    $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/${CMAKE_INSTALL_INCLUDEDIR}>
    ${OPENGL_INCLUDE_DIR}
)

target_link_libraries(${PROJECT_NAME} Coin::Coin ${QT_LIBRARIES} ${OPENGL_LIBRARY} ${Extra_libraries})

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
