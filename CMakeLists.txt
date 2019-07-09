cmake_minimum_required(VERSION 3.0)

set(QUARTER_MAJOR_VERSION 1)
set(QUARTER_MINOR_VERSION 0)
set(QUARTER_MICRO_VERSION 1)
set(QUARTER_BETA_VERSION a)
set(QUARTER_VERSION ${QUARTER_MAJOR_VERSION}.${QUARTER_MINOR_VERSION}.${QUARTER_MICRO_VERSION}${QUARTER_BETA_VERSION})

project(Quarter VERSION ${QUARTER_MAJOR_VERSION}.${QUARTER_MINOR_VERSION}.${QUARTER_MICRO_VERSION} LANGUAGES CXX)
string(TOLOWER ${PROJECT_NAME} PROJECT_NAME_LOWER)

# ############################################################################
# these will be removed after upgrading CMake minimum version to 3.9.6
set(PROJECT_DESCRIPTION "Coin 3D integration library")
# ############################################################################

string(TIMESTAMP QUARTER_BUILD_YEAR "%Y")
math(EXPR QUARTER_SO_VERSION ${PROJECT_VERSION_MAJOR}*20)
set(VERSION ${QUARTER_VERSION})

if(POLICY CMP0072)
  # get rid of OpenGL GLVND warning from CMake 3.11
  cmake_policy(SET CMP0072 NEW)
endif()

# ############################################################################
# Prevent in-source builds, as they often cause severe build problems
# ############################################################################

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
  message(FATAL_ERROR "${CMAKE_PROJECT_NAME} requires an out of source build. Please create a separate build directory and run 'cmake <path_to_${CMAKE_PROJECT_NAME}> [options]' from there.")
endif()

# ############################################################################
# Include necessary submodules
# ############################################################################

include(CMakeDependentOption)
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# ############################################################################
# Provide options to customise the build
# ############################################################################

option(QUARTER_BUILD_SHARED_LIBS "Build shared libraries" ON)
option(QUARTER_USE_QT5 "Prefer Qt5 over Qt4 if available" ON)
option(QUARTER_BUILD_PLUGIN "Build Quarter plugin for QT Designer" ON)
option(QUARTER_BUILD_EXAMPLES "Build Quarter example applications" ON)
option(QUARTER_BUILD_DOCUMENTATION "Build and install API documentation (requires Doxygen)." OFF)
cmake_dependent_option(QUARTER_BUILD_INTERNAL_DOCUMENTATION "Document internal code not part of the API." OFF "QUARTER_BUILD_DOCUMENTATION" OFF)
cmake_dependent_option(QUARTER_BUILD_DOC_MAN "Build So${Gui} man pages." OFF "QUARTER_BUILD_DOCUMENTATION" OFF)
cmake_dependent_option(QUARTER_BUILD_DOC_QTHELP "Build QtHelp documentation." OFF "QUARTER_BUILD_DOCUMENTATION" OFF)
cmake_dependent_option(QUARTER_BUILD_DOC_CHM "Build compressed HTML help manual (requires HTML help compiler)" OFF "QUARTER_BUILD_DOCUMENTATION" OFF)

# ############################################################################
# Find all necessary and optional SoQt dependencies
# ############################################################################

# Fail early if one of the required packages cannot be found

find_package(OpenGL REQUIRED)
find_package(Coin REQUIRED)
find_package(Spacenav)

if(QUARTER_USE_QT5)
  find_package(Qt5 COMPONENTS Widgets UiTools OpenGL Designer REQUIRED)
endif()

if(Qt5_FOUND)
  set(QUARTER_QT_TARGETS Qt5::Widgets Qt5::OpenGL)
  set(QUARTER_PLUGIN_QT_TARGETS Qt5::Widgets Qt5::UiTools Qt5::OpenGL Qt5::Designer)
  string(REGEX REPLACE "^([0-9]+)\\.[0-9]+\\.[0-9]+.*" "\\1" QT_VERSION_MAJOR "${Qt5Core_VERSION_STRING}")
  string(REGEX REPLACE "^[0-9]+\\.([0-9])+\\.[0-9]+.*" "\\1" QT_VERSION_MINOR "${Qt5Core_VERSION_STRING}")
  string(REGEX REPLACE "^[0-9]+\\.[0-9]+\\.([0-9]+).*" "\\1" QT_VERSION_PATCH "${Qt5Core_VERSION_STRING}")
  set(PACKAGE_ADDITIONAL_REQUIREMENTS "Qt5Widgets, Qt5UiTools, Qt5OpenGL, Qt5Designer")
