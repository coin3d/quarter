TARGET = Quarter
TEMPLATE = lib

CONFIG += dll
VERSION = 1.0.0
QT += opengl

include(coin.pro)

INCLUDEPATH += ../../include;

SOURCES = \
          ../../src/Quarter/ContextMenu.cpp \
          ../../src/Quarter/DragDropHandler.cpp \
          ../../src/Quarter/EventFilter.cpp \
          ../../src/Quarter/FocusHandler.cpp \
          ../../src/Quarter/ImageReader.cpp \
          ../../src/Quarter/InputDevice.cpp \
          ../../src/Quarter/InteractionMode.cpp \
          ../../src/Quarter/Keyboard.cpp \
          ../../src/Quarter/KeyboardP.cpp \
          ../../src/Quarter/Mouse.cpp \
          ../../src/Quarter/Quarter.cpp \
          ../../src/Quarter/QuarterP.cpp \
          ../../src/Quarter/QuarterWidget.cpp \
          ../../src/Quarter/QuarterWidgetP.cpp \
          ../../src/Quarter/SensorManager.cpp \
          ../../src/Quarter/SignalThread.cpp \
          ../../src/Quarter/SpaceNavigatorDevice.cpp 

HEADERS = \
          ../../src/Quarter/ContextMenu.h \
          ../../src/Quarter/ImageReader.h \
          ../../src/Quarter/InteractionMode.h \
          ../../src/Quarter/KeyboardP.h \
          ../../src/Quarter/QuarterP.h \
          ../../src/Quarter/QuarterWidgetP.h \
          ../../src/Quarter/SensorManager.h \
          ../../src/Quarter/SignalThread.h \
          ../../include/Quarter/Basic.h \
          ../../include/Quarter/Quarter.h \
          ../../include/Quarter/QuarterWidget.h \
          ../../include/Quarter/devices/InputDevice.h \
          ../../include/Quarter/devices/Keyboard.h \
          ../../include/Quarter/devices/Mouse.h \
          ../../include/Quarter/devices/SpaceNavigatorDevice.h \
          ../../include/Quarter/eventhandlers/DragDropHandler.h \
          ../../include/Quarter/eventhandlers/EventFilter.h \
          ../../include/Quarter/eventhandlers/FocusHandler.h 

