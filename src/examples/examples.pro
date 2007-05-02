TARGET = viewer
TEMPLATE = app

QT += opengl
CONFIG += debug designer uitools

INCLUDEPATH += ../../include
INCLUDEPATH += $(COINDIR)/include

SOURCES = viewer.cpp

DEFINES += COIN_DLL NB_DLL QUARTER_DLL

LIBS += -L../Quarter -L$(COINDIR)/lib -lCoin3d -lQuarter0 -lNutsnBolts0d

target.path = $$(COINDIR)/bin
INSTALLS += target 

MOC_DIR = .moc
OBJECTS_DIR = .obj