else()
  set(QT_USE_QTGUI true)
  set(QT_USE_QTDESIGNER true)
  set(QT_USE_QTTEST true)
  set(QT_USE_QTOPENGL true)
  set(QT_USE_QTUITOOLS true)
  set(QT_USE_IMPORTED_TARGETS ON)
  find_package(Qt4 COMPONENTS QtGui QtUiTools QtOpenGL QtDesigner REQUIRED)
  set(QUARTER_QT_TARGETS Qt4::QtGui Qt4::QtOpenGL)
  set(QUARTER_PLUGIN_QT_TARGETS Qt4::QtGui Qt4::QtUiTools Qt4::QtOpenGL Qt4::QtDesigner)
  include(${QT_USE_FILE})
  set(PACKAGE_ADDITIONAL_REQUIREMENTS "QtGui, QtUiTools, QtOpenGL, QtDesigner")
endif()

# ##########################################################################
# Setup build environment
# ##########################################################################

if(NOT CMAKE_BUILD_TYPE)
  # Has no effect for multi configuration generators (VisualStudio, Xcode).
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose type of build, options are Debug, Release, RelWithDebInfo, MinSizeRel." FORCE)
endif()
# Set common output directories for all targets built.
# First for the generic no-config case (e.g. with mingw)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
# Second, for multi-config builds (e.g. msvc)
foreach (_config ${CMAKE_CONFIGURATION_TYPES})
  string(TOUPPER ${_config} _config)
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${_config} "${CMAKE_BINARY_DIR}/lib")
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${_config} "${CMAKE_BINARY_DIR}/lib")
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${_config} "${CMAKE_BINARY_DIR}/bin")
endforeach()

set(CMAKE_INCLUDE_CURRENT_DIR true)

configure_file(config.h.cmake.in config.h @ONLY)

set(INST_HDRS
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/Basic.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/QtCoinCompatibility.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/Quarter.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/QuarterWidget.h"
)

set(INST_DEVICES_HDRS
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/InputDevice.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/Keyboard.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/Mouse.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/devices/SpaceNavigatorDevice.h"
)

set(INST_EVENTHANDLERS_HDRS
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/DragDropHandler.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/EventFilter.h"
  "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}/eventhandlers/FocusHandler.h"
)

set(QUARTER_PUBLIC_HDRS ${INST_HDRS} ${INST_DEVICES_HDRS} ${INST_EVENTHANDLERS_HDRS})

# ############################################################################
# Setup targets in subdirectories
# ############################################################################

add_subdirectory(src)

# ############################################################################
# Add a target to generate API documentation with Doxygen
# ############################################################################

if(QUARTER_BUILD_DOCUMENTATION)
  find_package(Doxygen)
  if(NOT DOXYGEN_FOUND)
    message(FATAL_ERROR "Doxygen is needed to build the documentation.")
  endif()

  set(DOXYGEN_TAGFILES "${Coin_DOC_DIR}/html/Coin.tag=${Coin_DOC_DIR}/html")

# ############################################################################
# Setup documentation options
# ############################################################################
  set(GENERATE_HTMLHELP NO)
  set(DOXYGEN_GENERATE_MAN NO)
  set(GENERATE_QHP NO)
  set(GENERATE_TREEVIEW YES)
  set(HHC_PROGRAM)
  if(WIN32)
    if(QUARTER_BUILD_DOC_CHM)
      find_program(HHC_PROGRAM NAMES hhc.exe PATHS "C:/Program Files/HTML Help Workshop" "C:/Program Files (x86)/HTML Help Workshop" DOC "HTML Help Compiler program")
      if(NOT HHC_PROGRAM)
        message(FATAL_ERROR "Missing program HTML Help Compiler")
      else()
        set(GENERATE_HTMLHELP YES)
        set(GENERATE_TREEVIEW NO)
        mark_as_advanced(HHC_PROGRAM)
      endif()
    endif()
  else()
    if(QUARTER_BUILD_DOC_MAN)
      set(DOXYGEN_GENERATE_MAN YES)
    endif()
  endif()
  if(QUARTER_BUILD_DOC_QTHELP)
    find_program(QHG_LOCATION NAMES qhelpgenerator qhelpgenerator-qt5 DOC "Qt qhelpgenerator")
    if(NOT QHG_LOCATION)
      message(FATAL_ERROR "Missing program Qt qhelpgenerator")
    else()
      set(GENERATE_QHP YES)
      mark_as_advanced(QHG_LOCATION)
    endif()
  endif()

  set(DOXYGEN_INTERNAL_DOCS NO)
  set(DOXYGEN_EXTRACT_PRIVATE NO)
  set(DOXYGEN_WARN_IF_UNDOCUMENTED YES)
  set(DOXYGEN_EXCLUDE)

  set(DOXYFILE "${CMAKE_CURRENT_BINARY_DIR}/Doxyfile")
  set(DOXYGEN_OUTPUT "${CMAKE_BINARY_DIR}/html/index.html")
  configure_file("${CMAKE_SOURCE_DIR}/docs/quarter.doxygen.cmake.in" ${DOXYFILE} @ONLY)

