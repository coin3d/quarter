# Index:
#
#   SIM_HAS_ARGUMENT(hasargument keyword argumentstoparse)
#     Macro for checking if a list of arguments contain a given CMake-style argument.
#
#   SIM_FETCH_ARGUMENTS(result keyword argumentstoparse)
#     Macro for fetching a list of arguments for a given CMake-style argument.
#
#   SIM_VALIDATE_ARGUMENTS(Result SomeMethodName "REQUIRED1;REQUIRED2;..."
#                          "ALLOWED1;ALLOWED2;..." "${ARGV}")
#     Macro to validate a CMake-style argument list.


# SIM_HAS_ARGUMENT(hasargument keyword argumentstoparse)
# Smart argument parsing for using arguments in a CMake way, e.g
# MY_MAGIC_MACRO(ARGUMENT1 value1 ARGUMENT2 value2 ARGUMENTLIST value31 value 32)
# This macro checks wheter a list of arguments contains the given argument or not.
# Usage example:
#   A user calls the macro MY_MACRO(DESTINATION "lib/" FILES lib1.lib lib2.lib lib3.lib)
#   MY_MACRO calls SIM_HAS_ARGUMENT() to check if has a couple of arguments:
#   SIM_HAS_ARGUMENT(Destination DESTINATION ${ARGV})
#   SIM_HAS_ARGUMENT(Files FILES ${ARGV})
#   SIM_HAS_ARGUMENT(Nonexistant NONEXISTANT ${ARGV}
#
#   ${Destination} and ${Files} is now TRUE, while ${Nonexistant} is FALSE.
# Note that the result will be true regardless of if the argument has a value or not.
MACRO(SIM_HAS_ARGUMENT hasargument keyword)
  SET(${hasargument} FALSE)
  SET(Args ${ARGN})
  LIST(LENGTH Args Count)
  IF(${Count} GREATER 0)
    # There may be arguments available, process them
    SET(Index 0)
    MATH(EXPR Count "${Count} - 1")
    LIST(GET Args ${Index} Element)

    # Spool to the argument we are looking for
    WHILE(NOT ${Index} GREATER ${Count} AND NOT Element STREQUAL "${keyword}")
      MATH(EXPR Index "${Index} + 1")
      IF(NOT ${Index} GREATER ${Count})
        LIST(GET Args ${Index} Element)
      ENDIF(NOT ${Index} GREATER ${Count})
    ENDWHILE(NOT ${Index} GREATER ${Count} AND NOT Element STREQUAL "${keyword}")

    # Check if the element was found
    IF(Element STREQUAL "${keyword}")
      SET(${hasargument} TRUE)
    ENDIF(Element STREQUAL "${keyword}")
  ENDIF(${Count} GREATER 0)
ENDMACRO(SIM_HAS_ARGUMENT)

