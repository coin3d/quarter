TARGET = viewer
TEMPLATE = app

QT += opengl
CONFIG += debug designer uitools

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

SOURCES = viewer.cpp

LIBS += -L../Quarter -L$(COINDIR)/lib -lCoin -lQuarter

target.path = $$(COINDIR)/bin
INSTALLS += target 

MOC_DIR = .moc
OBJECTS_DIR = .obj

