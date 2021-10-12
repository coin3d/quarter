set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

# Minimal example
add_executable(Example minimal.cpp)
target_link_libraries(Example PUBLIC Quarter)

# Dynamic UI Loader example
add_executable(DynamicUILoaderExample dynamicui.cpp quarterviewer.qrc)
target_link_libraries(DynamicUILoaderExample PUBLIC Quarter)

# Direct UI loader example
add_executable(DirectUILoaderExample directui.cpp QuarterViewer.ui)
target_link_libraries(DirectUILoaderExample PUBLIC Quarter)

# Examiner example
add_executable(ExaminerExample examiner.cpp quarterviewer.qrc)
target_link_libraries(ExaminerExample PUBLIC Quarter)

# Inherit UI example
add_executable(InheritUIExample inheritui.cpp
  QuarterViewer.cpp
  QuarterViewer.h
  QuarterViewer.ui
)
target_link_libraries(InheritUIExample PUBLIC Quarter)

# Multiple document interface example
add_executable(MDIExample mdi.cpp
  MdiMainWindow.cpp
  MdiMainWindow.h
  MdiQuarterWidget.cpp
  MdiQuarterWidget.h
)
target_link_libraries(MDIExample PUBLIC Quarter)

# Superimposition example
add_executable(SuperImpositionExample superimposition.cpp)
target_link_libraries(SuperImpositionExample PUBLIC Quarter)
