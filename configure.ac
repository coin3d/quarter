m4_define([QUARTER_MAJOR], [0])
m4_define([QUARTER_MINOR], [1])
m4_define([QUARTER_MICRO], [0])
m4_define([QUARTER_BETA], [a])

m4_define([QUARTER_ABI_CURRENT], [1])
m4_define([QUARTER_ABI_REVISION], [QUARTER_MICRO])
m4_define([QUARTER_ABI_AGE], [QUARTER_MINOR])

AC_INIT([Quarter], [QUARTER_MAJOR.QUARTER_MINOR.QUARTER_MICRO[]QUARTER_BETA],
  [coin-bugs@coin3d.org])

AC_CONFIG_SRCDIR(src/Quarter/Quarter.cpp)
AC_CONFIG_AUX_DIR(cfg)
AM_CONFIG_HEADER(config.h)

# *******************************************************************
# If the Microsoft Visual C++ cl.exe compiler is available, set us up for
# compiling with it and to generate an MSWindows .dll file.

SIM_AC_SETUP_MSVCPP_IFELSE

SIM_AC_MSVC_DSP_ENABLE_OPTION

if $BUILD_WITH_MSVC; then
  SIM_AC_SETUP_MSVCRT([
    CPPFLAGS="$CPPFLAGS $sim_ac_msvcrt_CPPFLAGS"
    CFLAGS="$CFLAGS $sim_ac_msvcrt_CFLAGS"
    CXXFLAGS="$CXXFLAGS $sim_ac_msvcrt_CXXFLAGS"
    LDFLAGS="$LDFLAGS $sim_ac_msvcrt_LDFLAGS"
  ])
fi

AM_CONDITIONAL(BUILD_WITH_MSVC, $BUILD_WITH_MSVC)

AC_SUBST([QUARTER_MAJOR_VERSION], [QUARTER_MAJOR])
AC_SUBST([QUARTER_MINOR_VERSION], [QUARTER_MINOR])
AC_SUBST([QUARTER_MICRO_VERSION], [QUARTER_MICRO])
AC_SUBST([QUARTER_BETA_VERSION], [QUARTER_BETA])
AC_SUBST([QUARTER_VERSION], [QUARTER_MAJOR.QUARTER_MINOR.QUARTER_MICRO[]QUARTER_BETA])

VERSION=$QUARTER_VERSION

AM_INIT_AUTOMAKE(Quarter, $QUARTER_VERSION)
AM_MAINTAINER_MODE
AC_PREREQ(2.50)
AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL

SIM_AC_STRIP_EXIT_DECLARATION

#  Default to not building a static library.
#  Can be overridden by the user with --enable-static.
AM_DISABLE_STATIC
AC_PROG_LIBTOOL

AC_LANG(C++)

