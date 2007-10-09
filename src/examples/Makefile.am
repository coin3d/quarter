
if BUILD_WITH_MSVC
includes = \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(QTDIR)/include/QtUiTools \
        -I$(top_builddir)/include \
        -I$(top_srcdir)/include \
        -I$(top_builddir)/src/examples \
        -I$(top_srcdir)/src/examples
else
includes = \
        -I$(top_builddir)/include \
        -I$(top_srcdir)/include \
        -I$(top_builddir)/src/examples \
        -I$(top_srcdir)/src/examples
endif

DEFAULT_INCLUDES = $(includes)

QT_UITOOLS_INCLUDE = -I$(QT_USE_INCDIR)/QtUiTools

noinst_PROGRAMS = minimal dynamicui directui inheritui superimposition examiner

minimal_SOURCES = minimal.cpp
dynamicui_SOURCES = dynamicui.cpp qrc_dynamicui.cpp
directui_SOURCES = directui.cpp
inheritui_SOURCES = inheritui.cpp QuarterViewer.h QuarterViewer.cpp
superimposition_SOURCES = superimposition.cpp
examiner_SOURCES = examiner.cpp qrc_examiner.cpp

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
        superimposition.exe \
        superimposition.pdb \
        superimposition.exe.manifest \
        examiner.exe \
        examiner.pdb \
        examiner.exe.manifest \
        qrc_dynamicui.cpp \
        qrc_examiner.cpp \
        ui_QuarterViewer.h

EXTRA_DIST = \
        quarterviewer.qrc \
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
        $(QT_USE_LIBS) \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) 
else
EXAMPLES_LIBS = \
        -lQtUiTools \
        -lQtDesigner \
        -lQtXml \
        -lQtOpenGL \
        $(QT_USE_LIBS) \
        $(QUARTER_USE_LIBS) \
        $(COIN_USE_LIBS) 
endif

minimal_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
dynamicui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
directui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
inheritui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
superimposition_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
examiner_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)

minimal_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
minimal_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
minimal_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
minimal_LDFLAGS = $(EXAMPLES_LDFLAGS)

directui_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
directui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
directui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
directui_LDFLAGS = $(EXAMPLES_LDFLAGS)

dynamicui_CPPFLAGS = $(EXAMPLES_CPPFLAGS) $(QT_UITOOLS_INCLUDE)
dynamicui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
dynamicui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
dynamicui_LDFLAGS = $(EXAMPLES_LDFLAGS)

inheritui_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
inheritui_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
inheritui_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
inheritui_LDFLAGS = $(EXAMPLES_LDFLAGS)

superimposition_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
superimposition_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
superimposition_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
superimposition_LDFLAGS = $(EXAMPLES_LDFLAGS)

examiner_CPPFLAGS = $(EXAMPLES_CPPFLAGS) $(QT_UITOOLS_INCLUDE)
examiner_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
examiner_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
examiner_LDFLAGS = $(EXAMPLES_LDFLAGS)

qrc_dynamicui.cpp: $(srcdir)/quarterviewer.qrc $(srcdir)/QuarterViewer.ui
	$(RCC) -name dynamicui $< -o $@

qrc_examiner.cpp: $(srcdir)/quarterviewer.qrc $(srcdir)/QuarterViewer.ui
	$(RCC) -name examiner $< -o $@

directui.cpp: ui_QuarterViewer.h

ui_QuarterViewer.h: $(srcdir)/QuarterViewer.ui
	$(UIC) $< -o $@