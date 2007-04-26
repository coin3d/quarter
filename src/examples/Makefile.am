DEFAULT_INCLUDES = \
        -I$(top_builddir)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(QTDIR)/include/QtUiTools \
        -I$(top_srcdir)/include

bin_PROGRAMS = viewer

viewer_SOURCES = viewer.cpp
viewer_LDADD = -L../Quarter -lQuarter -lQtUiTools -lQtDesigner