# SIM_FETCH_ARGUMENTS(result keyword argumentstoparse)
# Smart argument parsing for using arguments in a CMake way, e.g
# MY_MAGIC_MACRO(ARGUMENT1 value1 ARGUMENT2 value2 ARGUMENTLIST value31 value 32)
# This macro fetches one list of arguments after a given keyword (should be uppercase),
# untill an all uppercase word is encountered.
#
# Usage example:
#   A user calls the macro MY_MACRO(DESTINATION "lib/" FILES lib1.lib lib2.lib lib3.lib)
#   MY_MACRO calls SIM_FETCH_MACROS() to resolve arguments:
#   SIM_FETCH_ARGUMENTS(Destination DESTINATION ${ARGV})
#   SIM_FETCH_ARGUMENTS(Files FILES ${ARGV})
#   ${Destination} is now "lib/" and ${Files} contains the list of lib files.
MACRO(SIM_FETCH_ARGUMENTS result keyword)
  SET(Args ${ARGN})
  LIST(LENGTH Args Count)
  IF(${Count} GREATER 0)
    # Algorithm:
    # 1. Increment index until argument[index] = keyword
    # 2. Increment index until argument[index] not is an ALL_UPPER_CASE_WORD
    #    For each of the elements found, add it to the result list

    # Create arguments list
    SET(Index 0)
    MATH(EXPR Count "${Count} - 1")
    LIST(GET Args ${Index} Element)

    # 1. Spool to the argument we are looking for
    WHILE(NOT ${Index} GREATER ${Count} AND NOT "${Element}" STREQUAL "${keyword}")
      MATH(EXPR Index "${Index} + 1")
      IF(NOT ${Index} GREATER ${Count})
        LIST(GET Args ${Index} Element)
      ENDIF(NOT ${Index} GREATER ${Count})
    ENDWHILE(NOT ${Index} GREATER ${Count} AND NOT "${Element}" STREQUAL "${keyword}")

    # 2. Iterate through list
    SET(ResultList )
    MATH(EXPR Index "${Index} + 1")
    IF(NOT ${Index} GREATER ${Count})
      LIST(GET Args ${Index} Element)
      STRING(TOUPPER ${Element} UpperElement)
    ENDIF(NOT ${Index} GREATER ${Count})
    WHILE(NOT "${Element}" STREQUAL "${UpperElement}" AND NOT ${Index} GREATER ${Count})
      LIST(APPEND ResultList ${Element})
      # Get the next element
      MATH(EXPR Index "${Index} + 1")
      IF(NOT ${Index} GREATER ${Count})
        LIST(GET Args ${Index} Element)
        STRING(TOUPPER ${Element} UpperElement)
      ENDIF(NOT ${Index} GREATER ${Count})
    ENDWHILE(NOT "${Element}" STREQUAL "${UpperElement}" AND NOT ${Index} GREATER ${Count})

    # Return
    SET(${result} ${ResultList})
  ENDIF(${Count} GREATER 0)
ENDMACRO(SIM_FETCH_ARGUMENTS)

# Usage:
# SIM_VALIDATE_ARGUMENTS(Result SomeMethodName "REQUIRED1;REQUIRED2 ..."
#                        "ALLOWED1;ALLOWED2;" "${ARGV}")
# Note that the arguments are encapsulated in "..." and separated by ;
# Checks if arguments given by the last argument contains the required
# arguments, and that all arguments are allowed.
#
# Outputs a ERROR message if one of the required arguments wasnt found,
# and sets Result to TRUE or FALSE.
MACRO(SIM_VALIDATE_ARGUMENTS success method required allowed args)
  SET(${success} TRUE)

  # Check required arguments
  FOREACH(req ${required})
    SET(Found FALSE)
    FOREACH(argv ${args})
      # Check if argument matches requirement
      IF(argv STREQUAL "${req}")
        SET(Found TRUE)
      ENDIF(argv STREQUAL "${req}")
    ENDFOREACH(argv)

    IF(Found)
    ELSE(Found)
      MESSAGE(SEND_ERROR "Argument ${req} is required by ${method}, but was not found in ${args}.")
      SET(${success} FALSE)
    ENDIF(Found)
  ENDFOREACH(req)

  # Build a list of found arguments
  SET(Arguments )
  FOREACH(argv ${args})
    # Add to found arguments if ${argv} is all uppercase
    STRING(TOUPPER ${argv} Upper)
    IF(Upper STREQUAL "${argv}")
      LIST(APPEND Arguments ${argv})
    ENDIF(Upper STREQUAL "${argv}")
  ENDFOREACH(argv)

  # Check if all the found arguments is allowed
  FOREACH(argv ${Arguments})
    SET(Found FALSE)
    FOREACH(allowedarg ${allowed})
      # Check if argument matches the allowed entry
      IF(allowedarg STREQUAL "${argv}")
        SET(Found TRUE)
      ELSEIF(allowedarg STREQUAL "*")
        SET(Found TRUE)
      ENDIF(allowedarg STREQUAL "${argv}")
    ENDFOREACH(allowedarg)

    IF(Found)
    ELSE(Found)
      MESSAGE(SEND_ERROR "Argument ${argv} is not allowed by ${method}")
      SET(${success} FALSE)
    ENDIF(Found)
  ENDFOREACH(argv)

ENDMACRO(SIM_VALIDATE_ARGUMENTS)
