INCLUDE(SimQtMacros)

SET(Library Quarter)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

# Generate list of sources
FILE(GLOB_RECURSE Sources RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cpp)
# Mocs
FILE(GLOB_RECURSE MocHeaders RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.h)
SIM_QT4_AUTO_WRAP_CPP(MocSources ${MocHeaders})

# Some convenient variables
SET(AllSources ${Sources} ${MocSources})
SET(AllLibs ${Coin_LIBRARY} ${QT_LIBRARIES} ${OPENGL_gl_LIBRARY})

# What to build
ADD_DEFINITIONS(-DQUARTER_INTERNAL)
IF(WIN32)
  ADD_DEFINITIONS(-DQUARTER_MAKE_DLL)
ENDIF(WIN32)

# The library
ADD_LIBRARY(${Library} ${AllSources})
TARGET_LINK_LIBRARIES(${Library} ${AllLibs} MocsLib)
ADD_DEPENDENCIES(${Library} MocsLib)

# Make install
INSTALL(TARGETS Quarter DESTINATION lib/)