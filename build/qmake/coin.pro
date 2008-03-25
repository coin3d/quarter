win32 {
  DEFINES += COIN_DLL
  INCLUDEPATH += $(COINDIR)/include;
  debug {
    LIBS += $(COINDIR)/lib/coin3d.lib
  }
  else {
    LIBS += $(COINDIR)/lib/coin3.lib
  }
}
macx {
  LIBS += -framework Inventor
  CONFIG += opengl
}
else {
  unix {
    CONFIG += opengl
    INCLUDEPATH += $(COINDIR)/include
    LIBS += $$system(coin-config --ldflags --libs)
  }
}
