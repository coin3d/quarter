TARGET = viewer
TEMPLATE = app

CONFIG += debug designer uitools
QT += opengl

# FIXME this is a hack
INCLUDEPATH += ../../Quarter
INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

LIBS += -L$(COINDIR)/lib -lCoin -lQuarter
SOURCES = viewer.cpp

target.path = $$(COINDIR)/bin
INSTALLS += target 

MOC_DIR = .moc
OBJECTS_DIR = .obj

