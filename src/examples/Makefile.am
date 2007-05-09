
DEFAULT_INCLUDES = \
        -I$(top_builddir)/include \
        -I$(top_srcdir)/include \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtXml \
        -I$(QTDIR)/include/QtCore \
        -I$(QTDIR)/include/QtUiTools \
        -I$(QTDIR)/include/QtDesigner

bin_PROGRAMS = viewer minimal

BuiltSources = qrc_viewer.cpp
viewer_SOURCES = viewer.cpp $(BuiltSources)
minimal_SOURCES = minimal.cpp

CLEANFILES = \
        viewer.exe \
        viewer.pdb \
        viewer.exe.manifest \
        minimal.exe \
        minimal.pdb \
        minimal.exe.manifest \
        $(BuiltSources)


if BUILD_WITH_MSVC
viewer_LDADD = \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) \
        $(QT_USE_LIBS) \
        -lQtUiTools \
        -lQtDesigner4 \
        -lQtXml4 \
        -lQtOpenGL4 \
        -lNutsnBolts0

minimal_LDADD = \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) \
        $(QT_USE_LIBS) \
        -lQtUiTools \
        -lQtDesigner4 \
        -lQtXml4 \
        -lQtOpenGL4 \
        -lNutsnBolts0

else
viewer_LDADD = \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) \
        $(QT_USE_LIBS) \
        -lQtUiTools \
        -lQtDesigner\
        -lQtXml \
        -lNutsnBolts

minimal_LDADD = \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) \
        $(QT_USE_LIBS) \
        -lQtUiTools \
        -lQtDesigner\
        -lQtXml \
        -lNutsnBolts
endif

viewer_CPPFLAGS = $(VIEWER_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS)
viewer_CXXFLAGS = $(VIEWER_BUILD_CXXFLAGS)
viewer_CFLAGS = $(VIEWER_BUILD_CFLAGS)
viewer_LDFLAGS = $(VIEWER_BUILD_LIBFLAGS) $(QUARTER_USE_LDFLAGS) $(COIN_USE_LDFLAGS) $(QT_USE_LDFLAGS)

minimal_CPPFLAGS = $(VIEWER_BUILD_CPPFLAGS) $(QUARTER_USE_CPPFLAGS) $(COIN_USE_CPPFLAGS)
minimal_CXXFLAGS = $(VIEWER_BUILD_CXXFLAGS)
minimal_CFLAGS = $(VIEWER_BUILD_CFLAGS)
minimal_LDFLAGS = $(VIEWER_BUILD_LIBFLAGS) $(QUARTER_USE_LDFLAGS) $(COIN_USE_LDFLAGS) $(QT_USE_LDFLAGS)

qrc_viewer.cpp: $(srcdir)/viewer.qrc $(srcdir)/viewer.ui
	$(RCC) -name viewer $(srcdir)/viewer.qrc -o $@
