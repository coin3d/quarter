cmake_minimum_required(VERSION 3.0)

set(QUARTER_MAJOR 1)
set(QUARTER_MINOR 0)
set(QUARTER_MICRO 1)
set(QUARTER_BETA a)
set(QUARTER_VERSION ${QUARTER_MAJOR}.${QUARTER_MINOR}.${QUARTER_MICRO}${QUARTER_BETA})

set(PROJECT_DESCRIPTION "Coin 3D integration library")

project(Quarter VERSION ${QUARTER_MAJOR}.${QUARTER_MINOR}.${QUARTER_MICRO} LANGUAGES CXX)

string(TIMESTAMP QUARTER_BUILD_YEAR "%Y")
math(EXPR QUARTER_SO_VERSION ${PROJECT_VERSION_MAJOR}*20)
set(VERSION ${QUARTER_VERSION})

option(QUARTER_BUILD_SHARED_LIBS "Build shared libraries" ON)
option(QUARTER_USE_QT5 "Prefer Qt5 over Qt4 if available" ON)
option(QUARTER_BUILD_PLUGIN "Build Quarter plugin for QT Designer" ON)
option(QUARTER_BUILD_EXAMPLES "Build Quarter example applications" ON)

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
	message(FATAL_ERROR "${CMAKE_PROJECT_NAME} requires an out of source build. Please create a separate build directory and run 'cmake <path_to_${CMAKE_PROJECT_NAME}> [options]' from there.")
endif()

set(CMAKE_BUILD_TYPE Release) # has no effect for multi configuration generators (VisualStudio, Xcode)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

find_package(OpenGL REQUIRED)
find_package(Coin REQUIRED)
find_package(superglu REQUIRED)
find_package(Spacenav)

if(WIN32)
	if(QUARTER_BUILD_SHARED_LIBS)
		set(CMAKE_RELEASE_POSTFIX ${PROJECT_VERSION_MAJOR}) #NB! Undocumented variable, could be deprecated
		set(CMAKE_MINSIZEREL_POSTFIX ${PROJECT_VERSION_MAJOR})
		set(CMAKE_RELWITHDEBINDO_POSTFIX ${PROJECT_VERSION_MAJOR})
		set(CMAKE_DEBUG_POSTFIX ${PROJECT_VERSION_MAJOR}d)
	else()
		set(CMAKE_RELEASE_POSTFIX ${PROJECT_VERSION_MAJOR}s) #NB! Undocumented variable, could be deprecated
		set(CMAKE_MINSIZEREL_POSTFIX ${PROJECT_VERSION_MAJOR}s)
		set(CMAKE_RELWITHDEBINDO_POSTFIX ${PROJECT_VERSION_MAJOR}s)
		set(CMAKE_DEBUG_POSTFIX ${PROJECT_VERSION_MAJOR}sd)
	endif()
endif()

if(QUARTER_USE_QT5)
	find_package(Qt5 COMPONENTS UiTools OpenGL Designer REQUIRED)
endif()

if(Qt5_FOUND)
	set(QT_LIBRARIES ${Qt5UiTools_LIBRARIES} ${Qt5OpenGL_LIBRARIES} ${Qt5Designer_LIBRARIES})
	string(REGEX REPLACE "^([0-9]+)\\.[0-9]+\\.[0-9]+.*" "\\1" QT_VERSION_MAJOR "${Qt5Core_VERSION_STRING}")
	string(REGEX REPLACE "^[0-9]+\\.([0-9])+\\.[0-9]+.*" "\\1" QT_VERSION_MINOR "${Qt5Core_VERSION_STRING}")
	string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" QT_VERSION_PATCH "${Qt5Core_VERSION_STRING}")
else()
	set(QT_USE_QTDESIGNER true)
	set(QT_USE_QTTEST true)
	set(QT_USE_QTOPENGL true)
	set(QT_USE_QTUITOOLS true)
	set(QT_USE_IMPORTED_TARGETS ON)
	find_package(Qt4 COMPONENTS QtUiTools QtOpenGL QtDesigner REQUIRED)
	include(${QT_USE_FILE})
endif()

#set(CMAKE_AUTOMOC true)
set(CMAKE_INCLUDE_CURRENT_DIR true)

# config.h
configure_file(config.h.cmake.in config.h @ONLY)

set(INST_HDRS
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/Basic.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/QtCoinCompatibility.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/Quarter.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/QuarterWidget.h
)

set(INST_DEVICES_HDRS
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/InputDevice.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/Keyboard.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/Mouse.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/SpaceNavigatorDevice.h
)

set(INST_EVENTHANDLERS_HDRS
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/DragDropHandler.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/EventFilter.h
	${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/FocusHandler.h
)

set(QUARTER_PUBLIC_HDRS ${INST_HDRS} ${INST_DEVICES_HDRS} ${INST_EVENTHANDLERS_HDRS})

# What to build
add_subdirectory(src)

#Install the public headers
install(FILES ${INST_HDRS}               DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}               COMPONENT development)
install(FILES ${INST_DEVICES_HDRS}       DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/devices       COMPONENT development)
install(FILES ${INST_EVENTHANDLERS_HDRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/eventhandlers COMPONENT development)

# Generates config
configure_package_config_file(${PROJECT_NAME}-config.cmake.in ${PROJECT_NAME}-config.cmake
	INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
)

write_basic_package_version_file(${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
	VERSION ${PROJECT_VERSION}
	COMPATIBILITY ExactVersion
)

install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
	COMPONENT development
)

install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
	COMPONENT development
)

install(EXPORT ${PROJECT_NAME}
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
	NAMESPACE ${PROJECT_NAME}::
	FILE ${PROJECT_NAME}-export.cmake
	COMPONENT development
)

# ############################################################################
# New CPACK section, please see the README file inside cpack.d directory.
add_subdirectory(cpack.d)

# ############################################################################
# Legacy cmake statements, packagers should refer and populate the cpack.d 
# drop-in directory
# ############################################################################

# Experimental support for CPack.
# Tested with NSIS on Windows Vista.
# 2008-05-15

# Packaging options
set(CPACK_COMPONENTS_ALL "runtime;development")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "Kongsberg SIM")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/README")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY ${PROJECT_NAME})
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${PROJECT_NAME})
#Add a registry variable for detecting the link type on Win32 systems.
if(QUARTER_BUILD_SHARED_LIBS)
  set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "\ \ WriteRegStr\ SHCTX\ \\\"Software\\\\Kongsberg SIM\\\\Quarter\\\" \\\"Dynamic\\\" \\\"true\\\"")
else()
  set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "\ \ WriteRegStr\ SHCTX\ \\\"Software\\\\Kongsberg SIM\\\\Quarter\\\" \\\"Dynamic\\\" \\\"false\\\"")
endif()
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
# NSIS
set(CPACK_NSIS_MODIFY_PATH on)
# RPM
set(CPACK_RPM_COMPONENT_INSTALL ON)

include(CPack)
