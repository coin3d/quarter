# -------------------------------------------------------
# Unit for standardizing how SIM dependencies are found
# by CMake. Attempts to simplify implementation of new
# SIM Find*-macros and ensure all Find*-macros behave
# the same way.
#
# All this generalizations makes the implementation
# somewhat hard to read, but there's not much difference
# from a regular Find-macro except that of setting
# Library_INCLUDE_DIR etc this is done using temporar
# variables ${INCLUDE_DIR_VAR} which will be set to
# "Library_INCLUDE_DIR".
#
# Should be extended with more functionallity, such as
# integration with NSIS installers and pkgconfig support.
# -------------------------------------------------------


SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS True)
INCLUDE(SimArguments)

# SIM_FIND(library RELEASELIBNAMES library0 library1 ...
#                  DEBUGLIBNAMES library0d library1d ...
#                  INCLUDEFILE path/include.h
#                  [LIB_DIR_SUFFIXES lib bin .]
#                  [INCLUDE_DIR_SUFFIXES include src .]
#                  [NO_DEFINES])
MACRO(SIM_FIND library)
  SIM_VALIDATE_ARGUMENTS(ValidArguments SIM_FIND
                         "RELEASELIBNAMES;INCLUDEFILE" # Required
                         "RELEASELIBNAMES;DEBUGLIBNAMES;PKGCONFIGNAME;INCLUDEFILE;LIB_DIR_SUFFIXES;INCLUDE_DIR_SUFFIXES;NO_DEFINES;NO_PKGCONFIG" # Allowed
                         "${ARGN}") 
  # Provide default debug lib names
  SIM_HAS_ARGUMENT(HasDebugLibNames "DEBUGLIBNAMES")
  IF(HasDebugLibNames)
    SET(Arguments ${ARGN})
  ELSE(HasDebugLibNames)
    SIM_FETCH_ARGUMENTS(ReleaseLibnames RELEASELIBNAMES ${ARGN})
    SET(Arguments ${ARGN} DEBUGLIBNAMES ${ReleaseLibnames})
  ENDIF(HasDebugLibNames)
  
  SIM_HAS_ARGUMENT(NoDefines "NO_DEFINES" ${ARGN})
  SIM_HAS_ARGUMENT(NoPkgConfig "NO_PKGCONFIG" ${ARGN})
  SIM_FETCH_ARGUMENTS(PkgConfigName PKGCONFIGNAME ${ARGN})
  
  STRING(TOUPPER ${library} LIBRARY)
  SET(FINDDIRVAR "${LIBRARY}DIR")
  SET(DIR ${${FINDDIRVAR}})  
  SET(ENVDIR $ENV{${FINDDIRVAR}})
  SET(FOUND_VAR "${library}_FOUND")
  SET(FIND_QUIETLY_VAR "${library}_FIND_QUIETLY")
  IF(NOT PkgConfigName)
    SET(PkgConfigName ${library})
  ENDIF()

  # Figure out the directory specified by the user
  IF(NOT DIR)
    IF(ENVDIR)
      SET(DIR ${ENVDIR})
      IF(NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Setting ${FINDDIRVAR} to \"${DIR}\" from environment variable.")
      ENDIF()
    ELSEIF(SIMINSTALLDIR)
      SET(DIR ${SIMINSTALLDIR})
      IF(NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Setting ${FINDDIRVAR} to \"${DIR}\" from SIMINSTALLDIR variable.")
      ENDIF()
    ENDIF()
  ELSE()
    SET(DIR ${${FINDDIRVAR}})
  ENDIF()
  
  # Find in directory specified by user
  IF(DIR)
    FILE(TO_CMAKE_PATH ${DIR} DIR)
    SIM_FIND_BY_DIR(${library} DIR ${DIR} ${Arguments})
    IF(${FOUND_VAR} AND NOT NoDefines)
      SIM_FIND_SET_DEFINES(${library})
    ENDIF()
  ELSE()
    # Look for pkgconfig
    INCLUDE(FindPkgConfig)
    
    IF (PKG_CONFIG_FOUND AND NOT NoPkgConfig AND NOT NO_PKG_CONFIG)
      SIM_FIND_PKGCONFIG(${PkgConfigName} ${library})
    ELSE()
      SIM_FIND_AUTO(${library} ${Arguments})
    ENDIF()
  ENDIF()
  
