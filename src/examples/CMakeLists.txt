if(Qt5_FOUND)
  QT5_ADD_RESOURCES(QuarterViewerResources quarterviewer.qrc)
  QT5_WRAP_UI(QuarterViewerUi QuarterViewer.ui)
  QT5_WRAP_CPP(MocHeaders MdiMainWindow.h)
else()
  QT4_ADD_RESOURCES(QuarterViewerResources quarterviewer.qrc)
  QT4_WRAP_UI(QuarterViewerUi QuarterViewer.ui)
  QT4_WRAP_CPP(MocHeaders MdiMainWindow.h)
endif()

# Minimal example
add_executable(Example minimal.cpp)
target_link_libraries(Example Quarter)

# Dynamic UI Loader example
add_executable(DynamicUILoaderExample dynamicui.cpp ${QuarterViewerResources})
target_link_libraries(DynamicUILoaderExample Quarter ${QUARTER_PLUGIN_QT_TARGETS})

# Direct UI loader example
add_executable(DirectUILoaderExample directui.cpp ${QuarterViewerUi})
target_link_libraries(DirectUILoaderExample Quarter)

# Examiner example
add_executable(ExaminerExample examiner.cpp ${QuarterViewerResources})
target_link_libraries(ExaminerExample Quarter ${QUARTER_PLUGIN_QT_TARGETS})

# Inherit UI example
add_executable(InheritUIExample inheritui.cpp
  QuarterViewer.cpp
  QuarterViewer.h
  ${QuarterViewerUi}
)
target_link_libraries(InheritUIExample Quarter)

# Multiple document interface example
add_executable(MDIExample mdi.cpp
  MdiMainWindow.cpp
  MdiMainWindow.h
  MdiQuarterWidget.cpp
  MdiQuarterWidget.h
  ${MocHeaders}
)
target_link_libraries(MDIExample Quarter)

# Superimposition example
add_executable(SuperImpositionExample superimposition.cpp)
target_link_libraries(SuperImpositionExample Quarter)
