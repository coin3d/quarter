INCLUDE(SimArguments)

# SIM_ADD_HEADER_FILES(storeto RELATIVE path SOURCES sources)
# Adds all header files found that has a name similar to a
# file in the list of sourcefiles given. If the list of sources
# is File1.cpp;File2.cpp;File3.cpp the macro will look for
# File1.h, File1.hpp or File1.hxx and similar filenames for File2
# and File3. Note that the result is appended to the result variable
# (the first argument).
MACRO(SIM_ADD_HEADER_FILES storeto)
  SIM_VALIDATE_ARGUMENTS(ValidArguments SIM_ADD_HEADER_FILES
                         "RELATIVE;SOURCES"             # Required
                         "RELATIVE;SOURCES"             # Allowed
                         "${ARGN}")
  SIM_FETCH_ARGUMENTS(Path RELATIVE ${ARGN})
  SIM_FETCH_ARGUMENTS(Sources SOURCES ${ARGN})

  FOREACH(_source ${Sources})
    GET_FILENAME_COMPONENT(_noextension ${_source} NAME_WE)
    GET_FILENAME_COMPONENT(_path ${_source} PATH)
    IF("${_path}" STREQUAL "")
      SET(BasePath "${Path}/${_noextension}")
    ELSE("${_path}" STREQUAL "")
      SET(BasePath "${Path}/${_path}/${_noextension}")
    ENDIF("${_path}" STREQUAL "")

    STRING(REPLACE "${Path}/" "" ShortPath ${BasePath})
    IF(EXISTS "${BasePath}.h")
      LIST(APPEND ${storeto} "${ShortPath}.h")
    ELSEIF(EXISTS "${BasePath}.hpp")
      LIST(APPEND ${storeto} "${ShortPath}.hpp")
    ELSEIF(EXISTS "${BasePath}.hxx")
      LIST(APPEND ${storeto} "${ShortPath}.hxx")
    ENDIF(EXISTS "${BasePath}.h")
  ENDFOREACH(_source)
ENDMACRO(SIM_ADD_HEADER_FILES)

# SIM_GENERATE_MSVC_PROJECT(GroupPrefix SOURCES ProjectSources
#                                       [GENERATED_SOURCES GeneratedSources])
# Generates source groups for MSVC projects based on the directories
# of the source files.
MACRO(SIM_GENERATE_MSVC_PROJECT GroupPrefix)
 SIM_VALIDATE_ARGUMENTS(ValidArguments SIM_GENERATE_MSVC_PROJECT
                        "SOURCES"                           # Required
                        "SOURCES;GENERATED_SOURCES;PREFIX"  # Allowed
                        "${ARGN}")
 SIM_FETCH_ARGUMENTS(ProjectSources SOURCES ${ARGN})
 SIM_HAS_ARGUMENT(HasGeneratedSources GENERATED_SOURCES ${ARGN})
 SIM_FETCH_ARGUMENTS(GeneratedSources GENERATED_SOURCES ${ARGN})

 SET(GroupPrefix ${GroupPrefix}\\)


 # Regular sources
 FOREACH(Source ${ProjectSources})
   GET_FILENAME_COMPONENT(RelativePath ${Source} PATH)
   SET(RelativePath "${GroupPrefix}${RelativePath}")
   STRING(REGEX REPLACE "[\\\\/][^\\\\/]*$" "" RelativePath "${RelativePath}")
   STRING(REGEX REPLACE "^[\\\\/]" "" RelativePath "${RelativePath}")
   STRING(REGEX REPLACE "/" "\\\\\\\\" RelativePath "${RelativePath}")

   SOURCE_GROUP("${RelativePath}" FILES ${Source})
 ENDFOREACH(Source)

 # Put all generated stuff in a seperate folder
 IF(HasGeneratedSources)
   SOURCE_GROUP(".generated" FILES ${GeneratedSources})
 ENDIF(HasGeneratedSources)

ENDMACRO(SIM_GENERATE_MSVC_PROJECT)
