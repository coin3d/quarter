CMAKE_MINIMUM_REQUIRED(VERSION 2.6) # Or does this work on 2.4? 2008-05-15, oyshole
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true) # Avoid unneccesary code

PROJECT(Quarter)
SET(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/SIMCMakeMacros/")

# This is a convenience macro for generating better tree structures in VS solutions.
# Running this in any directory will affect all libraries/executables at that location.
MACRO(SIM_VS_GENERATE_BASIC_TREE)
  SOURCE_GROUP("Source" REGULAR_EXPRESSION \\.cpp)
  SOURCE_GROUP("Headers" REGULAR_EXPRESSION \\.h)

  SOURCE_GROUP("Source\\Generated Moc files" REGULAR_EXPRESSION moc_*)
  SOURCE_GROUP("Source\\Generated Qrc files" REGULAR_EXPRESSION [^\\.]qrc_*)
  SOURCE_GROUP("Resources" REGULAR_EXPRESSION .*\\.qrc)

  SOURCE_GROUP("Build" REGULAR_EXPRESSION \\.txt)
  SOURCE_GROUP("Build\\Rules" REGULAR_EXPRESSION \\.rule)
ENDMACRO()

# Add an option to enable static builds
OPTION(Quarter_BUILD_STATIC_LIBRARY "Build static library instead of shared library (DLL, so etc..)" OFF)
OPTION(Quarter_BUILD_PLUGIN "Build Quarter plugin for QT Designer" OFF)
OPTION(Quarter_BUILD_EXAMPLES "Build Quarter example applications" OFF)

# Set up the different flavors of postfixes and CRTs for Windows environments
#  Install configuration
#
# Quarter will be installed into the directory configured by CMAKE_INSTALL_PREFIX. This
# defaults to /usr/local/ on UNIX and c:/Program Files/Quarter on Windows.
#
# On Windows, the namimg convention is as follows (ripped from the "Coin" way of doing stuff):
# Dynamic Release: Quarter.dll and Quarter.lib
# Dynamic Debug: Quarterd.dll and Quarterd.lib
# Static Release: Quarters.lib
# Static Debug: Quartersd.lib
IF(WIN32)
  IF(Quarter_BUILD_STATIC_LIBRARY)
    SET(CMAKE_DEBUG_POSTFIX "sd")
    SET(CMAKE_RELEASE_POSTFIX "s") #NB! Undocumented variable, could be deprecated
        
    #Don't use dynamic runtime in static builds.
    STRING(REPLACE "/MDd" "/MTd" CMAKE_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE})
    STRING(REPLACE "/MDd" "/MTd" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
    STRING(REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE})
    STRING(REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
  ELSE()
    SET(CMAKE_DEBUG_POSTFIX "d")
  ENDIF()

  # Enable single project multithread compilation for VS2008
  IF(MSVC_VERSION EQUAL 1500)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP4")
  ENDIF()
ENDIF()

FIND_PACKAGE(OpenGL REQUIRED)
FIND_PACKAGE(Coin REQUIRED) # FIXME: The results of this macro is not cached.
SET(QT_USE_QTDESIGNER true)
SET(QT_USE_QTTEST true)
SET(QT_USE_QTOPENGL true)
SET(QT_USE_QTUITOOLS true)
FIND_PACKAGE(Qt4 REQUIRED)
INCLUDE(${QT_USE_FILE})


FIND_PACKAGE(Spacenav)
IF (Spacenav_FOUND)
INCLUDE_DIRECTORIES(${Spacenav_INCLUDE_DIR})
ENDIF(Spacenav_FOUND)

# FIXME: Is this really necessary? Shouldnt the link directories be sorted out by the package scripts.
# 2008-05-15, oyshole
LINK_DIRECTORIES(${QT_LIB_DIR} ${Coin_LIB_DIR} ${OPENGL_gl_DIRECTORY})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/include/)
INCLUDE_DIRECTORIES(${QT_INCLUDE_DIR} ${Coin_INCLUDE_DIR} ${OPENGL_INCLUDE_DIR})

ADD_DEFINITIONS(${Coin_DEFINES})
ADD_DEFINITIONS(${QT_DEFINITIONS})

IF(MSVC)
  MESSAGE(STATUS "MSVC Version: " ${MSVC_VERSION})
  ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE)
ENDIF()

# config.h
SET(QUARTER_MAJOR_VERSION "1")
SET(QUARTER_MINOR_VERSION "0")
SET(QUARTER_MICRO_VERSION "1")
CONFIGURE_FILE(config.h.cmake.in ${PROJECT_BINARY_DIR}/config.h)
INCLUDE_DIRECTORIES(${PROJECT_BINARY_DIR}/)

# What to build
ADD_SUBDIRECTORY(src)

#Install the public headers
INSTALL(DIRECTORY include/Quarter/ DESTINATION include/Quarter
        FILES_MATCHING PATTERN "*.h"
        PATTERN ".hg" EXCLUDE)

# Experimental support for CPack.
# Tested with NSIS on Windows Vista.
# 2008-05-15

# Packaging options
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Quarter")
SET(CPACK_PACKAGE_VENDOR "Kongsberg SIM")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/README")
SET(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "Quarter")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "Quarter")
#Add a registry variable for detecting the link type on Win32 systems.
IF(Quarter_BUILD_STATIC_LIBRARY)
  SET(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "\ \ WriteRegStr\ SHCTX\ \\\"Software\\\\Kongsberg SIM\\\\Quarter\\\" \\\"Dynamic\\\" \\\"false\\\"")
ELSE()
  SET(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "\ \ WriteRegStr\ SHCTX\ \\\"Software\\\\Kongsberg SIM\\\\Quarter\\\" \\\"Dynamic\\\" \\\"true\\\"")
ENDIF()
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "0")
SET(CPACK_NSIS_MODIFY_PATH on)
INCLUDE(CPack)
