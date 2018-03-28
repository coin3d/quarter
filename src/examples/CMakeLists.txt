ADD_DEFINITIONS(-DQUARTER_DLL)

#QT4_WRAP_UI(QuarterViewerUi "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui")
IF(Qt5_FOUND)
QT5_ADD_RESOURCES(QuarterViewerResources "${CMAKE_CURRENT_SOURCE_DIR}/quarterviewer.qrc")
QT5_WRAP_UI(QuarterViewerUi "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui")
ELSE(Qt5_FOUND)
QT4_ADD_RESOURCES(QuarterViewerResources "${CMAKE_CURRENT_SOURCE_DIR}/quarterviewer.qrc")
QT4_WRAP_UI(QuarterViewerUi "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.ui")
ENDIF(Qt5_FOUND)

#Minimal example
ADD_EXECUTABLE(Example "${CMAKE_CURRENT_SOURCE_DIR}/minimal.cpp")
TARGET_LINK_LIBRARIES(Example Quarter)

#Dynamic UI Loader example
ADD_EXECUTABLE(DynamicUILoaderExample "${CMAKE_CURRENT_SOURCE_DIR}/dynamicui.cpp" ${QuarterViewerResources})
TARGET_LINK_LIBRARIES(DynamicUILoaderExample Quarter)

#Direct UI loader example
ADD_EXECUTABLE(DirectUILoaderExample "${CMAKE_CURRENT_SOURCE_DIR}/directui.cpp" ${QuarterViewerUi})
TARGET_LINK_LIBRARIES(DirectUILoaderExample Quarter)

#Examiner example
ADD_EXECUTABLE(ExaminerExample "${CMAKE_CURRENT_SOURCE_DIR}/examiner.cpp" ${QuarterViewerResources})
TARGET_LINK_LIBRARIES(ExaminerExample Quarter)

#Inherit UI example
ADD_EXECUTABLE(InheritUIExample "${CMAKE_CURRENT_SOURCE_DIR}/inheritui.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/QuarterViewer.h"
  ${QuarterViewerUi})
TARGET_LINK_LIBRARIES(InheritUIExample Quarter)

#Multiple document interface example
ADD_EXECUTABLE(MDIExample "${CMAKE_CURRENT_SOURCE_DIR}/mdi.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiMainWindow.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiMainWindow.h"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiQuarterWidget.cpp"
  "${CMAKE_CURRENT_SOURCE_DIR}/MdiQuarterWidget.h"
)
TARGET_LINK_LIBRARIES(MDIExample Quarter)

#Superimposition example
#Examiner example
ADD_EXECUTABLE(SuperImpositionExample "${CMAKE_CURRENT_SOURCE_DIR}/superimposition.cpp")
TARGET_LINK_LIBRARIES(SuperImpositionExample Quarter)

#Generate the tree structure in the VS Projects.
SIM_VS_GENERATE_BASIC_TREE()

INSTALL(TARGETS Example
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS DynamicUILoaderExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS DirectUILoaderExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS ExaminerExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS InheritUIExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS MDIExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
INSTALL(TARGETS SuperImpositionExample
  RUNTIME DESTINATION ${QUARTER_INSTALL_EXAMPLEDIR}
  COMPONENT examples
)
