TARGET = QuarterWidgetPlugin
TEMPLATE = lib

CONFIG += designer plugin debug_and_release
VERSION = 0.1.0
QT += opengl

include(coin.pro)

INCLUDEPATH += ../../include;
LIBS += -L. -lQuarter

RESOURCES = ../../src/plugins/QuarterWidgetPlugin.qrc

SOURCES = \
          ../../src/plugins/QuarterWidgetPlugin.cpp

HEADERS = \
          ../../src/plugins/QuarterWidgetPlugin.h
