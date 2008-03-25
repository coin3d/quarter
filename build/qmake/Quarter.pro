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
          ../../src/Quarter/eventhandlers/ContextMenuHandler.cpp \
          ../../src/Quarter/eventhandlers/ContextMenu.cpp \
          ../../src/Quarter/eventhandlers/DragDropHandler.cpp \
          ../../src/Quarter/eventhandlers/EventHandler.cpp \
          ../../src/Quarter/eventhandlers/EventManager.cpp \
          ../../src/Quarter/Quarter.cpp \
          ../../src/Quarter/QuarterApplication.cpp \
          ../../src/Quarter/QuarterWidget.cpp \
          ../../src/Quarter/QuarterWidgetP.cpp \
          ../../src/Quarter/SensorManager.cpp

HEADERS = \
          ../../src/Quarter/devices/KeyboardHandlerP.h \
          ../../src/Quarter/QuarterWidgetP.h \
          ../../src/Quarter/SensorManager.h \
          ../../src/Quarter/eventhandlers/ContextMenu.h \
          ../../include/Quarter/Basic.h \
          ../../include/Quarter/devices/DeviceHandler.h \
          ../../include/Quarter/devices/DeviceManager.h \
          ../../include/Quarter/devices/KeyboardHandler.h \
          ../../include/Quarter/devices/MouseHandler.h \
          ../../include/Quarter/eventhandlers/ContextMenuHandler.h \
          ../../include/Quarter/eventhandlers/DragDropHandler.h \
          ../../include/Quarter/eventhandlers/EventHandler.h \
          ../../include/Quarter/eventhandlers/EventManager.h \
          ../../include/Quarter/Quarter.h \
          ../../include/Quarter/QuarterApplication.h \
          ../../include/Quarter/QuarterWidget.h
