SUBDIRS = devices eventhandlers

libQuarterinc_HEADERS = \
        Basic.h \
        Quarter.h \
        QuarterWidget.h \
        QtCoinCompatibility.h

if MAC_FRAMEWORK
libQuarterincdir = $(MAC_FRAMEWORK_PREFIX)/$(MAC_FRAMEWORK_NAME).framework/Versions/$(MAC_FRAMEWORK_VERSION)/Headers
else
libQuarterincdir = $(includedir)/Quarter
endif