# ############################################################################
# Setup documentation targets
# ############################################################################
  add_custom_command(
    OUTPUT ${DOXYGEN_OUTPUT}
    COMMAND ${CMAKE_COMMAND} -E echo_append "Generating API documentation with Doxygen "
    COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE}
    COMMAND ${CMAKE_COMMAND} -E echo "done."
    WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
    DEPENDS ${DOXYFILE}
  )
  add_custom_target(documentation ALL DEPENDS ${DOXYGEN_OUTPUT})

# ############################################################################
# Install built documentation files
# ############################################################################
  install(DIRECTORY "${CMAKE_BINARY_DIR}/html" DESTINATION ${CMAKE_INSTALL_DOCDIR} COMPONENT documentation REGEX ".*\\.(chm|qch)" EXCLUDE)
  if(GENERATE_HTMLHELP)
    install(FILES "${CMAKE_BINARY_DIR}/html/${PROJECT_NAME}-${PROJECT_VERSION_MAJOR}.chm" DESTINATION ${CMAKE_INSTALL_DOCDIR} COMPONENT documentation)
  endif()
  if(GENERATE_QHP)
    install(FILES "${CMAKE_BINARY_DIR}/html/${PROJECT_NAME}-${PROJECT_VERSION_MAJOR}.qch" DESTINATION ${CMAKE_INSTALL_DOCDIR} COMPONENT documentation)
  endif()
  if(DOXYGEN_GENERATE_MAN)
    install(DIRECTORY "${CMAKE_BINARY_DIR}/man/man3" DESTINATION ${CMAKE_INSTALL_MANDIR} COMPONENT documentation)
    message(STATUS "CMAKE_INSTALL_MANDIR ${CMAKE_INSTALL_MANDIR}")
  endif()
endif()

# ############################################################################
# Install headers
# ############################################################################

install(FILES ${INST_HDRS}               DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}               COMPONENT development)
install(FILES ${INST_DEVICES_HDRS}       DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/devices       COMPONENT development)
install(FILES ${INST_EVENTHANDLERS_HDRS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/eventhandlers COMPONENT development)

# ############################################################################
# Install pkgconfig file and CMake config package
# ############################################################################

if(UNIX OR MINGW)
  configure_file("${CMAKE_SOURCE_DIR}/${PROJECT_NAME}.pc.cmake.in" ${PROJECT_NAME}.pc @ONLY)
  install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pc" DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
endif()

configure_package_config_file(${PROJECT_NAME_LOWER}-config.cmake.in ${PROJECT_NAME_LOWER}-config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
  PATH_VARS CMAKE_INSTALL_LIBDIR
)

write_basic_package_version_file("${CMAKE_BINARY_DIR}/${PROJECT_NAME_LOWER}-config-version.cmake"
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY ExactVersion
)

# To make the component usable not only from the install directory but also from the build directory
export(
  TARGETS ${PROJECT_NAME}
  FILE ${PROJECT_NAME_LOWER}-export.cmake
)

install(FILES "${CMAKE_BINARY_DIR}/${PROJECT_NAME_LOWER}-config.cmake" "${CMAKE_BINARY_DIR}/${PROJECT_NAME_LOWER}-config-version.cmake"
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
  COMPONENT development
)

install(EXPORT ${PROJECT_NAME}
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}-${PROJECT_VERSION}
  NAMESPACE ${PROJECT_NAME}::
  FILE ${PROJECT_NAME_LOWER}-export.cmake
  COMPONENT development
)

# ############################################################################
# New CPACK section, please see the README file inside cpack.d directory.
add_subdirectory(cpack.d)
