# I have better stuff to do than closing my
# constructs properly
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS True)

SET(COINDIR $ENV{COINDIR})

SET(COIN_NAMES Coin Coin3)
IF(APPLE)
  # Coin installs as a framework named Inventor on MacOS
  SET(COIN_NAMES ${COIN_NAMES} Inventor)
ENDIF(APPLE)

IF(COINDIR)
  # Look for Coin in environment variable COINDIR
  FIND_LIBRARY(Coin_LIBRARY NAMES ${COIN_NAMES} PATHS ${COINDIR} PATH_SUFFIXES src bin lib .)
  FIND_PATH(Coin_INCLUDE_DIR Inventor/SbLinear.h PATHS ${COINDIR} PATH_SUFFIXES include .)
  
  IF (Coin_INCLUDE_DIR AND Coin_LIBRARY)
     SET(Coin_FOUND TRUE)
  ENDIF (Coin_INCLUDE_DIR AND Coin_LIBRARY)
  
  IF (Coin_FOUND)
     IF (NOT Coin_FIND_QUIETLY)
        MESSAGE(STATUS "Found Coin: ${Coin_LIBRARY}")
     ENDIF (NOT Coin_FIND_QUIETLY)
  ELSE (Coin_FOUND)
     IF (Coin_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find Coin in ${COINDIR}.")
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
      SET(Coin_LIBRARY ${Coin_LIBRARIES})
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
      MESSAGE(STATUS "Wtf: " ${Coin_LIBRARY})
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

# Coin_DEFINES
IF (Coin_FOUND AND WIN32)
  IF(EXISTS ${Coin_INCLUDE_DIR}/../Coin.pc)
    FILE(READ ${Coin_INCLUDE_DIR}/../Coin.pc CoinPC)
    IF (${CoinPC} MATCHES COIN_DLL)
      SET(Coin_DEFINES -DCOIN_DLL)
    ELSE()
      SET(Coin_DEFINES -DCOIN_NOT_DLL)
    ENDIF()
  ELSE()
    MESSAGE(WARNING "Could not find Coin.pc, using -DCOIN_DLL. This may be wrong though...")
    # Cross your fingers...
    SET(Coin_DEFINES -DCOIN_DLL)
  ENDIF()
ENDIF()
