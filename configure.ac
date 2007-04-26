AC_INIT([Quarter], [1.0], 
        [frodo <frodo@sim.no>])

AC_CONFIG_SRCDIR(src/Quarter/QuarterWidget.cpp)
AC_CONFIG_AUX_DIR(cfg)
AM_CONFIG_HEADER(config.h)
AM_INIT_AUTOMAKE(Quarter, 1.0)
AM_MAINTAINER_MODE
AC_PREREQ(2.50)
AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL
#  Default to not building a static library.
#  Can be overridden by the user with --enable-static.
AM_DISABLE_STATIC
AC_PROG_LIBTOOL

AC_LANG(C++)

SIM_AC_HAVE_COIN_IFELSE([
  CPPFLAGS="$CPPFLAGS $sim_ac_coin_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_coin_ldflags"
  LIBS="$sim_ac_coin_libs $LIBS"
], [AC_MSG_ERROR(couldn't compile and link against Coin)])


SIM_AC_CHECK_QT([
  CPPFLAGS="$CPPFLAGS $sim_ac_qt_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_qt_ldflags"
  LIBS="$sim_ac_qt_libs $LIBS"
], [
  SIM_AC_ERROR([no-qt])
])

SIM_AC_CHECK_QGL([
  CPPFLAGS="$CPPFLAGS $sim_ac_qgl_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_qgl_ldflags"
  LIBS="$sim_ac_qgl_libs $LIBS"
], [
  SIM_AC_ERROR([no-qgl])
])

# FIXME: configure check for NutsnBolts? (20070426 frodo)

SIM_AC_QT_PROG(MOC, moc)
if test x"$MOC" = x"false"; then
  SIM_AC_ERROR([no-moc])
fi

SIM_AC_UNIQIFY_LIST(CPPFLAGS, $CPPFLAGS)
SIM_AC_UNIQIFY_LIST(LDFLAGS, $LDFLAGS)
SIM_AC_UNIQIFY_LIST(LIBS, $LIBS)

        
AC_CONFIG_FILES([
        Makefile
        include/Makefile
        include/Quarter/Makefile
        include/Quarter/devices/Makefile
        src/Makefile
        src/Quarter/Makefile
        src/Quarter/devices/Makefile
        src/examples/Makefile
        src/plugins/Makefile])

AC_OUTPUT

echo ""
echo "Now, run 'make' and 'make install' to install $PACKAGE"
echo ""