ENDMACRO(SIM_FIND)

# Macro for finding a library when variable LIBRARYDIR is set
MACRO(SIM_FIND_BY_DIR library)
  SIM_VALIDATE_ARGUMENTS(ValidArguments SIM_FIND_BY_DIR
                         "RELEASELIBNAMES;DEBUGLIBNAMES;DIR;INCLUDEFILE" # Required
                         "*" # Allowed
                         "${ARGN}")
  SIM_FETCH_ARGUMENTS(ReleaseLibnames RELEASELIBNAMES ${ARGN})
  SIM_FETCH_ARGUMENTS(DebugLibnames DEBUGLIBNAMES ${ARGN})
  SIM_FETCH_ARGUMENTS(Dir DIR ${ARGN})
  SIM_FETCH_ARGUMENTS(IncludeFile INCLUDEFILE ${ARGN})
  SIM_FETCH_ARGUMENTS(IncludeDirSuffixes INCLUDE_DIR_SUFFIXES ${ARGN})
  IF(NOT IncludeDirSuffixes)
    SET(IncludeDirSuffixes include src .)
  ENDIF()
  SIM_FETCH_ARGUMENTS(LibDirSuffixes LIB_DIR_SUFFIXES ${ARGN})
  IF(NOT LibDirSuffixes)
    SET(LibDirSuffixes bin lib .)
  ENDIF()
  
  # Create variables
  SET(LIBRARY_RELEASE_VAR "${library}_LIBRARY_RELEASE")
  SET(LIBRARY_DEBUG_VAR "${library}_LIBRARY_DEBUG")
  SET(LIBRARY_VAR "${library}_LIBRARY")
  SET(LIBRARIES_VAR "${library}_LIBRARIES")
  SET(INCLUDE_DIR_VAR "${library}_INCLUDE_DIR")
  SET(FOUND_VAR "${library}_FOUND")
  SET(FIND_QUIETLY_VAR "${library}_FIND_QUIETLY")
  SET(FIND_REQUIRED_VAR "${library}_FIND_REQUIRED")
  
  # Look for library
  FIND_LIBRARY(${LIBRARY_RELEASE_VAR} 
               NAMES ${ReleaseLibnames} 
               PATHS ${Dir} 
               PATH_SUFFIXES ${LibDirSuffixes} 
               NO_DEFAULT_PATH)
  FIND_LIBRARY(${LIBRARY_DEBUG_VAR}
               NAMES ${DebugLibnames} 
               PATHS ${Dir} 
               PATH_SUFFIXES ${LibDirSuffixes} 
               NO_DEFAULT_PATH)
  
  #Use only release library if debug library is not found
  IF(${LIBRARY_RELEASE_VAR} AND NOT ${LIBRARY_DEBUG_VAR})
    SET(${LIBRARY_DEBUG_VAR} ${${LIBRARY_RELEASE_VAR}})
    SET(${LIBRARY_VAR}       ${${LIBRARY_RELEASE_VAR}})
    SET(${LIBRARIES_VAR}     ${${LIBRARY_RELEASE_VAR}})
  ENDIF()
  #Use only debug library if release library is not found
  IF(${LIBRARY_DEBUG_VAR} AND NOT ${LIBRARY_RELEASE_VAR})
    SET(${LIBRARY_RELEASE_VAR}  ${${LIBRARY_DEBUG_VAR}})
    SET(${LIBRARY_VAR}          ${${LIBRARY_DEBUG_VAR}})
    SET(${LIBRARIES_VAR}        ${${LIBRARY_DEBUG_VAR}})
  ENDIF()
  
  # Set Library_LIBRARY and Library_LIBRARIES
  IF(${LIBRARY_DEBUG_VAR} AND ${LIBRARY_RELEASE_VAR})
    IF(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)
      #If the generator supports configuration types then set
      #optimized and debug libraries, or if the CMAKE_BUILD_TYPE has a value
      SET(${LIBRARY_VAR} optimized ${${LIBRARY_RELEASE_VAR}} debug ${${LIBRARY_DEBUG_VAR}})
    ELSE()
      #If there are no configuration types and CMAKE_BUILD_TYPE has no value
      #then just use the release libraries
      SET(${LIBRARY_VAR} ${${LIBRARY_RELEASE_VAR}})
    ENDIF()
  ENDIF()
  SET(${LIBRARY_VAR} ${${LIBRARY_VAR}} CACHE FILEPATH "The ${library} library")
  SET(${LIBRARIES_VAR} ${${LIBRARY_VAR}} CACHE FILEPATH "The ${library} library")
  MARK_AS_ADVANCED(${LIBRARY_RELEASE_VAR} ${LIBRARY_DEBUG_VAR})

  # Find include
  FIND_PATH(${INCLUDE_DIR_VAR} 
            NAMES ${IncludeFile} 
            PATHS ${DIR} 
            PATH_SUFFIXES ${IncludeDirSuffixes} 
            NO_DEFAULT_PATH)
  SET(${INCLUDE_DIR_VAR} ${${INCLUDE_DIR_VAR}} CACHE FILEPATH "The ${library} include path")

  # Determine if library was found or not
  IF(${INCLUDE_DIR_VAR} AND ${LIBRARY_VAR})
    SET(${FOUND_VAR} TRUE)
  ELSE()
    IF(${LIBRARY_VAR})
     IF (${FIND_REQUIRED_VAR})
	MESSAGE(FATAL_ERROR "${library} is installed without headers. You probably need to install the development version of ${library}.")
     ELSEIF(NOT ${FIND_QUIETLY_VAR})
       MESSAGE(STATUS "${library} is installed without headers. You probably need to install the development version of ${library}.")
     ENDIF()
    ENDIF()
    SET(${FOUND_VAR} FALSE)
  ENDIF()

  IF (${FOUND_VAR})
     IF (NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Found ${library}: ${${LIBRARY_VAR}}")
     ENDIF()
  ELSE (${FOUND_VAR})
     IF (${FIND_REQUIRED_VAR})
        MESSAGE(FATAL_ERROR "Could not find ${library} in ${Dir}.")
     ELSEIF(NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Could not find ${library} in ${Dir}.")
     ENDIF()
  ENDIF()
ENDMACRO(SIM_FIND_BY_DIR)

# Macro for finding a library automatically using CMake
MACRO(SIM_FIND_AUTO library)
  SIM_VALIDATE_ARGUMENTS(ValidArguments SIM_FIND_BY_DIR
                         "RELEASELIBNAMES;DEBUGLIBNAMES;INCLUDEFILE" # Required
                         "*" # Allowed
                         "${ARGN}")
  SIM_FETCH_ARGUMENTS(ReleaseLibnames RELEASELIBNAMES ${ARGN})
  SIM_FETCH_ARGUMENTS(DebugLibnames DEBUGRELEASENAMES ${ARGN})
  SIM_FETCH_ARGUMENTS(IncludeFile INCLUDEFILE ${ARGN})
  SIM_FETCH_ARGUMENTS(IncludeDirSuffixes INCLUDE_DIR_SUFFIXES ${ARGN})
  IF(NOT IncludeDirSuffixes)
    SET(IncludeDirSuffixes include src .)
  ENDIF()
  SIM_FETCH_ARGUMENTS(LibDirSuffixes LIB_DIR_SUFFIXES ${ARGN})
  IF(NOT LibDirSuffixes)
    SET(LibDirSuffixes bin lib .)
  ENDIF()
  STRING(TOUPPER ${library} LIBRARY)
  
  # Create variables
  SET(LIBRARY_RELEASE_VAR "${library}_LIBRARY_RELEASE")
  SET(LIBRARY_DEBUG_VAR "${library}_LIBRARY_DEBUG")
  SET(LIBRARY_VAR "${library}_LIBRARY")
  SET(LIBRARIES_VAR "${library}_LIBRARIES")
  SET(INCLUDE_DIR_VAR "${library}_INCLUDE_DIR")
  SET(FOUND_VAR "${library}_FOUND")
  SET(FIND_QUIETLY_VAR "${library}_FIND_QUIETLY")
  SET(FIND_REQUIRED_VAR "${library}_FIND_REQUIRED")

  # CMake find
  FIND_PATH(${INCLUDE_DIR_VAR} 
            NAMES ${IncludeFile} 
            PATH_SUFFIXES ${IncludeDirSuffixes})
  FIND_LIBRARY(${LIBRARY_VAR}
               NAMES ${LibDirSuffixes}
               PATH_SUFFIXES ${LibDirSuffixes})
               
  IF(${INCLUDE_DIR_VAR} AND ${LIBRARY_VAR})
    SET(${FOUND_VAR} TRUE)
  ELSE()
    SET(${FOUND_VAR} FALSE)
  ENDIF()
  
  IF (${FOUND_VAR})
     IF (NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Found ${library}: ${${LIBRARY_VAR}}")
     ENDIF()
  ELSE (${FOUND_VAR})
     IF (${FIND_REQUIRED_VAR})
        MESSAGE(FATAL_ERROR "Could not find ${library}, try running with -D${LIBRARY}DIR=path.")
     ELSEIF(NOT ${FIND_QUIETLY_VAR})
        MESSAGE(STATUS "Could not find ${library}, try running with -D${LIBRARY}DIR=path.")
     ENDIF()
  ENDIF()
ENDMACRO(SIM_FIND_AUTO)

# Macro for finding a library automatically using pkgconfig
MACRO(SIM_FIND_PKGCONFIG pkglibraryname library)
  STRING(TOUPPER ${library} LIBRARY)
  
  # Create pkg-config result variables
  SET(PKG_LIBRARY_VAR "${pkglibraryname}_LIBRARIES")
  SET(PKG_LIBRARY_DIR_VAR "${pkglibraryname}_LIBRARY_DIRS")
  SET(PKG_INCLUDE_DIR_VAR "${pkglibraryname}_INCLUDE_DIRS")
  SET(PKG_FOUND_VAR "${pkglibraryname}_FOUND")
  SET(PKG_DEFINES_VAR "${pkglibraryname}_DEFINES")

  # Create output variables
  SET(LIBRARY_VAR "${library}_LIBRARY")
  SET(LIBRARIES_VAR "${library}_LIBRARIES")
  SET(INCLUDE_DIR_VAR "${library}_INCLUDE_DIR")
  SET(INCLUDE_DIRS_VAR "${library}_INCLUDE_DIRS")
  SET(LIBRARY_DIR_VAR "${library}_LIBRARY_DIR")
  SET(LIBRARY_DIRS_VAR "${library}_LIBRARY_DIRS")
  SET(FOUND_VAR "${library}_FOUND")
  SET(FIND_QUIETLY_VAR "${library}_FIND_QUIETLY")
  SET(FIND_REQUIRED_VAR "${library}_FIND_REQUIRED")
  SET(DEFINES_VAR "${library}_DEFINES")
  SET(CFLAGS_VAR "${library}_CFLAGS")
  SET(LDFLAGS_VAR "${library}_LDFLAGS")
  
  # Find library
  IF(${FIND_REQUIRED_VAR})
    PKG_SEARCH_MODULE(${pkglibraryname} REQUIRED ${pkglibraryname})
  ELSE()
    PKG_SEARCH_MODULE(${pkglibraryname} ${pkglibraryname})
  ENDIF()

  # Update output variables
  SET(${LIBRARIES_VAR} ${${PKG_LIBRARY_VAR}})
  SET(${LIBRARY_DIR_VAR} ${${PKG_LIBRARY_DIR_VAR}})
  SET(${INCLUDE_DIRS_VAR} ${${PKG_INCLUDE_DIR_VAR}})
  SET(${FOUND_VAR} ${${PKG_FOUND_VAR}})
  SET(${DEFINES_VAR} ${${PKG_DEFINES_VAR}})
  SET(${LIBRARY_VAR} ${${LIBRARIES_VAR}})
  SET(${INCLUDE_DIR_VAR} ${${INCLUDE_DIRS_VAR}})

  IF(${FOUND_VAR})
    IF (NOT ${FIND_QUIETLY_VAR})
      MESSAGE(STATUS "Found ${library}: ${${LIBRARY_VAR}} using pkgconfig.")
    ENDIF()
  ELSE()
    IF (${FIND_REQUIRED_VAR})
      MESSAGE(FATAL_ERROR "Could not find ${library}, try running cmake with -DDNO_PKG_CONFIG=1 or -D${LIBRARY}DIR=path.")
    ELSEIF(NOT ${FIND_QUIETLY_VAR})
      MESSAGE(STATUS "Could not find ${library} (Disable pkgconfig by using -DNO_PKG_CONFIG=1)")
    ENDIF()
  ENDIF()
ENDMACRO(SIM_FIND_PKGCONFIG)


# Created #defines LIBRARY_DLL or LIBRARY_NOT_DLL on Windows
MACRO(SIM_FIND_SET_DEFINES library)
  STRING(TOUPPER ${library} LIBRARY)
  SET(LIBRARY_PC_FILE "${library}.pc")
  
  # Create variables
  SET(LIBRARY_RELEASE_VAR "${library}_LIBRARY_RELEASE")
  SET(LIBRARY_DEBUG_VAR "${library}_LIBRARY_DEBUG")
  SET(LIBRARY_VAR "${library}_LIBRARY")
  SET(LIBRARIES_VAR "${library}_LIBRARIES")
  
  SET(FIND_QUIETLY_VAR "${library}_FIND_QUIETLY")
  SET(FIND_REQUIRED_VAR "${library}_FIND_REQUIRED")
  
  SET(INCLUDE_DIR_VAR "${library}_INCLUDE_DIR")
  SET(FOUND_VAR "${library}_FOUND")
  SET(NOT_DLL_VAR "${library}_NOT_DLL")
  SET(DLL_VAR "${library}_DLL")
  SET(DEFINES_VAR "${library}_DEFINES")

  IF (${FOUND_VAR} AND WIN32)
    SET(LibraryPc "")
    FIND_FILE(LibraryPc 
              NAMES "${library}.pc"
              PATHS "${${INCLUDE_DIR_VAR}}/../"
              PATH_SUFFIXES . lib/pkgconfig/ 
             NO_DEFAULT_PATH)
    IF(EXISTS ${LibraryPc})      
      FILE(READ ${LibraryPc} PkgConfigBuf)
      IF ("${PkgConfigBuf}" MATCHES "${LIBRARY}_DLL")
        MESSAGE(STATUS "Found ${library}.pc with -D${LIBRARY}_DLL")
        SET(${DEFINES_VAR} "-D${LIBRARY}_DLL")
      ELSEIF("${PkgConfigBuf}" MATCHES "${LIBRARY}_NOT_DLL")
        MESSAGE(STATUS "Found ${library}.pc with -D${LIBRARY}_NOT_DLL")
        SET(${DEFINES_VAR} "-D${LIBRARY}_NOT_DLL")
      ELSE()
        MESSAGE(FATAL_ERROR "Couldn't find ${library}.pc or does not contain a ${LIBRARY}_*DLL definition")
      ENDIF()
    ELSEIF(${NOT_DLL_VAR})
      SET(${DEFINES_VAR} "-D${LIBRARY}_NOT_DLL")
    ELSEIF(${DLL_VAR})
      SET(${DEFINES_VAR} "-D${LIBRARY}_DLL")
    ELSE()
      MESSAGE(STATUS "WARNING: Could not find ${library}.pc, using -D${LIBRARY}_DLL=1. Override or remove this warning using cmake -D${LIBRARY}_NOT_DLL=1 or cmake -D${LIBRARY}_DLL=1.")
      # Cross your fingers...
      SET(${DEFINES_VAR} "-D${LIBRARY}_DLL")
    ENDIF()
  ENDIF()
ENDMACRO(SIM_FIND_SET_DEFINES)
