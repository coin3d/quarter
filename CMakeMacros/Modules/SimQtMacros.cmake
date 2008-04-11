INCLUDE(${QT_USE_FILE})

# SIM_QT4_WRAP_CPP(outfiles infiles ... )
MACRO(SIM_QT4_AUTO_WRAP_CPP outfiles )
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


# SIM_QT4_WRAP_UI_TO(outfiles todirectory inputfiles ... )
MACRO (SIM_QT4_WRAP_UI_TO outfiles todirectory )
  FOREACH (it ${ARGN})
    GET_FILENAME_COMPONENT(outfile ${it} NAME_WE)
    GET_FILENAME_COMPONENT(infile ${it} ABSOLUTE)
    SET(outfile ${CMAKE_CURRENT_BINARY_DIR}/${todirectory}/ui_${outfile}.h)
    ADD_CUSTOM_COMMAND(OUTPUT ${outfile}
      COMMAND ${QT_UIC_EXECUTABLE}
      ARGS -o ${outfile} ${infile}
      MAIN_DEPENDENCY ${infile})
    SET(${outfiles} ${${outfiles}} ${outfile})
  ENDFOREACH (it)
ENDMACRO (SIM_QT4_WRAP_UI_TO)

# SIM_QT4_ADD_RESOURCES_TO(outfiles todirectory inputfiles ... )
MACRO (SIM_QT4_ADD_RESOURCES_TO outfiles todirectory )
  SET(rcc_files ${ARGN})

  FOREACH (it ${rcc_files})
    GET_FILENAME_COMPONENT(outfilename ${it} NAME_WE)
    GET_FILENAME_COMPONENT(infile ${it} ABSOLUTE)
    GET_FILENAME_COMPONENT(rc_path ${infile} PATH)
    SET(outfile ${CMAKE_CURRENT_BINARY_DIR}/${todirectory}/qrc_${outfilename}.cxx)
    #  parse file for dependencies 
    #  all files are absolute paths or relative to the location of the qrc file
    FILE(READ "${infile}" _RC_FILE_CONTENTS)
    STRING(REGEX MATCHALL "<file[^<]+" _RC_FILES "${_RC_FILE_CONTENTS}")
    SET(_RC_DEPENDS)
    FOREACH(_RC_FILE ${_RC_FILES})
      STRING(REGEX REPLACE "^<file[^>]*>" "" _RC_FILE "${_RC_FILE}")
      STRING(REGEX MATCH "^/|([A-Za-z]:/)" _ABS_PATH_INDICATOR "${_RC_FILE}")
      IF(NOT _ABS_PATH_INDICATOR)
        SET(_RC_FILE "${rc_path}/${_RC_FILE}")
      ENDIF(NOT _ABS_PATH_INDICATOR)
      SET(_RC_DEPENDS ${_RC_DEPENDS} "${_RC_FILE}")
    ENDFOREACH(_RC_FILE)
    ADD_CUSTOM_COMMAND(OUTPUT ${outfile}
      COMMAND ${QT_RCC_EXECUTABLE}
      ARGS -name ${outfilename} -o ${outfile} ${infile}
      MAIN_DEPENDENCY ${infile}
      DEPENDS ${_RC_DEPENDS})
    SET(${outfiles} ${${outfiles}} ${outfile})
  ENDFOREACH (it)
ENDMACRO(SIM_QT4_ADD_RESOURCES_TO)

# SIM_GENERATE_QT_UNITTESTS(TestFiles ExternalSources ExternalLibs)
MACRO(SIM_GENERATE_QT_UNITTESTS TestFiles ExternalSources ExternalLibs)
  FOREACH(UnitTest ${TestFiles})
    GET_FILENAME_COMPONENT(TestName ${UnitTest} NAME_WE)

    MESSAGE(STATUS "Generating runner for unit test ${TestName}")
    SIM_QT4_AUTO_WRAP_CPP(Moc ${UnitTest})
    SET(TestRunner "${CMAKE_CURRENT_BINARY_DIR}/runner_${TestName}.cpp")

    # Generate test runner source code
    WRITE_FILE(${TestRunner} "#include \"${UnitTest}\"")
    WRITE_FILE(${TestRunner} "QTEST_MAIN(${TestName})" APPEND)

    # Build!
   ADD_EXECUTABLE(${TestName} ${TestRunner} ${Moc} ${ExternalSources})
   TARGET_LINK_LIBRARIES(${TestName} ${ExternalLibs})
   ADD_TEST(${TestName} ${EXECUTABLE_OUTPUT_PATH}/${TestName})
  ENDFOREACH(UnitTest)
ENDMACRO(SIM_GENERATE_QT_UNITTESTS)

