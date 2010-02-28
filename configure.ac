m4_define([QUARTER_MAJOR], [1])
m4_define([QUARTER_MINOR], [0])
m4_define([QUARTER_MICRO], [1])
m4_define([QUARTER_BETA], [a])

m4_define([QUARTER_ABI_CURRENT], [1])
m4_define([QUARTER_ABI_REVISION], [QUARTER_MICRO])
m4_define([QUARTER_ABI_AGE], [QUARTER_MINOR])

m4_define([MAC_FRAMEWORK_NAME_DEFAULT], [Quarter])
m4_define([MAC_FRAMEWORK_PREFIX_DEFAULT], [/Library/Frameworks])
m4_define([MAC_FRAMEWORK_VERSION_DEFAULT], [A])
m4_define([MAC_DESIGNERPLUGINS_PREFIX_DEFAULT], [/Developer/Applications/Qt/plugins/designer])

AC_INIT([Quarter], [QUARTER_MAJOR.QUARTER_MINOR.QUARTER_MICRO[]QUARTER_BETA],
  [coin-bugs@coin3d.org])

AC_CONFIG_SRCDIR(src/Quarter/Quarter.cpp)
AC_CONFIG_AUX_DIR(cfg)

# **************************************************************************

AC_CANONICAL_SYSTEM

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

AC_DEFINE_UNQUOTED([QUARTER_MAJOR_VERSION], [$QUARTER_MAJOR_VERSION],
  [define this to the libQuarter major version number])
AC_DEFINE_UNQUOTED([QUARTER_MINOR_VERSION], [$QUARTER_MINOR_VERSION],
  [define this to the libQuarter minor version number])
AC_DEFINE_UNQUOTED([QUARTER_MICRO_VERSION], [$QUARTER_MICRO_VERSION],
  [define this to the libQuarter release version number])
AC_DEFINE_UNQUOTED([QUARTER_VERSION], ["QUARTER_VERSION"],
  [define this to the full libQuarter major.minor.micro version number])


AM_CONFIG_HEADER(config.h)


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

test "x$prefix" = xNONE && prefix=$ac_default_prefix

# *******************************************************************
# disable build if you just want to generate doc.

sim_ac_build_library=true
AC_ARG_ENABLE(
  [build],
  [AC_HELP_STRING([--disable-build], [disable configuration for library build])],
  [case $enableval in
  no | false)
   sim_ac_build_library=false
   SIM_AC_CONFIGURATION_SETTING([Quarter build type], [build disabled])
   ;;
  esac])

AM_CONDITIONAL(BUILD_LIBRARY, $sim_ac_build_library)

# *******************************************************************
# Do we want to build the documentation?

AC_ARG_ENABLE(html,
  AC_HELP_STRING([--enable-html], [build and install Quarter HTML documentation]),
  [case $enableval in
    yes | true) want_html=yes ;;
    *)          want_html=no ;;
  esac],
  [want_html=no])

