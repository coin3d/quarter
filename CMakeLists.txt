CMAKE_MINIMUM_REQUIRED(VERSION 2.6) # Or does this work on 2.4? 2008-05-15, oyshole
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS True) # Avoid unneccesary code

PROJECT(Quarter)

# Add an option to enable static builds 
OPTION(Quarter_BUILD_STATIC_LIBRARY "Build static library instead of shared library (DLL, so etc..)" OFF)

# Set up the different flavors of postfixes and CRTs for Windows environments
IF(WIN32)
  IF(Quarter_BUILD_STATIC_LIBRARY)
    SET(CMAKE_DEBUG_POSTFIX "sd")
    SET(CMAKE_RELEASE_POSTFIX "s") #NB! Undocumented variable, could be deprecated
    #Don't use dynamic runtime in static builds.    
    SET(CMAKE_CXX_FLAGS_RELEASE "/MT")
    SET(CMAKE_CXX_FLAGS_DEBUG "/MTd")
  ELSE()
    SET(CMAKE_DEBUG_POSTFIX "d")
  ENDIF()

  # Enable single project multithread compilation for VS2008
  IF(MSVC_VERSION EQUAL 1500)
    SET(CMAKE_CXX_FLAGS "/MP4")
  ENDIF()
ENDIF()

# Directory contains necessary macros for finding Coin and some convenience moc macros.
# FIXME: Make these macros SVN externals and move them to the build dir.
# 2008-05-15, oyshole
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeMacros/Modules/")

FIND_PACKAGE(OpenGL REQUIRED)
FIND_PACKAGE(Coin REQUIRED)
SET(QT_USE_QTDESIGNER true)
SET(QT_USE_QTTEST true)
SET(QT_USE_QTOPENGL true)
FIND_PACKAGE(Qt4 REQUIRED)
INCLUDE(${QT_USE_FILE})

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

IF(NOT MSVC_IDE) # Not needed for the systems that support multiple configuration in one generated build
  # Some stuff that can be specified through environment vars
  IF($ENV{RELEASE})
    MESSAGE(STATUS "Buildtype set to Release")
    SET(CMAKE_BUILD_TYPE Release)
    IF ()
      SET(CMAKE_C_FLAGS_RELEASE -O3)
      SET(CMAKE_CXX_FLAGS_RELEASE -O3)
      # FIXME Have to disable some optimizations due to super-nasty casting. 20080329 larsm
      ADD_DEFINITIONS(-fno-strict-aliasing)
    ENDIF()  
  ELSE()
    MESSAGE(STATUS "Buildtype set to debug")
    ENABLE_TESTING()
    SET(CMAKE_BUILD_TYPE Debug)
    ADD_DEFINITIONS(-DDEBUG)
  ENDIF()
ENDIF()

# What to build
ADD_SUBDIRECTORY(src)               

#Install the public headers
FILE(GLOB PublicHeaders RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} include/Quarter/*.h)
FILE(GLOB PublicDeviceHeaders RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} include/Quarter/devices/*.h)
FILE(GLOB PublicEventHandlerHeaders RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} include/Quarter/eventhandlers/*.h)

INSTALL(FILES ${PublicHeaders} DESTINATION "include/Quarter/")
INSTALL(FILES ${PublicDeviceHeaders} DESTINATION "include/Quarter/devices")
INSTALL(FILES ${PublicEventHandlerHeaders} DESTINATION "include/Quarter/eventhandlers")

# Experimental support for CPack.
# Tested with NSIS on Windows Vista.
# 2008-05-15

# Packaging options
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Quarter")
SET(CPACK_PACKAGE_VENDOR "Kongsberg SIM")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/README")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/README")
# FIXME: Get versioning externally
# 2008-05-15
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "0")
INCLUDE(CPack)
