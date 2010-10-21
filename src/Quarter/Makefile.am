
# Add this to libQuarter_la_LDFLAGS (see below) to force twolevel
# namespace libraries on Mac OS X. (This has been the way to do it
# since Mac OS 10.2, but unfortunately the version of libtool we are
# using defaults to flat_namespace.)
if MACOSX_10_2FF
LibtoolLinkArgs = -Wl,-twolevel_namespace -Wl,-undefined,error
else
LibtoolLinkArgs = 
endif

if BUILD_WITH_MSVC
includes = \
        -I$(QTDIR)/include \
        -I$(QTDIR)/include/QtOpenGL \
        -I$(QTDIR)/include/QtGui \
        -I$(QTDIR)/include/QtCore
endif

DEFAULT_INCLUDES = $(includes) \
        -I$(top_srcdir)/include \
        -I$(top_srcdir)/src/Quarter \
        -I$(top_builddir)

BuiltSources = \
        moc_ContextMenu.cpp \
        moc_DragDropHandler.cpp \
        moc_EventFilter.cpp \
        moc_FocusHandler.cpp \
        moc_InteractionMode.cpp \
        moc_QuarterWidget.cpp \
        moc_SensorManager.cpp \
        moc_SignalThread.cpp

PrivateHeaders = \
        ContextMenu.h \
        ImageReader.h \
        InteractionMode.h \
        KeyboardP.h \
        QuarterP.h \
        QuarterWidgetP.h \
        SensorManager.h \
        SignalThread.h \
        NativeEvent.h \
        SpaceNavigatorDevice.h

RegularSources = \
        ContextMenu.cpp \
        DragDropHandler.cpp \
        EventFilter.cpp \
        FocusHandler.cpp \
        ImageReader.cpp \
        InputDevice.cpp \
        InteractionMode.cpp \
        Keyboard.cpp \
        KeyboardP.cpp \
        Mouse.cpp \
        QtCoinCompatibility.cpp \
        Quarter.cpp \
        QuarterP.cpp \
        QuarterWidget.cpp \
        QuarterWidgetP.cpp \
        SensorManager.cpp \
        SignalThread.cpp \
        NativeEvent.cpp \
        SpaceNavigatorDevice.cpp



BUILT_SOURCES = $(BuiltSources)

libQuarter_la_SOURCES = \
        $(RegularSources) \
        $(PrivateHeaders)

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_SOURCES = \
        $(RegularSources) \
        $(PrivateHeaders)

nodist_libQuarter_la_SOURCES = \
        $(BuiltSources)

nodist_Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_SOURCES = \
        $(BuiltSources)

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libQuarter_la_CPPFLAGS = \
        $(QUARTER_BUILD_CPPFLAGS) $(COIN_USE_CPPFLAGS) $(QT_USE_CPPFLAGS)

libQuarter_la_CXXFLAGS = \
        $(QUARTER_BUILD_CXXFLAGS) $(COIN_USE_CXXFLAGS) $(QT_USE_CXXFLAGS)

libQuarter_la_CFLAGS = \
        $(QUARTER_BUILD_CFLAGS) $(COIN_USE_CFLAGS) $(QT_USE_CFLAGS)

libQuarter_la_LDFLAGS = \
        -no-undefined \
        $(LibtoolLinkArgs) $(COIN_USE_LDFLAGS) $(QT_USE_LDFLAGS)


if BUILD_WITH_MSVC
lib_LIBRARIES = Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.lib
else
lib_LTLIBRARIES = libQuarter.la
endif 

if MAC_FRAMEWORK
# hack to change libdir value when installing Mac OS X compiler framework
lib@nop@dir = $(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Versions/$(MAC_FRAMEWORK_VERSION)/Libraries
endif

libQuarter_la_LIBADD = \
        $(COIN_USE_LIBS) $(QT_USE_LIBS)

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD = \
        $(COIN_USE_LIBS) $(QT_USE_LIBS)


CLEANFILES = \
        $(BuiltSources) \
        Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.lib \
        Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.exp \
        Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.dll \
        Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.pdb \
        Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.dll.manifest

Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.lib: Makefile \
	$(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
	$(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_DEPENDENCIES)
	@basename="Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@"; \
	rm -f "$$basename.dll" "$$basename.lib"; \
	echo "Linking $$basename.lib..."; \
	echo $(CC) $(LDFLAGS) \
          $(QUARTER_LIBFLAGS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
          $(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS); \
	$(CC) $(LDFLAGS) \
        $(QUARTER_LIBFLAGS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_OBJECTS) \
	  $(Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@_lib_LIBADD) \
          $(COIN_USE_LDFLAGS) \
          $(QT_USE_LDFLAGS);


moc_QuarterWidget.cpp: $(top_srcdir)/include/Quarter/QuarterWidget.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(top_srcdir)/include/Quarter/QuarterWidget.h`

moc_SensorManager.cpp: $(srcdir)/SensorManager.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/SensorManager.h`

moc_ContextMenu.cpp: $(srcdir)/ContextMenu.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/ContextMenu.h`

moc_SignalThread.cpp: $(srcdir)/SignalThread.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/SignalThread.h`

moc_EventFilter.cpp: $(top_srcdir)/include/Quarter/eventhandlers/EventFilter.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(top_srcdir)/include/Quarter/eventhandlers/EventFilter.h`

moc_DragDropHandler.cpp: $(top_srcdir)/include/Quarter/eventhandlers/DragDropHandler.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(top_srcdir)/include/Quarter/eventhandlers/DragDropHandler.h`

moc_InteractionMode.cpp: $(srcdir)/InteractionMode.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(srcdir)/InteractionMode.h`

moc_FocusHandler.cpp: $(top_srcdir)/include/Quarter/eventhandlers/FocusHandler.h
	$(MOC) -o $@ `$(UNIX2WINPATH) $(top_srcdir)/include/Quarter/eventhandlers/FocusHandler.h`

if BUILD_WITH_MSVC
all-local: Quarter@QUARTER_MAJOR_VERSION@@SUFFIX@.lib

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

if MAC_FRAMEWORK
install-data-local:
	@$(NORMAL_INSTALL)
	@echo "Setting up Mac OS X framework"
	@$(mkinstalldirs) $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Versions/$(MAC_FRAMEWORK_VERSION)
	@ln -sf $(MAC_FRAMEWORK_VERSION) $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Versions/Current
	@ln -sf Versions/Current/Headers $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Headers
	@ln -sf Versions/Current/Libraries $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Libraries
	@ln -sf Versions/Current/Resources $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Resources
	cd $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Versions/Current && ln -sf Libraries/libQuarter.dylib $(MAC_FRAMEWORK_NAME) && cd -; \
	cd $(DESTDIR)$(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework && ln -sf Versions/Current/$(MAC_FRAMEWORK_NAME) $(MAC_FRAMEWORK_NAME) && install_name_tool -id $(MAC_FRAMEWORK_NAME).framework/Versions/$(MAC_FRAMEWORK_VERSION)/$(MAC_FRAMEWORK_NAME) $(MAC_FRAMEWORK_NAME) && cd -;
else
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
endif

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
