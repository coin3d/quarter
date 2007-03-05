TARGET = coinwidget
TEMPLATE = lib

QT += opengl
CONFIG += designer plugin debug

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

HEADERS = CoinWidgetPlugin.h
SOURCES = CoinWidgetPlugin.cpp

LIBS += -L$(COINDIR)/lib -lCoin -lQuarter

target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS += target

MOC_DIR = .moc
OBJECTS_DIR = .obj
