
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

if MAC_QT_FRAMEWORK
QT_UITOOLS_INCLUDE = -I$(QT_USE_INCDIR)/../include -I$(QT_USE_INCDIR)/../include/QtUiTools
else
QT_UITOOLS_INCLUDE = -I$(QT_USE_INCDIR)/QtUiTools
endif

noinst_PROGRAMS = minimal dynamicui directui inheritui superimposition examiner mdi

minimal_SOURCES = minimal.cpp
dynamicui_SOURCES = dynamicui.cpp 
nodist_dynamicui_SOURCES = qrc_dynamicui.cpp
directui_SOURCES = directui.cpp
inheritui_SOURCES = inheritui.cpp QuarterViewer.h QuarterViewer.cpp
superimposition_SOURCES = superimposition.cpp
examiner_SOURCES = examiner.cpp 
nodist_examiner_SOURCES = qrc_examiner.cpp
mdi_SOURCES = mdi.cpp MdiMainWindow.cpp MdiMainWindow.h MdiQuarterWidget.cpp MdiQuarterWidget.h
nodist_mdi_SOURCES = moc_MdiMainWindow.cpp

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
        mdi.exe \
        mdi.pdb \
        mdi.exe.manifest \
        qrc_dynamicui.cpp \
        qrc_examiner.cpp \
        ui_QuarterViewer.h \
        moc_MdiMainWindow.cpp

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

EXAMPLES_LIBS = \
        $(QUARTER_USE_LIBS) \
        $(EXAMPLES_EXTRA_LIBS) 

minimal_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
dynamicui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
directui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
inheritui_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
superimposition_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
examiner_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)
mdi_LDADD = $(EXAMPLES_LDFLAGS) $(EXAMPLES_LIBS)

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

mdi_CPPFLAGS = $(EXAMPLES_CPPFLAGS)
mdi_CXXFLAGS = $(EXAMPLES_BUILD_CXXFLAGS)
mdi_CFLAGS = $(EXAMPLES_BUILD_CFLAGS)
mdi_LDFLAGS = $(EXAMPLES_LDFLAGS)

qrc_dynamicui.cpp: $(srcdir)/quarterviewer.qrc $(srcdir)/QuarterViewer.ui
	$(RCC) -name dynamicui -o $@ `$(UNIX2WINPATH) $(srcdir)/quarterviewer.qrc`

qrc_examiner.cpp: $(srcdir)/quarterviewer.qrc $(srcdir)/QuarterViewer.ui
	$(RCC) -name examiner -o $@ `$(UNIX2WINPATH) $(srcdir)/quarterviewer.qrc`

directui.cpp: ui_QuarterViewer.h

ui_QuarterViewer.h: $(srcdir)/QuarterViewer.ui
	$(UIC) -o $@ `$(UNIX2WINPATH) $(srcdir)/QuarterViewer.ui`

moc_MdiMainWindow.cpp: $(srcdir)/MdiMainWindow.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/MdiMainWindow.h`
