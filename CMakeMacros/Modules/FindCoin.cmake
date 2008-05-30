SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS True)

SET(COINDIR $ENV{COINDIR})

SET(COIN_NAMES Coin Coin3)
SET(COIN_NAMES_DEBUG Coind Coin3d)

IF(APPLE)
  # Coin installs as a framework named Inventor on MacOS
  SET(COIN_NAMES ${COIN_NAMES} Inventor)
ENDIF(APPLE)

IF(COINDIR)
  # Look for Coin in environment variable COINDIR
  FIND_LIBRARY(Coin_LIBRARY_RELEASE NAMES ${COIN_NAMES} PATHS ${COINDIR} PATH_SUFFIXES src bin lib . NO_DEFAULT_PATH)
  FIND_LIBRARY(Coin_LIBRARY_DEBUG NAMES ${COIN_NAMES_DEBUG} PATHS ${COINDIR} PATH_SUFFIXES src bin lib . NO_DEFAULT_PATH)
  
  IF(Coin_LIBRARY_RELEASE AND NOT Coin_LIBRARY_DEBUG)
    SET(Coin_LIBRARY_DEBUG ${Coin_LIBRARY_RELEASE})
    SET(Coin_LIBRARY       ${Coin_LIBRARY_RELEASE})
    SET(Coin_LIBRARIES     ${Coin_LIBRARY_RELEASE})
  ENDIF()
  
  IF(Coin_LIBRARY_DEBUG AND NOT Coin_LIBRARY_RELEASE)
    SET(Coin_LIBRARY_RELEASE ${Coin_LIBRARY_DEBUG})
    SET(Coin_LIBRARY       ${Coin_LIBRARY_DEBUG})
    SET(Coin_LIBRARIES     ${Coin_LIBRARY_DEBUG})
  ENDIF()
  
  IF(Coin_LIBRARY_DEBUG AND Coin_LIBRARY_RELEASE)
    IF(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE)
      #If the generator supports configuration types then set
      #optimized and debug libraries, or if the CMAKE_BUILD_TYPE has a value
      SET(Coin_LIBRARY optimized ${Coin_LIBRARY_RELEASE} debug ${Coin_LIBRARY_DEBUG})
    ELSE()
      #If there are no configuration types and CMAKE_BUILD_TYPE has no value
      #then just use the release libraries
      SET(Coin_LIBRARY ${Coin_LIBRARY_RELEASE})
    ENDIF()    
    SET(Coin_LIBRARIES optimized ${Coin_LIBRARY_RELEASE} debug ${Coin_LIBRARY_DEBUG})
  ENDIF()

  SET(Coin_LIBRARY ${Coin_LIBRARY} CACHE FILEPATH "The Coin library")  
  MARK_AS_ADVANCED(Coin_LIBRARY_RELEASE Coin_LIBRARY_DEBUG)
  
  FIND_PATH(Coin_INCLUDE_DIR Inventor/SbLinear.h PATHS ${COINDIR} PATH_SUFFIXES include . NO_DEFAULT_PATH)
  
  IF (Coin_INCLUDE_DIR AND Coin_LIBRARY)
     SET(Coin_FOUND TRUE)
  ENDIF ()
  
  IF (Coin_FOUND)
     IF (NOT Coin_FIND_QUIETLY)
        MESSAGE(STATUS "Found Coin: ${Coin_LIBRARY}")
     ENDIF (NOT Coin_FIND_QUIETLY)
  ELSE (Coin_FOUND)
     IF (Coin_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find Coin in ${COINDIR} - try changing the COINDIR environment variable.")
     ENDIF (Coin_FIND_REQUIRED)
  ENDIF (Coin_FOUND)
  
ELSE(COINDIR)
  # pkgconfig supported?
  INCLUDE(FindPkgConfig)
  
  IF(PKG_CONFIG_FOUND)
    IF (NOT Coin_FIND_QUIETLY)
      MESSAGE(STATUS "Using pkg-config to locate Coin.")
    ENDIF(NOT Coin_FIND_QUIETLY)

    pkg_search_module(Coin Coin)
    IF(Coin_FOUND)
      MESSAGE(STATUS "Coin located using pkg-config.")
      SET(Coin_LIBRARY ${Coin_LIBRARIES} ${Coin_LDFLAGS})
      SET(Coin_INCLUDE_DIR ${Coin_INCLUDE_DIRS})
    ENDIF(Coin_FOUND)
  ENDIF(PKG_CONFIG_FOUND)

  # Automatic find, if pkg-config fails
  IF(NOT Coin_FOUND)
    FIND_PATH(Coin_INCLUDE_DIR Inventor/SbLinear.h)
    FIND_LIBRARY(Coin_LIBRARY NAMES ${COIN_NAMES})
    
    IF (APPLE)
      FIND_LIBRARY(Ogl_LIBRARY OpenGL)
      SET(Coin_LIBRARY ${Coin_LIBRARY} ${Ogl_LIBRARY})
    ENDIF(APPLE)
    IF (Coin_INCLUDE_DIR AND Coin_LIBRARY)
       SET(Coin_FOUND TRUE)
    ENDIF (Coin_INCLUDE_DIR AND Coin_LIBRARY)
  ENDIF(NOT Coin_FOUND)
 
  # Process stuff 
  IF (Coin_FOUND)     
     IF (NOT Coin_FIND_QUIETLY)
        MESSAGE(STATUS "Found Coin: ${Coin_LIBRARY}")
     ENDIF (NOT Coin_FIND_QUIETLY)
  ELSE (Coin_FOUND)
     IF (Coin_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find Coin. Try setting the COINDIR environment variable to the root of the Coin 3 installation directory.")
     ENDIF (Coin_FIND_REQUIRED)
  ENDIF (Coin_FOUND)
ENDIF(COINDIR)

# Coin_DEFINES - only on WIN32
IF (Coin_FOUND AND WIN32)
  FIND_FILE(Coin_pc NAMES Coin.pc PATHS ${Coin_INCLUDE_DIR}/../ PATH_SUFFIXES . lib/pkgconfig/ NO_DEFAULT_PATH)
  MARK_AS_ADVANCED(Coin_pc)
  IF(EXISTS ${Coin_pc})
    FILE(READ ${Coin_pc} CoinPC)
    IF (${CoinPC} MATCHES COIN_DLL)
      MESSAGE(STATUS "Found Coin.pc with -DCOIN_DLL")
      SET(Coin_DEFINES -DCOIN_DLL)
    ELSE()
      MESSAGE(STATUS "Found Coin.pc with -DCOIN_NOT_DLL")
      SET(Coin_DEFINES -DCOIN_NOT_DLL)
    ENDIF()
  ELSE()
    MESSAGE(STATUS "WARNING: Could not find Coin.pc, using -DCOIN_DLL. This may be wrong though...")
    # Cross your fingers...
    SET(Coin_DEFINES -DCOIN_DLL)
  ENDIF()
ENDIF()