SIM_AC_HAVE_COIN_IFELSE([
  COIN_USE_CPPFLAGS=$sim_ac_coin_cppflags
  COIN_USE_CXXFLAGS=$sim_ac_coin_cxxflags
  COIN_USE_LDFLAGS=$sim_ac_coin_ldflags
  COIN_USE_LIBS=$sim_ac_coin_libs
], [AC_MSG_ERROR(couldn't compile and link against Coin)])


SIM_AC_CHECK_QT([
  QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $sim_ac_qt_cppflags"
  QT_USE_CXXFLAGS="$QT_USE_CXXFLAGS $sim_ac_qt_cxxflags"
  QT_USE_LDFLAGS="$QT_USE_LDFLAGS $sim_ac_qt_ldflags"
  QT_USE_LIBS="$sim_ac_qt_libs $QT_USE_LIBS"
], [
  SIM_AC_ERROR([no-qt])
])

#SIM_AC_CHECK_QGL([
#  QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $sim_ac_qgl_cppflags"
#  QT_USE_CXXFLAGS="$QT_USE_CXXFLAGS $sim_ac_qgl_cxxflags"
#  QT_USE_LDFLAGS="$QT_USE_LDFLAGS $sim_ac_qgl_ldflags"
#  QT_USE_LIBS="$sim_ac_qgl_libs $QT_USE_LIBS"
#], [
#  SIM_AC_ERROR([no-qgl])
#])

# FIXME: configure check for NutsnBolts? (20070426 frodo)

SIM_AC_QT_PROG(MOC, moc)
if test x"$MOC" = x"false"; then
  SIM_AC_ERROR([no-moc])
fi

SIM_AC_QT_PROG(RCC, rcc)
if test x"$RCC" = x"false"; then
  SIM_AC_ERROR([no-rcc])
fi

SIM_AC_QT_PROG(UIC, uic)
if test x"$RCC" = x"false"; then
  SIM_AC_ERROR([no-uic])
fi

AC_SUBST([COIN_USE_CPPFLAGS])
AC_SUBST([COIN_USE_CXXFLAGS])
AC_SUBST([COIN_USE_LDFLAGS])
AC_SUBST([COIN_USE_LIBS])

AC_SUBST([QT_USE_CPPFLAGS])
AC_SUBST([QT_USE_CXXFLAGS])
AC_SUBST([QT_USE_LDFLAGS])
AC_SUBST([QT_USE_LIBS])

AC_SUBST([QUARTER_BUILD_CPPFLAGS], [-DQUARTER_INTERNAL])
AC_SUBST([QUARTER_BUILD_CFLAGS])
AC_SUBST([QUARTER_BUILD_CXXFLAGS])
AC_SUBST([QUARTER_LIBFLAGS])

AC_SUBST([QUARTER_USE_CPPFLAGS])
AC_SUBST([QUARTER_USE_LDFLAGS])
AC_SUBST([QUARTER_USE_LIBS])


# Miscellaneous options and initializations.
quarter_build_dir=`pwd`
quarter_src_dir=`cd "$srcdir"; pwd`
AC_SUBST([quarter_build_dir])
AC_SUBST([quarter_src_dir])

SIM_AC_RELATIVE_SRC_DIR

# **************************************************************************
# Figure out if library should be built static or dynamic.

case ${enable_static-no} in
yes | true) QUARTER_STATIC=true
            enable_shared=no ;; # fix --enable-static bug? in autoconf 2.58
*)          QUARTER_STATIC=false ;;
esac

case ${enable_shared-default} in
default)    ;;
yes | true) QUARTER_STATIC=false ;;
*)          QUARTER_STATIC=true ;;
esac

AC_ARG_WITH(
  [suffix],
  [AC_HELP_STRING([--with-suffix=string],
                  [specify library name suffix (e.g. "_g")])],
  [SUFFIX=$withval]
  SIM_AC_CONFIGURATION_SETTING([Library Suffix], [$SUFFIX]),
  [SUFFIX=])

AC_SUBST(SUFFIX)

if test x"$prefix" = x"NONE"; then
  prefix=/usr/local
fi

SIM_AC_CONFIGURATION_SETTING([Installation prefix], [$prefix])
SIM_AC_CONFIGURATION_SETTING([Library version], [QUARTER_MAJOR.QUARTER_MINOR.QUARTER_MICRO[]QUARTER_BETA])

# *******************************************************************
# * Do we want to build the documentation?
# *******************************************************************

AC_ARG_VAR([htmldir],
           [destination for HTML docs (default ${datadir}/Quarter/html)])

AC_ARG_ENABLE(html,
  AC_HELP_STRING([--enable-html], [build and install Quarter HTML documentation]),
  [case $enableval in
    yes | true) want_html=yes ;;
    *)          want_html=no ;;
  esac],
  [want_html=no])

case $htmldir in
"")
  htmldir="$datadir/Quarter/html"
  ;;
