TARGET = quarterwidget
TEMPLATE = lib

QT += opengl
CONFIG += designer plugin release

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

DEFINES += COIN_DLL QUARTER_DLL NB_DLL

HEADERS = QuarterWidgetPlugin.h
SOURCES = QuarterWidgetPlugin.cpp

LIBS += -L../Quarter -L$(COINDIR)/lib -lCoin3 -lQuarter0

target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS += target

MOC_DIR = .moc
OBJECTS_DIR = .obj