case $htmldir in
/*)
  # do nothing - absolute path
  ;;
*)
  # expand $docdir and append /html
  htmldir=`eval echo ${docdir}`/html
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

# *******************************************************************
# Include projects we depend on for crossreferencing and inheritance tracking

# First Coin

sim_ac_cointag_fileloc=""

AC_ARG_WITH([cointag],
[  --with-cointag=<path to tagfile>@<:@=Documentation url/path@:>@
                                   (default: NONE) cross references
                                   documentation against the given 
                                   doxygen tagfile],
  [sim_ac_cointag_fileloc="$withval"],
  [sim_ac_cointag_fileloc=""])

AC_SUBST([COIN_TAG_FILE], [$sim_ac_cointag_fileloc])

# Then Qt
sim_ac_qttag_fileloc=""

AC_ARG_WITH([qttag],
[  --with-qttag=<path to tagfile>@<:@=Documentation url/path@:>@
                                (default: NONE) cross references
                                documentation against the given 
                                doxygen tagfile],
  [sim_ac_qttag_fileloc="$withval"],
  [sim_ac_qttag_fileloc=""])

AC_SUBST([QT_TAG_FILE], [$sim_ac_qttag_fileloc])

# **************************************************************************
# decide if we want to build Mac OS X framework

AC_ARG_WITH([framework],
  [  --with-framework  Do Mac OS X-like framework installation
  --without-framework  Do regular installation on Mac OS X],
  [sim_ac_framework_name="MAC_FRAMEWORK_NAME_DEFAULT"
  case $withval in
  yes ) sim_ac_framework=true ;;
  no ) sim_ac_framework=false ;;
  * ) sim_ac_framework=true; sim_ac_framework_name="$withval" ;;
  esac],
  [sim_ac_framework_name="MAC_FRAMEWORK_NAME_DEFAULT"
  case $host_os in
  darwin* ) sim_ac_framework=true ;;
  * ) sim_ac_framework=false ;;
  esac])


# don't allow name to be overrided - just toggled on/off
sim_ac_framework_name="MAC_FRAMEWORK_NAME_DEFAULT"
sim_ac_framework_prefix="MAC_FRAMEWORK_PREFIX_DEFAULT"
sim_ac_framework_version="MAC_FRAMEWORK_VERSION_DEFAULT"

AC_ARG_WITH([framework-prefix],
  [  --with-framework-prefix=<path>  (default: "MAC_FRAMEWORK_PREFIX_DEFAULT")],
  [sim_ac_framework_prefix="$withval"],
  [sim_ac_framework_prefix="MAC_FRAMEWORK_PREFIX_DEFAULT"])


# **************************************************************************
# decide if we want to use pkg-config

sim_ac_enable_pkgconfig=true
sim_ac_pkgconfig_check_qt_failed=true
sim_ac_pkgconfig_check_coin_failed=true

AC_ARG_ENABLE(
  [pkgconfig],
  AC_HELP_STRING([--enable-pkgconfig], 
  [enable pkgconfig usage for Coin/Qt4 detection [[default=yes]]]), 
  [
  case $enableval in
    no) sim_ac_enable_pkgconfig=false ;;
    *) ;;
  esac])

AC_ARG_WITH(
  [pkgconfig],
  [AC_HELP_STRING([--with-pkgconfig=string],
                  [Specify pkgconfig directory that should be searched before the default path])],
  [case $withval in
   no | false ) sim_ac_enable_pkgconfig=false ;;
   * ) WITH_PKG_CONFIG_PATH="$withval" ;;
   esac],
  [WITH_PKG_CONFIG_PATH=])

# *******************************************************************

if $sim_ac_framework; then
   # use the normal Coin m4 macro
   sim_ac_enable_pkgconfig=false
fi

# Detect Mac OS X
case $host_os in
darwin* )
  sim_ac_macosx=true
  sim_ac_macosx_10_2ff=true
  ;;
* ) # not a Mac OS X
  sim_ac_macosx=false
  sim_ac_macosx_10_2ff=false 
  ;;
esac

AC_SUBST([MAC_FRAMEWORK], [$sim_ac_framework])
AC_SUBST([MAC_FRAMEWORK_NAME], [$sim_ac_framework_name])
AC_SUBST([MAC_FRAMEWORK_PREFIX], [$sim_ac_framework_prefix])
AC_SUBST([MAC_FRAMEWORK_VERSION], [$sim_ac_framework_version])
AC_SUBST([MAC_DESIGNERPLUGINS_PREFIX], [MAC_DESIGNERPLUGINS_PREFIX_DEFAULT])
AC_SUBST([nop], [])

AM_CONDITIONAL([MAC_FRAMEWORK], [$sim_ac_framework])
AM_CONDITIONAL([MACOSX], [$sim_ac_macosx])
AM_CONDITIONAL([MACOSX_10_2FF], [$sim_ac_macosx_10_2ff])

# **************************************************************************
# Miscellaneous options and initializations.

quarter_build_dir=`pwd`
quarter_src_dir=`cd "$srcdir"; pwd`
AC_SUBST([quarter_build_dir])
AC_SUBST([quarter_src_dir])

SIM_AC_RELATIVE_SRC_DIR

AC_ARG_WITH(
  [alternate],
  [AC_HELP_STRING([--with-alternate=string],
                  [specify name of alternate configuration])],
  [CONFIG=$withval],
  [CONFIG=default])

AC_SUBST(CONFIG)

AC_ARG_WITH(
  [suffix],
  [AC_HELP_STRING([--with-suffix=string],
                  [specify library name suffix (e.g. "_g")])],
  [SUFFIX=$withval]
  SIM_AC_CONFIGURATION_SETTING([Library Suffix], [$SUFFIX]),
  [SUFFIX=])

AC_SUBST(SUFFIX)

# *******************************************************************
# try to use pkg-config
if $sim_ac_enable_pkgconfig && $sim_ac_build_library; then
  PKG_CONFIG_PATH="$WITH_PKG_CONFIG_PATH:${prefix}/lib/pkgconfig/:$PKG_CONFIG_PATH"
  export PKG_CONFIG_PATH
  
  PKG_CHECK_MODULES([Coin], [Coin], [
    COIN_USE_CPPFLAGS="$Coin_CFLAGS"
    COIN_USE_CXXFLAGS="$Coin_CFLAGS"
    COIN_USE_LIBS="$Coin_LIBS"
  
    SIM_AC_CONFIGURATION_SETTING([Coin version], [`$PKG_CONFIG --modversion Coin`])
    sim_ac_pkgconfig_check_coin_failed=false
  ], [
    AC_MSG_RESULT([no])

    # try standard qt.m4 approach in case no pkg-config was found
    sim_ac_pkgconfig_check_coin_failed=true
  ])

  PKG_CHECK_MODULES([Qt4], [QtCore QtGui QtOpenGL QtXml], [
    QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $Qt4_CFLAGS"
    QT_USE_CXXFLAGS="$QT_USE_CXXFLAGS $Qt4_CFLAGS"
    QT_USE_LDFLAGS="$QT_USE_LDFLAGS $Qt4_LIBS"
    QT_USE_LIBS="$Qt4_LIBS $QT_USE_LIBS"
  
    QT_USE_LIBDIR=`$PKG_CONFIG --variable=libdir QtCore`
    QT_USE_INCDIR=`dirname \`$PKG_CONFIG --variable=includedir QtCore\``

    AC_MSG_CHECKING([for moc])
    MOC=`$PKG_CONFIG --variable=moc_location QtCore`
    if test -z $MOC; then
      SIM_AC_ERROR([no-moc])
    fi

    # Debian provides a wrong moc_location path (Bug#401807)
    if test -x $MOC; then
      AC_MSG_RESULT([$MOC])
    else
      AC_MSG_RESULT([QtCore pkg-config provided moc_location points to non-existing path])
      MOC=""  
      AC_PATH_PROG([MOC], [moc], [false], [$PATH])
      if test x"$MOC" = x"false"; then
        SIM_AC_ERROR([no-moc])
      fi
    fi

    AC_MSG_CHECKING([for uic])
    UIC=`$PKG_CONFIG --variable=uic_location QtCore`
    if test -z $UIC; then
      SIM_AC_ERROR([no-uic])
    fi

    # Debian provides a wrong uic_location path (Debian bug #401807)
    if test -x $UIC; then
      AC_MSG_RESULT([$UIC])
    else
      AC_MSG_RESULT([QtCore pkg-config provided uic_location points to non-existing path])
      UIC=""
      AC_PATH_PROG([UIC], [uic], [false], [$PATH])
      if test x"$UIC" = x"false"; then
        SIM_AC_ERROR([no-uic])
      fi
    fi
    
    # OBS: Deduct rcc path over common dirname for moc and uic as
    # pkg-config doesn't provide one. This is to ensure that binaries
    # for the same Qt versions are picked up. 20070828 tamer.
    if test `dirname $MOC` = `dirname $UIC`; then
      AC_PATH_PROG([RCC], [rcc], [false], [`dirname $MOC`])
      if test x"$RCC" = x"false"; then
        SIM_AC_ERROR([no-rcc])
      fi
    else
      SIM_AC_ERROR([no-rcc])      
    fi  
 
    QT_VERSION=`$PKG_CONFIG --modversion QtCore`
    SIM_AC_CONFIGURATION_SETTING([Qt version], [$QT_VERSION])
    AC_SUBST([QT_VERSION])

    sim_ac_pkgconfig_check_qt_failed=false
  ], [
    AC_MSG_RESULT([no])
    # try standard qt.m4 approach in case no pkg-config was found
  
    # FIXME: To save you from wasting time and having to look at ugly
    # m4 macros and shell scripts read the "AC_REQUIRE' is often
    # misunderstood." section in the autoconf manual to "understand"
    # why we can't handle the SIM_AC_CHECK_QT section below right here
    # (or who knows, maybe there is a actually some way?). We would
    # otherwise end up with an expanded SIM_AC_WITH_QT before the
    # outermost PKG_CHECK_MODULES. 20070721 tamer.
    sim_ac_pkgconfig_check_qt_failed=true
  ])
fi

# *******************************************************************
# pkg-config did not work, or we did not want to use it
if test x"$sim_ac_build_library" = x"true" && (test x"$sim_ac_enable_pkgconfig" = x"false" || $sim_ac_pkgconfig_check_coin_failed); then
  if $sim_ac_build_library; then
    SIM_AC_CHECK_HEADER_GL([
      CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags"
    ], [AC_MSG_ERROR([could not detect a gl.h header file])])
  fi

  SIM_AC_HAVE_COIN_IFELSE([
    COIN_USE_CPPFLAGS=$sim_ac_coin_cppflags
    COIN_USE_CXXFLAGS=$sim_ac_coin_cxxflags
    COIN_USE_LDFLAGS=$sim_ac_coin_ldflags
    COIN_USE_LIBS=$sim_ac_coin_libs
    SIM_AC_CONFIGURATION_SETTING([Coin version], [`$sim_ac_coin_configcmd --version`])
  ], [AC_MSG_ERROR(couldn't compile and link against Coin)])
fi

if test x"$sim_ac_enable_pkgconfig" = x"false" || $sim_ac_pkgconfig_check_qt_failed; then
  # seems to be required for the Qt test on Mac OS X. pederb, 2007-06-27
  sim_ac_want_x11=no
  case $host_os in
    darwin*)
      SIM_AC_CHECK_X11([sim_ac_want_x11=yes],[sim_ac_want_x11=no])
      ;;
    *)
      sim_ac_want_x11=yes
      ;;
  esac

  if $sim_ac_build_library; then
    SIM_AC_CHECK_QT([
      QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $sim_ac_qt_cppflags"
      QT_USE_CXXFLAGS="$QT_USE_CXXFLAGS $sim_ac_qt_cxxflags"
      QT_USE_LDFLAGS="$QT_USE_LDFLAGS $sim_ac_qt_ldflags"
      QT_USE_LIBS=" $QT_USE_LIBS $sim_ac_qt_libs"
    ], [
      SIM_AC_ERROR([no-qt])
    ])

    sim_ac_configure_save_cppflags=$CPPFLAGS
    sim_ac_configure_save_ldflags=$LDFLAGS
    sim_ac_configure_save_libs=$LIBS

    # need these for the QtOpenGL check
    CPPFLAGS="$CPPFLAGS $COIN_USE_CPPFLAGS $QT_USE_CPPFLAGS"
    LDFLAGS="$LDFLAGS $COIN_USE_LDFLAGS $QT_USE_LDFLAGS"
    LIBS="$LIBS $COIN_USE_LIBS $QT_USE_LIBS"

    SIM_AC_CHECK_QGL([
      QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $sim_ac_qgl_cppflags"
      QT_USE_LDFLAGS="$QT_USE_LDFLAGS $sim_ac_qgl_ldflags"
      QT_USE_LIBS="$sim_ac_qgl_libs $QT_USE_LIBS"
      QT_USE_CPPFLAGS="$QT_USE_CPPFLAGS $sim_ac_qgl_cppflags"
    ], [
      SIM_AC_ERROR([no-qgl])
    ])

    CPPFLAGS=$sim_ac_configure_save_cppflags
    LDFLAGS=$sim_ac_configure_save_ldflags
    LIBS=$sim_ac_configure_save_libs

    SIM_AC_QT_PROG(MOC, moc)
    if test x"$MOC" = x"false"; then
      SIM_AC_ERROR([no-moc])
    fi
  
    SIM_AC_QT_PROG(UIC, uic)
    if test x"$UIC" = x"false"; then
      SIM_AC_ERROR([no-uic])
    fi

    SIM_AC_QT_PROG(RCC, rcc)
    if test x"$RCC" = x"false"; then
      SIM_AC_ERROR([no-rcc])
    fi

    QT_USE_INCDIR="$sim_ac_qtdir/include"
  fi
else
  sim_cv_have_qt_framework=false
fi

SIM_AC_CONFIGURATION_SETTING([Quarter version], [QUARTER_MAJOR.QUARTER_MINOR.QUARTER_MICRO[]QUARTER_BETA])

AM_CONDITIONAL([MAC_QT_FRAMEWORK], [$sim_cv_have_qt_framework])
AC_SUBST([MAC_QT_FRAMEWORK], [$sim_cv_have_qt_framework])

AC_SUBST([COIN_USE_CPPFLAGS])
AC_SUBST([COIN_USE_CXXFLAGS])
AC_SUBST([COIN_USE_LDFLAGS])
AC_SUBST([COIN_USE_LIBS])

AC_SUBST([QT_USE_CPPFLAGS])
AC_SUBST([QT_USE_CXXFLAGS])
AC_SUBST([QT_USE_INCDIR])
AC_SUBST([QT_USE_LDFLAGS])
AC_SUBST([QT_USE_LIBDIR])
AC_SUBST([QT_USE_LIBS])

AC_SUBST([QUARTER_BUILD_CPPFLAGS], [-DQUARTER_INTERNAL])
AC_SUBST([QUARTER_BUILD_CFLAGS])
AC_SUBST([QUARTER_BUILD_CXXFLAGS])
AC_SUBST([QUARTER_LIBFLAGS])

AC_SUBST([QUARTER_USE_CPPFLAGS])
AC_SUBST([QUARTER_USE_LDFLAGS])
AC_SUBST([QUARTER_USE_LIBS])

AC_SUBST([PLUGIN_BUILD_CPPFLAGS])
AC_SUBST([PLUGIN_BUILD_CXXFLAGS])
AC_SUBST([PLUGIN_BUILD_CFLAGS])
AC_SUBST([PLUGIN_BUILD_LIBFLAGS])

# *******************************************************************
# if we want Mac OS X framework, check if Coin is installed as a framework
sim_ac_have_inventor_framework=false

frameworkdir=
if $sim_ac_framework && $sim_ac_coin_avail; then
  sim_ac_coin_frameworkdir=`$sim_ac_coin_configcmd --frameworkdir 2>/dev/null`
  if test x"$sim_ac_coin_frameworkdir" = x""; then
    SIM_AC_CONFIGURATION_WARNING([Coin was not installed as a framework, so Quarter can't be either (option was disabled).])
    sim_ac_framework=false
  else
    sim_ac_have_inventor_framework=true
    if test x"$sim_ac_framework_prefix" = x""; then
      sim_ac_framework_prefix=`dirname "${sim_ac_coin_frameworkdir}"`
    fi
    frameworkdir=${sim_ac_framework_prefix}/${sim_ac_framework_name}.framework
  fi
  SIM_AC_CONFIGURATION_SETTING([Framework Installation Prefix], [$sim_ac_framework_prefix])
else
  sim_ac_framework=false
fi

AC_SUBST([frameworkdir])

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

# **************************************************************************
# we use some extra libs in Quarter FIXME: clean up this mess! (20071116 frodo)
if $sim_cv_have_qt_framework; then
  QT_USE_INCDIR=${sim_ac_qt_framework_dir}
  QT_USE_LIBS="$QT_USE_LIBS -Wl,-framework,QtXml -Wl,-framework,QtScript -Wl,-framework,QtDesigner -L${sim_ac_qt_framework_dir} -lQtUiTools"
else
  case $host_os in
    cygwin | mingw32) sim_ac_qt_windows=true ;;
    *) sim_ac_qt_windows=false ;;
  esac

  if $sim_ac_qt_windows; then

    sim_ac_qt_suffix=
    if $sim_ac_qt_debug; then
      sim_ac_qt_suffix=d
    fi

    if $QUARTER_STATIC; then
      QT_USE_LIBS="-lQtUiTools${sim_ac_qt_suffix} $QT_USE_LIBS -lQtDesigner${sim_ac_qt_suffix} -lQtXml${sim_ac_qt_suffix}"
    else
      QT_USE_LIBS="-lQtUiTools${sim_ac_qt_suffix} $QT_USE_LIBS -lQtDesigner${sim_ac_qt_suffix}4 -lQtXml${sim_ac_qt_suffix}4"
    fi

  else
    QT_USE_LIBS="-lQtUiTools -lQtDesigner -lQtXml $QT_USE_LIBS"
  fi
fi

if $sim_ac_have_inventor_framework; then
  COIN_USE_LIBS="$COIN_USE_LIBS -Wl,-framework,Inventor"
fi


# **************************************************************************

SIM_AC_CONFIGURATION_SETTING([Quarter installation prefix], [$prefix])


# Qt's moc wants Windows-style paths, so if the inputfile is an
# absolute Cygwin-style path it needs conversion.
AC_PATH_PROG(UNIX2WINPATH, cygpath, false)
if test x"$UNIX2WINPATH" = x"false"; then
  UNIX2WINPATH="echo"
else
  UNIX2WINPATH="CYGWIN= $UNIX2WINPATH -w"
fi
AC_SUBST([UNIX2WINPATH])

AC_ARG_WITH(
  [qt-designer-plugin-path],
  [AC_HELP_STRING([--with-qt-designer-plugin-path=<path>],
                  [specify qt designer plugin path (must end with /designer)])],
  [QT_DESIGNER_PLUGIN_PATH=$withval]
  SIM_AC_CONFIGURATION_SETTING([Qt Designer plugin path (overriden)], [$QT_DESIGNER_PLUGIN_PATH]),
  [QT_DESIGNER_PLUGIN_PATH=])


# *******************************************************************
# get the plugin path for Qt Designer

if test "x$QT_DESIGNER_PLUGIN_PATH" = x && $sim_ac_build_library; then
  case $host_os in
    cygwin | mingw32) sim_ac_qt_windows=true ;;
    *) sim_ac_qt_windows=false ;;
  esac

  if $sim_ac_qt_windows; then
    QT_DESIGNER_PLUGIN_PATH=`qmake -query "QT_INSTALL_PLUGINS" | cygpath -u -f -`/designer
  else
    QT_DESIGNER_PLUGIN_PATH=`qmake -query "QT_INSTALL_PLUGINS"`/designer
  fi
  # if we could not get the default location from qmake, use libdir
  if test "x$QT_DESIGNER_PLUGIN_PATH" = x; then 
    QT_DESIGNER_PLUGIN_PATH=`eval echo "${libdir}"`/designer
    SIM_AC_CONFIGURATION_WARNING([Qt Designer plugin directory was not resolved. Installing plugin in $QT_DESIGNER_PLUGIN_PATH])
    SIM_AC_CONFIGURATION_WARNING([don't forget to set QT_PLUGIN_PATH to: `eval echo "${libdir}"`])
  fi
  SIM_AC_CONFIGURATION_SETTING([Qt Designer plugin path], [$QT_DESIGNER_PLUGIN_PATH])
fi
  
AC_SUBST([QT_DESIGNER_PLUGIN_PATH])

QUARTER_RELEASE=

if $BUILD_WITH_MSVC; then
  SIM_AC_CONFIGURATION_SETTING([C library type], [$sim_ac_msvcrt])
  case $enable_symbols in
  no | false)
    QUARTER_RELEASE=true
    ;;
    *)
    QUARTER_RELEASE=false
    ;;
  esac
fi

if $BUILD_WITH_MSVC; then
  if $QUARTER_RELEASE; then
    if $QUARTER_STATIC; then
      SIM_AC_CONFIGURATION_SETTING([Quarter build type], [static .lib, no symbols])
    else
      SIM_AC_CONFIGURATION_SETTING([Quarter build type], [dynamic .dll, no symbols])
    fi
  else
    if $QUARTER_STATIC; then
      SIM_AC_CONFIGURATION_SETTING([Quarter build type], [static .lib + .pdb])
    else
      SIM_AC_CONFIGURATION_SETTING([Quarter build type], [dynamic .dll + .pdb])
    fi
  fi
fi

# **************************************************************************
# Compiler control.

# Make it possible for the user to turn off optimization flags
SIM_AC_COMPILER_OPTIMIZATION

SIM_AC_COMPILE_DEBUG([
  CPPFLAGS="$CPPFLAGS -DQUARTER_DEBUG=1"
], [
  CPPFLAGS="$CPPFLAGS -DQUARTER_DEBUG=0"]
)

SIM_AC_DEBUGSYMBOLS

# in case the QT_USE_LIBS and COIN_USE_LIBS are cleared, collect them
# in a separate variable for the examples
AC_SUBST([EXAMPLES_EXTRA_LIBS])
EXAMPLES_EXTRA_LIBS="$QT_USE_LIBS $COIN_USE_LIBS"

# defer linking with Qt and Coin to the app if we're building a static .lib
if $QUARTER_STATIC && $BUILD_WITH_MSVC; then
  QT_USE_LIBS=
  COIN_USE_LIBS=
fi

QUARTER_USE_LDFLAGS="-L../Quarter"
QUARTER_USE_LIBS="-lQuarter"

# check if compiler/linker handles __declspec()
sim_ac_win32_declspec_available=false
AC_MSG_CHECKING([for __declspec() support])
AC_TRY_LINK(
 [],
 [__declspec(dllimport) int foo;],
 [sim_ac_win32_declspec_available=true
  AC_MSG_RESULT([available])],
 [AC_MSG_RESULT([not available])])

if $sim_ac_win32_declspec_available; then
  if $QUARTER_STATIC; then
    QUARTER_USE_CPPFLAGS="-DQUARTER_NOT_DLL"
  else
    QUARTER_BUILD_CPPFLAGS="-DQUARTER_MAKE_DLL $QUARTER_BUILD_CPPFLAGS"
    QUARTER_USE_CPPFLAGS="-DQUARTER_DLL"
  fi
fi

# Quarter
if $BUILD_WITH_MSVC; then
  rm -f vc80.pdb
  QUARTER_BUILD_CPPFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CPPFLAGS"
  QUARTER_BUILD_CXXFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CXXFLAGS /EHs"
  QUARTER_BUILD_CFLAGS="$QUARTER_BUILD_CPPFLAGS $sim_ac_msvcrt_CFLAGS"

  QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS $sim_ac_msvcrt_LIBLDFLAGS"
  QUARTER_LIBS="$LIBS $sim_ac_msvcrt_LIBLIBS"

  QUARTER_USE_LIBS="-lQuarter${QUARTER_MAJOR_VERSION}${SUFFIX}"

  if $QUARTER_STATIC; then
    QUARTER_LIBFLAGS="-LIB /INCREMENTAL:NO $QUARTER_LIBFLAGS"
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /OUT:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.lib"
  else
    QUARTER_LIBFLAGS="-DLL /INCREMENTAL:NO $QUARTER_LIBFLAGS"
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /OUT:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.dll"
  fi

  if $QUARTER_RELEASE; then
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /RELEASE"
  else
    debugfile="`pwd`/src/Quarter/Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
    debugfile=`cygpath -w "$debugfile" | sed 's,\\\\,\\\\\\\\,g'`

    QUARTER_BUILD_CFLAGS="/Fd$debugfile -g $QUARTER_BUILD_CFLAGS"
    QUARTER_BUILD_CXXFLAGS="/Fd$debugfile -g $QUARTER_BUILD_CXXFLAGS"
    QUARTER_LIBFLAGS="$QUARTER_LIBFLAGS /DEBUG /PDB:Quarter${QUARTER_MAJOR_VERSION}${SUFFIX}.pdb"
  fi
fi

# Mac OS X flags for Plugin
case $host_os in
darwin*)
  PLUGIN_BUILD_CPPFLAGS="\
-DQT_NO_DEBUG \
-DQT_PLUGIN \
-DQT_SCRIPT_LIB \
-DQT_XML_LIB \
-DQT_OPENGL_LIB \
-DQT_GUI_LIB \
-DQT_CORE_LIB \
-DQDESIGNER_EXPORT_WIDGETS \
-DQT_SHARED \
$PLUGIN_BUILD_CPPFLAGS"
  ;;
cygwin | mingw32)
  PLUGIN_BUILD_CPPFLAGS="\
  -DQT_PLUGIN \
  -DUNICODE \
  -DWIN32 \
  -DQT_LARGEFILE_SUPPORT \
  -DQT_CORE_LIB \
  -DQT_XML_LIB \
  -DQT_OPENGL_LIB \
  -DQT_GUI_LIB \
  -DQDESIGNER_EXPORT_WIDGETS \
  -DQT_THREAD_SUPPORT \
  $PLUGIN_BUILD_CPPFLAGS"
  
  if test $sim_ac_qt_debug = false; then
    PLUGIN_BUILD_CPPFLAGS="\
  -DQT_NO_DEBUG \
  $PLUGIN_BUILD_CPPFLAGS"
  fi
  ;;
esac

if $BUILD_WITH_MSVC; then
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
	Quarter.pc
	include/Makefile
	include/Quarter/Makefile
	include/Quarter/devices/Makefile
	include/Quarter/eventhandlers/Makefile
	src/Makefile
	src/Quarter/Makefile
	src/examples/Makefile
	src/plugins/Makefile
	html/Makefile
])

AC_OUTPUT

SIM_AC_CONFIGURATION_SUMMARY

echo ""
echo "Now, run 'make' and 'make install' to install $PACKAGE"
echo ""
