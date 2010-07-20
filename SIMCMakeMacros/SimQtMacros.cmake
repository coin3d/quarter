INCLUDE(${QT_USE_FILE})
INCLUDE(SimMSVC)

# SIM_QT4_WRAP_CPP(outfiles infiles ... )
MACRO(SIM_QT4_AUTO_WRAP_CPP outfiles )
  # Clear list to be sure - QT4_WRAP_CPP doesnt do it
  # FIXME: Is this what we want, really? Several of the built-in macros
  # behave as "append", not "set" - rolvs
  SET(${outfiles} )

  FOREACH(_current_FILE ${ARGN})
    # Read file
    GET_FILENAME_COMPONENT(_abs_FILE ${_current_FILE} ABSOLUTE)
    FILE(READ ${_abs_FILE} _contents)

    # Process file
    STRING(REGEX MATCHALL "Q_OBJECT" _match "${_contents}")

    IF(_match)
      # Found a file that needs to be moc'ed, do it
      #GET_FILENAME_COMPONENT(_basename ${_current_FILE} NAME_WE)
      #SET(_moced_FILE "moc_${_basename}.cpp"}}
      QT4_WRAP_CPP(${outfiles} ${_current_FILE})
    ENDIF(_match)

  ENDFOREACH(_current_FILE)
ENDMACRO(SIM_QT4_AUTO_WRAP_CPP)