/*)
  # do nothing - absolute path
  ;;
*)
  htmldir="\${prefix}/$htmldir"
  ;;
esac

AC_SUBST(htmldir)

# Used in the Doxygen parameter file.
AC_SUBST([QUARTER_DOC_HTML], [`echo $want_html | tr '[a-z]' '[A-Z]'`])
AC_SUBST([quarter_html_dir], [`pwd`/html])
AM_CONDITIONAL(BUILD_HTMLPAGES, test x"$want_html" = x"yes")

if test x"$want_html" = x"yes"; then
  SIM_AC_DOXYGEN_TOOL([], [SIM_AC_ERROR([no-doxygen])])
  # Perl is used for the Doxygen-based doc generation
  AC_PATH_PROG(sim_ac_perl_exe, perl, false, $PATH)
  if test x"$sim_ac_perl_exe" = xfalse; then
    AC_MSG_ERROR([Could not find the Perl executable, which is needed for Doxygen doc generation.])
  fi
  SIM_AC_CONFIGURATION_SETTING([HTML installation], [$htmldir])
fi

# path_tag is used to identify paths in docs/coin.doxygen that needs to be
# transformed using cygpath under cygwin.

case $host in
*-cygwin) path_tag="<PATH>" ;;
*)        path_tag= ;;
esac

AC_SUBST(path_tag)


QUARTER_RELEASE=

if $BUILD_WITH_MSVC; then
  SIM_AC_CONFIGURATION_SETTING([C library type], [$sim_ac_msvcrt])
  case $enable_symbols in
  no | false)
    SIM_AC_CONFIGURATION_SETTING([Quarter build type], [dynamic .dll, no symbols])
    QUARTER_RELEASE=true
    ;;
    *)
    SIM_AC_CONFIGURATION_SETTING([Quarter build type], [dynamic .dll + .pdb])
    QUARTER_RELEASE=false
    ;;
  esac
fi

QUARTER_USE_LDFLAGS="-L../Quarter"
QUARTER_USE_LIBS="-lQuarter"

# Quarter
if $BUILD_WITH_MSVC; then
  rm -f vc80.pdb
  QUARTER_BUILD_CPPFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CPPFLAGS"
  QUARTER_BUILD_CXXFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CXXFLAGS"
  QUARTER_BUILD_CFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CFLAGS"

  QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS $sim_ac_msvcrt_LIBLDFLAGS"
  QUARTER_LIBS="$LIBS $sim_ac_msvcrt_LIBLIBS"

  QUARTER_USE_LIBS="-lQuarter${QUARTER_MAJOR_VERSION}${SUFFIX}"

  if $QUARTER_STATIC; then
    QUARTER_LIBFLAGS="-LIB /INCREMENTAL:NO $QUARTER_LIBFLAGS"
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /OUT:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.lib"
    QUARTER_USE_CPPFLAGS="-DQUARTER_NOT_DLL"
  else
    QUARTER_LIBFLAGS="-DLL /INCREMENTAL:NO $QUARTER_LIBFLAGS"
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /OUT:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.dll"
    QUARTER_BUILD_CPPFLAGS="-DQUARTER_MAKE_DLL $QUARTER_BUILD_CPPFLAGS"
    QUARTER_USE_CPPFLAGS="-DQUARTER_DLL"
  fi

  if $QUARTER_RELEASE; then
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /RELEASE"
  else
    debugfile="`pwd`/src/Quarter/Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
    debugfile=`cygpath -w "$debugfile" | sed 's,\\\\,\\\\\\\\,g'`

    QUARTER_BUILD_CFLAGS="/Fd$debugfile -g $QUARTER_BUILD_CFLAGS"
    QUARTER_BUILD_CXXFLAGS="/Fd$debugfile -g $QUARTER_BUILD_CXXFLAGS"
    QUARTER_BUILD_LIBFLAGS="$QUARTER_LIBFLAGS /DEBUG /PDB:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
  fi
fi

# Plugin
AC_SUBST([PLUGIN_BUILD_CPPFLAGS])
AC_SUBST([PLUGIN_BUILD_CXXFLAGS])
AC_SUBST([PLUGIN_BUILD_CFLAGS])
AC_SUBST([PLUGIN_BUILD_LIBFLAGS])

if $BUILD_WITH_MSVC; then
  PLUGIN_BUILD_CPPFLAGS="\
-DQT_PLUGIN \
-DUNICODE \
-DWIN32 \
-DQT_LARGEFILE_SUPPORT \
-DQT_NO_DEBUG \
-DQT_CORE_LIB \
-DQT_XML_LIB \
-DQT_OPENGL_LIB \
-DQT_GUI_LIB \
-DQDESIGNER_EXPORT_WIDGETS \
-DQT_THREAD_SUPPORT \
$PLUGIN_BUILD_CPPFLAGS"

  PLUGIN_BUILD_CPPFLAGS="$PLUGIN_BUILD_CPPFLAGS $sim_ac_msvcrt_CPPFLAGS"
  PLUGIN_BUILD_CXXFLAGS="$PLUGIN_BUILD_CPPFLAGS $sim_ac_msvcrt_CXXFLAGS"
  PLUGIN_BUILD_CFLAGS="$PLUGIN_BUILD_CPPFLAGS $sim_ac_msvcrt_CFLAGS"
  PLUGIN_LIBFLAGS="$PLUGIN_LIBFLAGS $sim_ac_msvcrt_LIBLDFLAGS"

  if $QUARTER_STATIC; then
    PLUGIN_BUILD_LIBFLAGS="-LIB /INCREMENTAL:NO $PLUGIN_BUILD_LIBFLAGS"
    PLUGIN_BUILD_LIBFLAGS="$PLUGIN_BUILD_LIBFLAGS /OUT:QuarterWidgetPlugin${QUARTER_MAJOR_VERSION}${SUFFIX}.lib"
  else
    PLUGIN_BUILD_LIBFLAGS="-DLL /INCREMENTAL:NO $PLUGIN_BUILD_LIBFLAGS"
    PLUGIN_BUILD_LIBFLAGS="$PLUGIN_BUILD_LIBFLAGS /OUT:QuarterWidgetPlugin${QUARTER_MAJOR_VERSION}${SUFFIX}.dll"
  fi

  if $QUARTER_RELEASE; then
    PLUGIN_BUILD_LIBFLAGS="$PLUGIN_BUILD_LIBFLAGS /RELEASE"
  else
    debugfile="`pwd`/src/plugins/QuarterWidgetPlugin${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
    debugfile=`cygpath -w "$debugfile" | sed 's,\\\\,\\\\\\\\,g'`

    PLUGIN_BUILD_CFLAGS="/Fd$debugfile -g $PLUGIN_BUILD_CFLAGS"
    PLUGIN_BUILD_CXXFLAGS="/Fd$debugfile -g $PLUGIN_BUILD_CXXFLAGS"
    PLUGIN_BUILD_LIBFLAGS="$PLUGIN_BUILD_LIBFLAGS /DEBUG /PDB:QuarterWidgetPlugin${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
  fi
fi

# Examples
AC_SUBST([EXAMPLES_BUILD_CPPFLAGS])
AC_SUBST([EXAMPLES_BUILD_CXXFLAGS])
AC_SUBST([EXAMPLES_BUILD_CFLAGS])
AC_SUBST([EXAMPLES_BUILD_LDFLAGS])
AC_SUBST([EXAMPLES_BUILD_LIBFLAGS])

if $BUILD_WITH_MSVC; then
  EXAMPLES_BUILD_CPPFLAGS="$EXAMPLES_BUILD_CPPFLAGS $sim_ac_msvcrt_CPPFLAGS"
  EXAMPLES_BUILD_CXXFLAGS="$EXAMPLES_BUILD_CPPFLAGS $sim_ac_msvcrt_CXXFLAGS"
  EXAMPLES_BUILD_CFLAGS="$EXAMPLES_BUILD_CPPFLAGS $sim_ac_msvcrt_CFLAGS"
  EXAMPLES_LIBFLAGS="$EXAMPLES_LIBFLAGS $sim_ac_msvcrt_LIBLDFLAGS"

  EXAMPLES_BUILD_LIBFLAGS="/INCREMENTAL:NO $EXAMPLES_BUILD_LIBFLAGS"

  if $QUARTER_RELEASE; then
    EXAMPLES_BUILD_LIBFLAGS="$EXAMPLES_BUILD_LIBFLAGS /RELEASE"
  else
    EXAMPLES_BUILD_LIBFLAGS="$EXAMPLES_BUILD_LIBFLAGS /DEBUG"
  fi

fi
  
AC_CONFIG_FILES([
        Makefile
        include/Makefile
        include/Quarter/Makefile
        include/Quarter/devices/Makefile
        include/Quarter/eventhandlers/Makefile
        src/Makefile
        src/Quarter/Makefile
        src/Quarter/devices/Makefile
        src/Quarter/eventhandlers/Makefile
        src/examples/Makefile
        src/plugins/Makefile
        html/Makefile])

AC_OUTPUT

SIM_AC_CONFIGURATION_SUMMARY

echo ""
echo "Now, run 'make' and 'make install' to install $PACKAGE"
echo ""
