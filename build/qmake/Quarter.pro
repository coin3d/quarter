TARGET = Quarter
TEMPLATE = lib

CONFIG += dll
VERSION = 0.1.0
QT += opengl

include(coin.pro)

INCLUDEPATH += ../../include;

SOURCES = \
          ../../src/Quarter/devices/DeviceHandler.cpp \
          ../../src/Quarter/devices/DeviceManager.cpp \
          ../../src/Quarter/devices/KeyboardHandler.cpp \
          ../../src/Quarter/devices/KeyboardHandlerP.cpp \
          ../../src/Quarter/devices/MouseHandler.cpp \
          ../../src/Quarter/eventhandlers/DragDropHandler.cpp \
          ../../src/Quarter/eventhandlers/EventHandler.cpp \
          ../../src/Quarter/eventhandlers/EventManager.cpp \
          ../../src/Quarter/ContextMenu.cpp \
          ../../src/Quarter/ImageReader.cpp \
          ../../src/Quarter/Quarter.cpp \
          ../../src/Quarter/QuarterP.cpp \
          ../../src/Quarter/QuarterApplication.cpp \
          ../../src/Quarter/QuarterWidget.cpp \
          ../../src/Quarter/QuarterWidgetP.cpp \
          ../../src/Quarter/SensorManager.cpp \
          ../../src/Quarter/SignalThread.cpp

HEADERS = \
          ../../src/Quarter/ContextMenu.h \
          ../../src/Quarter/ImageReader.h \
          ../../src/Quarter/QuarterWidgetP.h \
          ../../src/Quarter/SensorManager.h \
          ../../src/Quarter/SignalThread.h \
          ../../src/Quarter/devices/KeyboardHandlerP.h \
          ../../include/Quarter/Basic.h \
          ../../include/Quarter/devices/DeviceHandler.h \
          ../../include/Quarter/devices/DeviceManager.h \
          ../../include/Quarter/devices/KeyboardHandler.h \
          ../../include/Quarter/devices/MouseHandler.h \
          ../../include/Quarter/eventhandlers/DragDropHandler.h \
          ../../include/Quarter/eventhandlers/EventHandler.h \
          ../../include/Quarter/eventhandlers/EventManager.h \
          ../../include/Quarter/Quarter.h \
          ../../src/Quarter/QuarterP.h \
          ../../include/Quarter/QuarterApplication.h \
          ../../include/Quarter/QuarterWidget.h
