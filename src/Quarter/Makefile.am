
SUBDIRS = devices

DEFAULT_INCLUDES = \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter

BuiltSources = \
        moc_QuarterWidget.cpp \
        moc_SensorManager.cpp

PrivateHeaders = \
        SensorManager.h \
        QuarterWidgetP.h

RegularSources = \
        Quarter.cpp \
        QuarterWidget.cpp \
        SensorManager.cpp \
        QuarterWidgetP.cpp \
        QuarterApplication.cpp

libQuarter_la_SOURCES = \
        $(RegularSources) \
        $(BuiltSources) \
        $(PrivateHeaders)

Quarter@QUARTER_MAJOR_VERSION@_lib_SOURCES = \
        $(RegularSources) \
        $(BuiltSources) \
        $(PrivateHeaders)

Quarter@QUARTER_MAJOR_VERSION@_lib_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

Quarter@QUARTER_MAJOR_VERSION@_lib_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

Quarter@QUARTER_MAJOR_VERSION@_lib_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libQuarter_la_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libQuarter_la_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libQuarter_la_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)


if BUILD_WITH_MSVC
lib_LIBRARIES = Quarter@QUARTER_MAJOR_VERSION@.lib
else
lib_LTLIBRARIES = libQuarter.la
endif 

libQuarter_la_LIBADD = \
        devices/libdevices.la -lNutsnBolts $(COIN_USE_LIBS) $(QT_USE_LIBS) -lQtOpenGL

Quarter@QUARTER_MAJOR_VERSION@_lib_LIBADD = \
        devices/devices.lst -lNutsnBolts0 $(COIN_USE_LIBS) $(QT_USE_LIBS) -lQtOpenGL4


CLEANFILES = \
        $(BuiltSources) \
        Quarter@QUARTER_MAJOR_VERSION@.lib \
        Quarter@QUARTER_MAJOR_VERSION@.exp \
        Quarter@QUARTER_MAJOR_VERSION@.dll \
        Quarter@QUARTER_MAJOR_VERSION@.pdb \
        Quarter@QUARTER_MAJOR_VERSION@.dll.manifest


Quarter@QUARTER_MAJOR_VERSION@.lib: Makefile \
	$(Quarter@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
	$(Quarter@QUARTER_MAJOR_VERSION@_lib_DEPENDENCIES)
	@basename="Quarter@QUARTER_MAJOR_VERSION@"; \
	rm -f "$$basename.dll" "$$basename.lib"; \
	echo "Linking $$basename.lib..."; \
	echo $(CC) $(LDFLAGS) \
          $(QUARTER_LIBFLAGS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
          $(Quarter@QUARTER_MAJOR_VERSION@_lib_LIBADD) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS); \
	$(CC) $(LDFLAGS) \
        $(QUARTER_LIBFLAGS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@_lib_OBJECTS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@_lib_LIBADD) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS);


moc_QuarterWidget.cpp: $(top_srcdir)/include/Quarter/QuarterWidget.h
	$(MOC) -o $@ $(top_srcdir)/include/Quarter/QuarterWidget.h

moc_SensorManager.cpp: $(srcdir)/SensorManager.h
	$(MOC) -o $@ $(srcdir)/SensorManager.h

if BUILD_WITH_MSVC
all-local: Quarter@QUARTER_MAJOR_VERSION@.lib

install-exec-local: Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.lib
	@basename="Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for ext in dll pdb; do \
	  file="$$basename.$$ext"; \
	  if test -s "$$file"; then \
	    $(mkinstalldirs) "$(DESTDIR)$(bindir)"; \
	    echo $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(bindir)/$$file"; \
	    $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(bindir)/$$file" || exit 1; \
	  fi \
	done
else
install-exec-local:
endif

install-data-local:
	@basename="Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for ext in lib; do \
	  file="$$basename.$$ext"; \
	  if test -s "$$file"; then \
	    $(mkinstalldirs) "$(DESTDIR)$(libdir)"; \
	    echo $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(libdir)/$$file"; \
	    $(INSTALL_PROGRAM) "$$file" "$(DESTDIR)$(libdir)/$$file" || exit 1; \
	  fi \
	done

uninstall-local:
	@basename="Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	for file in \
	  "$(DESTDIR)$(bindir)/$$basename.dll" \
	  "$(DESTDIR)$(bindir)/$$basename.pdb" \
	  "$(DESTDIR)$(libdir)/$$basename.lib"; do \
	  if test -f "$$file"; then \
	    echo " rm -f" "$$file"; \
	    rm -f "$$file"; \
	  fi \
	done
