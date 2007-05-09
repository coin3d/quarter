
DEFAULT_INCLUDES = \
        -I$(top_builddir)/include \
        -I$(top_srcdir)/include \
        -I$(top_builddir)/src/examples \
        -I$(top_srcdir)/src/examples \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtXml \
        -I$(QTDIR)/include/QtCore \
        -I$(QTDIR)/include/QtUiTools \
        -I$(QTDIR)/include/QtDesigner

noinst_PROGRAMS = minimal dynamicui directui inheritui

minimal_SOURCES = minimal.cpp
dynamicui_SOURCES = dynamicui.cpp qrc_dynamicui.cpp
directui_SOURCES = directui.cpp
inheritui_SOURCES = inheritui.cpp QuarterViewer.h QuarterViewer.cpp

CLEANFILES = \
        minimal.exe \
        minimal.pdb \
        minimal.exe.manifest \
        dynamicui.exe \
        dynamicui.pdb \
        dynamicui.exe.manifest \
        directui.exe \
        directui.pdb \
        directui.exe.manifest \
        inheritui.exe \
        inheritui.pdb \
        inheritui.exe.manifest \
        qrc_dynamicui.cpp \
        ui_QuarterViewer.h

EXTRA_DIST = \
        dynamicui.qrc \
        QuarterViewer.ui

EXAMPLES_LDFLAGS = \
        $(QUARTER_USE_LDFLAGS) \
        $(COIN_USE_LDFLAGS) \
        $(QT_USE_LDFLAGS) \
        $(EXAMPLES_BUILD_LIBFLAGS)

EXAMPLES_CPPFLAGS = \
        $(EXAMPLES_BUILD_CPPFLAGS) \
        $(QUARTER_USE_CPPFLAGS) \
        $(COIN_USE_CPPFLAGS) \
        $(QT_USE_CPPFLAGS)

if BUILD_WITH_MSVC
EXAMPLES_LIBS = \
        -lQtUiTools \
        -lQtDesigner4 \
        -lQtXml4 \
        -lQtOpenGL4 \
        -lNutsnBolts0 \
        $(QT_USE_LIBS) \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) 

minimal_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
dynamicui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
directui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
inheritui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
else
EXAMPLES_LIBS = \
        -lQtUiTools \
        -lQtDesigner \
        -lQtXml \
        -lQtOpenGL \
        -lNutsnBolts \
        $(QT_USE_LIBS) \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) 

minimal_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
dynamicui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
directui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
inheritui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
endif

minimal_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
minimal_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
minimal_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
minimal_LDFLAGS = $(EXAMPLES_LDFLAGS)

directui_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
directui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
directui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
directui_LDFLAGS = $(EXAMPLES_LDFLAGS)

dynamicui_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
dynamicui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
dynamicui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
dynamicui_LDFLAGS = $(EXAMPLES_LDFLAGS)

inheritui_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
inheritui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
inheritui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
inheritui_LDFLAGS = $(EXAMPLES_LDFLAGS)

qrc_dynamicui.cpp: $(srcdir)/dynamicui.qrc $(srcdir)/QuarterViewer.ui
	$(RCC) -name dynamicui $< -o $@

directui.cpp: ui_QuarterViewer.h

ui_QuarterViewer.h: $(srcdir)/QuarterViewer.ui
	$(UIC) $< -o $@