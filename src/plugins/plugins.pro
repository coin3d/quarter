TARGET = quarterwidget
TEMPLATE = lib

QT += opengl
CONFIG += designer plugin debug

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

HEADERS = QuarterWidgetPlugin.h
SOURCES = QuarterWidgetPlugin.cpp

LIBS += -L$(COINDIR)/lib -lCoin -lQuarter

target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS += target

MOC_DIR = .moc
OBJECTS_DIR = .obj
