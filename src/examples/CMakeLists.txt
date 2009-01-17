ADD_DEFINITIONS(-DQUARTER_DLL)

#QT4_WRAP_UI(QuarterViewerUi "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui")
QT4_ADD_RESOURCES(QuarterViewerResources "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.qrc")
ADD_CUSTOM_COMMAND(OUTPUT ui_QuarterViewer.h COMMAND uic       ARGS ${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui -o ${CMAKE_CURRENT_SOURCE_DIR}/ui_QuarterViewer.h DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui)

#Minimal example
ADD_EXECUTABLE(Example "${CMAKE_CURRENT_SOURCE_DIR}/minimal.cpp")
TARGET_LINK_LIBRARIES(Example Quarter)

#Dynamic UI Loader example
ADD_EXECUTABLE(DynamicUILoaderExample "${CMAKE_CURRENT_SOURCE_DIR}/dynamicui.cpp" ${QuarterViewerResources})
TARGET_LINK_LIBRARIES(DynamicUILoaderExample Quarter)

#Direct UI loader example
ADD_EXECUTABLE(DirectUILoaderExample "${CMAKE_CURRENT_SOURCE_DIR}/directui.cpp" ui_QuarterViewer.h)
TARGET_LINK_LIBRARIES(DirectUILoaderExample Quarter)

#Examiner example
ADD_EXECUTABLE(ExaminerExample "${CMAKE_CURRENT_SOURCE_DIR}/examiner.cpp" ${QuarterViewerResources})
TARGET_LINK_LIBRARIES(ExaminerExample Quarter)

#Inherit UI example
ADD_EXECUTABLE(InheritUIExample "${CMAKE_CURRENT_SOURCE_DIR}/inheritui.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.h"
  ui_QuarterViewer.h)
TARGET_LINK_LIBRARIES(InheritUIExample Quarter)

#Multiple document interface example
SIM_QT4_AUTO_WRAP_CPP(MocSources "${CMAKE_CURRENT_SOURCE_DIR}/MdiMainWindow.h")
ADD_EXECUTABLE(MDIExample "${CMAKE_CURRENT_SOURCE_DIR}/mdi.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiMainWindow.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiMainWindow.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiQuarterWidget.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiQuarterWidget.h"
  ${MocSources}
)
TARGET_LINK_LIBRARIES(MDIExample Quarter)

#Superimposition example
#Examiner example
ADD_EXECUTABLE(SuperImpositionExample "${CMAKE_CURRENT_SOURCE_DIR}/superimposition.cpp")
TARGET_LINK_LIBRARIES(SuperImpositionExample Quarter)

#Generate the tree structure in the VS Projects.
SIM_VS_GENERATE_BASIC_TREE()

INSTALL(TARGETS Example
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS DynamicUILoaderExample
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS DirectUILoaderExample
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS ExaminerExample
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS InheritUIExample
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS MDIExample
  RUNTIME DESTINATION examples
)
INSTALL(TARGETS SuperImpositionExample
  RUNTIME DESTINATION examples
)
