PROJECT(Quarter)

# Build to lib and create shared object/DLL
SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
SET(BUILD_SHARED_LIBS TRUE)

# For Find-macros
SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMakeMacros/Modules/")

FIND_PACKAGE(OpenGL REQUIRED)
FIND_PACKAGE(Coin REQUIRED)
SET(QT_USE_QTDESIGNER true)
SET(QT_USE_QTTEST true)
SET(QT_USE_QTOPENGL true)
FIND_PACKAGE(Qt4 REQUIRED)
INCLUDE(${QT_USE_FILE})

SET(BUILD_SHARED_LIBS TRUE)

LINK_DIRECTORIES(${QT_LIB_DIR} ${Coin_LIB_DIR} ${OPENGL_gl_DIRECTORY})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/include/)
INCLUDE_DIRECTORIES(${QT_INCLUDE_DIR} ${Coin_INCLUDE_DIR} ${OPENGL_INCLUDE_DIR})

ADD_DEFINITIONS(${Coin_DEFINES})
ADD_DEFINITIONS(${QT_DEFINITIONS})
ADD_DEFINITIONS(-DQUARTER_INTERNAL)
IF(MSVC)
  ADD_DEFINITIONS(-D_CRT_SECURE_NO_DEPRECATE)
ENDIF(MSVC)

# Some stuff that can be specified through environment vars
IF($ENV{RELEASE})
  MESSAGE(STATUS "Buildtype set to Release")
  SET(CMAKE_BUILD_TYPE Release)
  
  IF (GCC)
    SET(CMAKE_C_FLAGS_RELEASE -O3)
    SET(CMAKE_CXX_FLAGS_RELEASE -O3)
    # FIXME Have to disable some optimizations due to super-nasty casting. 20080329 larsm
    ADD_DEFINITIONS(-fno-strict-aliasing)
  ENDIF (GCC)  
ELSE($ENV{RELEASE})
  MESSAGE(STATUS "Buildtype set to debug")
  ENABLE_TESTING()
  SET(CMAKE_BUILD_TYPE Debug)
  ADD_DEFINITIONS(-DDEBUG)
ENDIF($ENV{RELEASE})

# What to build
ADD_SUBDIRECTORY(include)           # For mocs
ADD_SUBDIRECTORY(src)               
ADD_DEPENDENCIES(Quarter MocsLib)   # The library build depends on the mocs from include/

# make install (FIXME copies everything -larsm)
INSTALL(DIRECTORY "include/" DESTINATION "include/" PATTERN *.h)

MESSAGE(STATUS "-------------------------------------------------------------------")
MESSAGE(STATUS "Install directory: ${CMAKE_INSTALL_PREFIX}")
MESSAGE(STATUS "Build using make and then make install")
MESSAGE(STATUS "-------------------------------------------------------------------")