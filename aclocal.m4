# generated automatically by aclocal 1.11.1 -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004,
# 2005, 2006, 2007, 2008, 2009  Free Software Foundation, Inc.
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.65],,
[m4_warning([this file was generated for autoconf 2.65.
You have another version of autoconf.  It may work, but is not guaranteed to.
If you have problems, you may need to regenerate the build system entirely.
To do so, use the procedure documented by the package, typically `autoreconf'.])])

# libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
#
#   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
#                 2006, 2007, 2008 Free Software Foundation, Inc.
#   Written by Gordon Matzigkeit, 1996
#
# This file is free software; the Free Software Foundation gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.

m4_define([_LT_COPYING], [dnl
#   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
#                 2006, 2007, 2008 Free Software Foundation, Inc.
#   Written by Gordon Matzigkeit, 1996
#
#   This file is part of GNU Libtool.
#
# GNU Libtool is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# As a special exception to the GNU General Public License,
# if you distribute this file as part of a program or library that
# is built using GNU Libtool, you may include this file under the
# same distribution terms that you use for the rest of that program.
#
# GNU Libtool is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Libtool; see the file COPYING.  If not, a copy
# can be downloaded from http://www.gnu.org/licenses/gpl.html, or
# obtained by writing to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
])

# serial 56 LT_INIT


# LT_PREREQ(VERSION)
# ------------------
# Complain and exit if this libtool version is less that VERSION.
m4_defun([LT_PREREQ],
[m4_if(m4_version_compare(m4_defn([LT_PACKAGE_VERSION]), [$1]), -1,
       [m4_default([$3],
		   [m4_fatal([Libtool version $1 or higher is required],
		             63)])],
       [$2])])


# _LT_CHECK_BUILDDIR
# ------------------
# Complain if the absolute build directory name contains unusual characters
m4_defun([_LT_CHECK_BUILDDIR],
[case `pwd` in
  *\ * | *\	*)
    AC_MSG_WARN([Libtool does not cope well with whitespace in `pwd`]) ;;
esac
])


# LT_INIT([OPTIONS])
# ------------------
AC_DEFUN([LT_INIT],
[AC_PREREQ([2.58])dnl We use AC_INCLUDES_DEFAULT
AC_BEFORE([$0], [LT_LANG])dnl
AC_BEFORE([$0], [LT_OUTPUT])dnl
AC_BEFORE([$0], [LTDL_INIT])dnl
m4_require([_LT_CHECK_BUILDDIR])dnl

dnl Autoconf doesn't catch unexpanded LT_ macros by default:
m4_pattern_forbid([^_?LT_[A-Z_]+$])dnl
m4_pattern_allow([^(_LT_EOF|LT_DLGLOBAL|LT_DLLAZY_OR_NOW|LT_MULTI_MODULE)$])dnl
dnl aclocal doesn't pull ltoptions.m4, ltsugar.m4, or ltversion.m4
dnl unless we require an AC_DEFUNed macro:
AC_REQUIRE([LTOPTIONS_VERSION])dnl
AC_REQUIRE([LTSUGAR_VERSION])dnl
AC_REQUIRE([LTVERSION_VERSION])dnl
AC_REQUIRE([LTOBSOLETE_VERSION])dnl
m4_require([_LT_PROG_LTMAIN])dnl

dnl Parse OPTIONS
_LT_SET_OPTIONS([$0], [$1])

# This can be used to rebuild libtool when needed
LIBTOOL_DEPS="$ltmain"

# Always use our own libtool.
LIBTOOL='$(SHELL) $(top_builddir)/libtool'
AC_SUBST(LIBTOOL)dnl

_LT_SETUP

# Only expand once:
m4_define([LT_INIT])
])# LT_INIT

# Old names:
AU_ALIAS([AC_PROG_LIBTOOL], [LT_INIT])
AU_ALIAS([AM_PROG_LIBTOOL], [LT_INIT])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_PROG_LIBTOOL], [])
dnl AC_DEFUN([AM_PROG_LIBTOOL], [])


# _LT_CC_BASENAME(CC)
# -------------------
# Calculate cc_basename.  Skip known compiler wrappers and cross-prefix.
m4_defun([_LT_CC_BASENAME],
[for cc_temp in $1""; do
  case $cc_temp in
    compile | *[[\\/]]compile | ccache | *[[\\/]]ccache ) ;;
    distcc | *[[\\/]]distcc | purify | *[[\\/]]purify ) ;;
    \-*) ;;
    *) break;;
  esac
done
cc_basename=`$ECHO "X$cc_temp" | $Xsed -e 's%.*/%%' -e "s%^$host_alias-%%"`
])


# _LT_FILEUTILS_DEFAULTS
# ----------------------
# It is okay to use these file commands and assume they have been set
# sensibly after `m4_require([_LT_FILEUTILS_DEFAULTS])'.
m4_defun([_LT_FILEUTILS_DEFAULTS],
[: ${CP="cp -f"}
: ${MV="mv -f"}
: ${RM="rm -f"}
])# _LT_FILEUTILS_DEFAULTS


# _LT_SETUP
# ---------
m4_defun([_LT_SETUP],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
_LT_DECL([], [host_alias], [0], [The host system])dnl
_LT_DECL([], [host], [0])dnl
_LT_DECL([], [host_os], [0])dnl
dnl
_LT_DECL([], [build_alias], [0], [The build system])dnl
_LT_DECL([], [build], [0])dnl
_LT_DECL([], [build_os], [0])dnl
dnl
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([LT_PATH_LD])dnl
AC_REQUIRE([LT_PATH_NM])dnl
dnl
AC_REQUIRE([AC_PROG_LN_S])dnl
test -z "$LN_S" && LN_S="ln -s"
_LT_DECL([], [LN_S], [1], [Whether we need soft or hard links])dnl
dnl
AC_REQUIRE([LT_CMD_MAX_LEN])dnl
_LT_DECL([objext], [ac_objext], [0], [Object file suffix (normally "o")])dnl
_LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_CHECK_SHELL_FEATURES])dnl
m4_require([_LT_CMD_RELOAD])dnl
m4_require([_LT_CHECK_MAGIC_METHOD])dnl
m4_require([_LT_CMD_OLD_ARCHIVE])dnl
m4_require([_LT_CMD_GLOBAL_SYMBOLS])dnl

_LT_CONFIG_LIBTOOL_INIT([
# See if we are running on zsh, and set the options which allow our
# commands through without removal of \ escapes INIT.
if test -n "\${ZSH_VERSION+set}" ; then
   setopt NO_GLOB_SUBST
fi
])
if test -n "${ZSH_VERSION+set}" ; then
   setopt NO_GLOB_SUBST
fi

_LT_CHECK_OBJDIR

m4_require([_LT_TAG_COMPILER])dnl
_LT_PROG_ECHO_BACKSLASH

case $host_os in
aix3*)
  # AIX sometimes has problems with the GCC collect2 program.  For some
  # reason, if we set the COLLECT_NAMES environment variable, the problems
  # vanish in a puff of smoke.
  if test "X${COLLECT_NAMES+set}" != Xset; then
    COLLECT_NAMES=
    export COLLECT_NAMES
  fi
  ;;
esac

# Sed substitution that helps us do robust quoting.  It backslashifies
# metacharacters that are still active within double-quoted strings.
sed_quote_subst='s/\([["`$\\]]\)/\\\1/g'

# Same as above, but do not quote variable references.
double_quote_subst='s/\([["`\\]]\)/\\\1/g'

# Sed substitution to delay expansion of an escaped shell variable in a
# double_quote_subst'ed string.
delay_variable_subst='s/\\\\\\\\\\\$/\\\\\\$/g'

# Sed substitution to delay expansion of an escaped single quote.
delay_single_quote_subst='s/'\''/'\'\\\\\\\'\''/g'

# Sed substitution to avoid accidental globbing in evaled expressions
no_glob_subst='s/\*/\\\*/g'

# Global variables:
ofile=libtool
can_build_shared=yes

# All known linkers require a `.a' archive for static linking (except MSVC,
# which needs '.lib').
libext=a

with_gnu_ld="$lt_cv_prog_gnu_ld"

old_CC="$CC"
old_CFLAGS="$CFLAGS"

# Set sane defaults for various variables
test -z "$CC" && CC=cc
test -z "$LTCC" && LTCC=$CC
test -z "$LTCFLAGS" && LTCFLAGS=$CFLAGS
test -z "$LD" && LD=ld
test -z "$ac_objext" && ac_objext=o

_LT_CC_BASENAME([$compiler])

# Only perform the check for file, if the check method requires it
test -z "$MAGIC_CMD" && MAGIC_CMD=file
case $deplibs_check_method in
file_magic*)
  if test "$file_magic_cmd" = '$MAGIC_CMD'; then
    _LT_PATH_MAGIC
  fi
  ;;
esac

# Use C for the default configuration in the libtool script
LT_SUPPORTED_TAG([CC])
_LT_LANG_C_CONFIG
_LT_LANG_DEFAULT_CONFIG
_LT_CONFIG_COMMANDS
])# _LT_SETUP


# _LT_PROG_LTMAIN
# ---------------
# Note that this code is called both from `configure', and `config.status'
# now that we use AC_CONFIG_COMMANDS to generate libtool.  Notably,
# `config.status' has no value for ac_aux_dir unless we are using Automake,
# so we pass a copy along to make sure it has a sensible value anyway.
m4_defun([_LT_PROG_LTMAIN],
[m4_ifdef([AC_REQUIRE_AUX_FILE], [AC_REQUIRE_AUX_FILE([ltmain.sh])])dnl
_LT_CONFIG_LIBTOOL_INIT([ac_aux_dir='$ac_aux_dir'])
ltmain="$ac_aux_dir/ltmain.sh"
])# _LT_PROG_LTMAIN



# So that we can recreate a full libtool script including additional
# tags, we accumulate the chunks of code to send to AC_CONFIG_COMMANDS
# in macros and then make a single call at the end using the `libtool'
# label.


# _LT_CONFIG_LIBTOOL_INIT([INIT-COMMANDS])
# ----------------------------------------
# Register INIT-COMMANDS to be passed to AC_CONFIG_COMMANDS later.
m4_define([_LT_CONFIG_LIBTOOL_INIT],
[m4_ifval([$1],
          [m4_append([_LT_OUTPUT_LIBTOOL_INIT],
                     [$1
])])])

# Initialize.
m4_define([_LT_OUTPUT_LIBTOOL_INIT])


# _LT_CONFIG_LIBTOOL([COMMANDS])
# ------------------------------
# Register COMMANDS to be passed to AC_CONFIG_COMMANDS later.
m4_define([_LT_CONFIG_LIBTOOL],
[m4_ifval([$1],
          [m4_append([_LT_OUTPUT_LIBTOOL_COMMANDS],
                     [$1
])])])

# Initialize.
m4_define([_LT_OUTPUT_LIBTOOL_COMMANDS])


# _LT_CONFIG_SAVE_COMMANDS([COMMANDS], [INIT_COMMANDS])
# -----------------------------------------------------
m4_defun([_LT_CONFIG_SAVE_COMMANDS],
[_LT_CONFIG_LIBTOOL([$1])
_LT_CONFIG_LIBTOOL_INIT([$2])
])


# _LT_FORMAT_COMMENT([COMMENT])
# -----------------------------
# Add leading comment marks to the start of each line, and a trailing
# full-stop to the whole comment if one is not present already.
m4_define([_LT_FORMAT_COMMENT],
[m4_ifval([$1], [
m4_bpatsubst([m4_bpatsubst([$1], [^ *], [# ])],
              [['`$\]], [\\\&])]m4_bmatch([$1], [[!?.]$], [], [.])
)])





# _LT_DECL([CONFIGNAME], VARNAME, VALUE, [DESCRIPTION], [IS-TAGGED?])
# -------------------------------------------------------------------
# CONFIGNAME is the name given to the value in the libtool script.
# VARNAME is the (base) name used in the configure script.
# VALUE may be 0, 1 or 2 for a computed quote escaped value based on
# VARNAME.  Any other value will be used directly.
m4_define([_LT_DECL],
[lt_if_append_uniq([lt_decl_varnames], [$2], [, ],
    [lt_dict_add_subkey([lt_decl_dict], [$2], [libtool_name],
	[m4_ifval([$1], [$1], [$2])])
    lt_dict_add_subkey([lt_decl_dict], [$2], [value], [$3])
    m4_ifval([$4],
	[lt_dict_add_subkey([lt_decl_dict], [$2], [description], [$4])])
    lt_dict_add_subkey([lt_decl_dict], [$2],
	[tagged?], [m4_ifval([$5], [yes], [no])])])
])


# _LT_TAGDECL([CONFIGNAME], VARNAME, VALUE, [DESCRIPTION])
# --------------------------------------------------------
m4_define([_LT_TAGDECL], [_LT_DECL([$1], [$2], [$3], [$4], [yes])])


# lt_decl_tag_varnames([SEPARATOR], [VARNAME1...])
# ------------------------------------------------
m4_define([lt_decl_tag_varnames],
[_lt_decl_filter([tagged?], [yes], $@)])


# _lt_decl_filter(SUBKEY, VALUE, [SEPARATOR], [VARNAME1..])
# ---------------------------------------------------------
m4_define([_lt_decl_filter],
[m4_case([$#],
  [0], [m4_fatal([$0: too few arguments: $#])],
  [1], [m4_fatal([$0: too few arguments: $#: $1])],
  [2], [lt_dict_filter([lt_decl_dict], [$1], [$2], [], lt_decl_varnames)],
  [3], [lt_dict_filter([lt_decl_dict], [$1], [$2], [$3], lt_decl_varnames)],
  [lt_dict_filter([lt_decl_dict], $@)])[]dnl
])


# lt_decl_quote_varnames([SEPARATOR], [VARNAME1...])
# --------------------------------------------------
m4_define([lt_decl_quote_varnames],
[_lt_decl_filter([value], [1], $@)])


# lt_decl_dquote_varnames([SEPARATOR], [VARNAME1...])
# ---------------------------------------------------
m4_define([lt_decl_dquote_varnames],
[_lt_decl_filter([value], [2], $@)])


# lt_decl_varnames_tagged([SEPARATOR], [VARNAME1...])
# ---------------------------------------------------
m4_define([lt_decl_varnames_tagged],
[_$0(m4_quote(m4_default([$1], [[, ]])),
     m4_quote(m4_if([$2], [],
		     m4_quote(lt_decl_tag_varnames),
		  m4_quote(m4_shift($@)))),
     m4_split(m4_normalize(m4_quote(_LT_TAGS))))])
m4_define([_lt_decl_varnames_tagged], [lt_combine([$1], [$2], [_], $3)])


# lt_decl_all_varnames([SEPARATOR], [VARNAME1...])
# ------------------------------------------------
m4_define([lt_decl_all_varnames],
[_$0(m4_quote(m4_default([$1], [[, ]])),
     m4_if([$2], [],
	   m4_quote(lt_decl_varnames),
	m4_quote(m4_shift($@))))[]dnl
])
m4_define([_lt_decl_all_varnames],
[lt_join($@, lt_decl_varnames_tagged([$1],
			lt_decl_tag_varnames([[, ]], m4_shift($@))))dnl
])


# _LT_CONFIG_STATUS_DECLARE([VARNAME])
# ------------------------------------
# Quote a variable value, and forward it to `config.status' so that its
# declaration there will have the same value as in `configure'.  VARNAME
# must have a single quote delimited value for this to work.
m4_define([_LT_CONFIG_STATUS_DECLARE],
[$1='`$ECHO "X$][$1" | $Xsed -e "$delay_single_quote_subst"`'])


# _LT_CONFIG_STATUS_DECLARATIONS
# ------------------------------
# We delimit libtool config variables with single quotes, so when
# we write them to config.status, we have to be sure to quote all
# embedded single quotes properly.  In configure, this macro expands
# each variable declared with _LT_DECL (and _LT_TAGDECL) into:
#
#    <var>='`$ECHO "X$<var>" | $Xsed -e "$delay_single_quote_subst"`'
m4_defun([_LT_CONFIG_STATUS_DECLARATIONS],
[m4_foreach([_lt_var], m4_quote(lt_decl_all_varnames),
    [m4_n([_LT_CONFIG_STATUS_DECLARE(_lt_var)])])])


# _LT_LIBTOOL_TAGS
# ----------------
# Output comment and list of tags supported by the script
m4_defun([_LT_LIBTOOL_TAGS],
[_LT_FORMAT_COMMENT([The names of the tagged configurations supported by this script])dnl
available_tags="_LT_TAGS"dnl
])


# _LT_LIBTOOL_DECLARE(VARNAME, [TAG])
# -----------------------------------
# Extract the dictionary values for VARNAME (optionally with TAG) and
# expand to a commented shell variable setting:
#
#    # Some comment about what VAR is for.
#    visible_name=$lt_internal_name
m4_define([_LT_LIBTOOL_DECLARE],
[_LT_FORMAT_COMMENT(m4_quote(lt_dict_fetch([lt_decl_dict], [$1],
					   [description])))[]dnl
m4_pushdef([_libtool_name],
    m4_quote(lt_dict_fetch([lt_decl_dict], [$1], [libtool_name])))[]dnl
m4_case(m4_quote(lt_dict_fetch([lt_decl_dict], [$1], [value])),
    [0], [_libtool_name=[$]$1],
    [1], [_libtool_name=$lt_[]$1],
    [2], [_libtool_name=$lt_[]$1],
    [_libtool_name=lt_dict_fetch([lt_decl_dict], [$1], [value])])[]dnl
m4_ifval([$2], [_$2])[]m4_popdef([_libtool_name])[]dnl
])


# _LT_LIBTOOL_CONFIG_VARS
# -----------------------
# Produce commented declarations of non-tagged libtool config variables
# suitable for insertion in the LIBTOOL CONFIG section of the `libtool'
# script.  Tagged libtool config variables (even for the LIBTOOL CONFIG
# section) are produced by _LT_LIBTOOL_TAG_VARS.
m4_defun([_LT_LIBTOOL_CONFIG_VARS],
[m4_foreach([_lt_var],
    m4_quote(_lt_decl_filter([tagged?], [no], [], lt_decl_varnames)),
    [m4_n([_LT_LIBTOOL_DECLARE(_lt_var)])])])


# _LT_LIBTOOL_TAG_VARS(TAG)
# -------------------------
m4_define([_LT_LIBTOOL_TAG_VARS],
[m4_foreach([_lt_var], m4_quote(lt_decl_tag_varnames),
    [m4_n([_LT_LIBTOOL_DECLARE(_lt_var, [$1])])])])


# _LT_TAGVAR(VARNAME, [TAGNAME])
# ------------------------------
m4_define([_LT_TAGVAR], [m4_ifval([$2], [$1_$2], [$1])])


# _LT_CONFIG_COMMANDS
# -------------------
# Send accumulated output to $CONFIG_STATUS.  Thanks to the lists of
# variables for single and double quote escaping we saved from calls
# to _LT_DECL, we can put quote escaped variables declarations
# into `config.status', and then the shell code to quote escape them in
# for loops in `config.status'.  Finally, any additional code accumulated
# from calls to _LT_CONFIG_LIBTOOL_INIT is expanded.
m4_defun([_LT_CONFIG_COMMANDS],
[AC_PROVIDE_IFELSE([LT_OUTPUT],
	dnl If the libtool generation code has been placed in $CONFIG_LT,
	dnl instead of duplicating it all over again into config.status,
	dnl then we will have config.status run $CONFIG_LT later, so it
	dnl needs to know what name is stored there:
        [AC_CONFIG_COMMANDS([libtool],
            [$SHELL $CONFIG_LT || AS_EXIT(1)], [CONFIG_LT='$CONFIG_LT'])],
    dnl If the libtool generation code is destined for config.status,
    dnl expand the accumulated commands and init code now:
    [AC_CONFIG_COMMANDS([libtool],
        [_LT_OUTPUT_LIBTOOL_COMMANDS], [_LT_OUTPUT_LIBTOOL_COMMANDS_INIT])])
])#_LT_CONFIG_COMMANDS


# Initialize.
m4_define([_LT_OUTPUT_LIBTOOL_COMMANDS_INIT],
[

# The HP-UX ksh and POSIX shell print the target directory to stdout
# if CDPATH is set.
(unset CDPATH) >/dev/null 2>&1 && unset CDPATH

sed_quote_subst='$sed_quote_subst'
double_quote_subst='$double_quote_subst'
delay_variable_subst='$delay_variable_subst'
_LT_CONFIG_STATUS_DECLARATIONS
LTCC='$LTCC'
LTCFLAGS='$LTCFLAGS'
compiler='$compiler_DEFAULT'

# Quote evaled strings.
for var in lt_decl_all_varnames([[ \
]], lt_decl_quote_varnames); do
    case \`eval \\\\\$ECHO "X\\\\\$\$var"\` in
    *[[\\\\\\\`\\"\\\$]]*)
      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"X\\\$\$var\\" | \\\$Xsed -e \\"\\\$sed_quote_subst\\"\\\`\\\\\\""
      ;;
    *)
      eval "lt_\$var=\\\\\\"\\\$\$var\\\\\\""
      ;;
    esac
done

# Double-quote double-evaled strings.
for var in lt_decl_all_varnames([[ \
]], lt_decl_dquote_varnames); do
    case \`eval \\\\\$ECHO "X\\\\\$\$var"\` in
    *[[\\\\\\\`\\"\\\$]]*)
      eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"X\\\$\$var\\" | \\\$Xsed -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
      ;;
    *)
      eval "lt_\$var=\\\\\\"\\\$\$var\\\\\\""
      ;;
    esac
done

# Fix-up fallback echo if it was mangled by the above quoting rules.
case \$lt_ECHO in
*'\\\[$]0 --fallback-echo"')dnl "
  lt_ECHO=\`\$ECHO "X\$lt_ECHO" | \$Xsed -e 's/\\\\\\\\\\\\\\\[$]0 --fallback-echo"\[$]/\[$]0 --fallback-echo"/'\`
  ;;
esac

_LT_OUTPUT_LIBTOOL_INIT
])


# LT_OUTPUT
# ---------
# This macro allows early generation of the libtool script (before
# AC_OUTPUT is called), incase it is used in configure for compilation
# tests.
AC_DEFUN([LT_OUTPUT],
[: ${CONFIG_LT=./config.lt}
AC_MSG_NOTICE([creating $CONFIG_LT])
cat >"$CONFIG_LT" <<_LTEOF
#! $SHELL
# Generated by $as_me.
# Run this file to recreate a libtool stub with the current configuration.

lt_cl_silent=false
SHELL=\${CONFIG_SHELL-$SHELL}
_LTEOF

cat >>"$CONFIG_LT" <<\_LTEOF
AS_SHELL_SANITIZE
_AS_PREPARE

exec AS_MESSAGE_FD>&1
exec AS_MESSAGE_LOG_FD>>config.log
{
  echo
  AS_BOX([Running $as_me.])
} >&AS_MESSAGE_LOG_FD

lt_cl_help="\
\`$as_me' creates a local libtool stub from the current configuration,
for use in further configure time tests before the real libtool is
generated.

Usage: $[0] [[OPTIONS]]

  -h, --help      print this help, then exit
  -V, --version   print version number, then exit
  -q, --quiet     do not print progress messages
  -d, --debug     don't remove temporary files

Report bugs to <bug-libtool@gnu.org>."

lt_cl_version="\
m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
configured by $[0], generated by m4_PACKAGE_STRING.

Copyright (C) 2008 Free Software Foundation, Inc.
This config.lt script is free software; the Free Software Foundation
gives unlimited permision to copy, distribute and modify it."

while test $[#] != 0
do
  case $[1] in
    --version | --v* | -V )
      echo "$lt_cl_version"; exit 0 ;;
    --help | --h* | -h )
      echo "$lt_cl_help"; exit 0 ;;
    --debug | --d* | -d )
      debug=: ;;
    --quiet | --q* | --silent | --s* | -q )
      lt_cl_silent=: ;;

    -*) AC_MSG_ERROR([unrecognized option: $[1]
Try \`$[0] --help' for more information.]) ;;

    *) AC_MSG_ERROR([unrecognized argument: $[1]
Try \`$[0] --help' for more information.]) ;;
  esac
  shift
done

if $lt_cl_silent; then
  exec AS_MESSAGE_FD>/dev/null
fi
_LTEOF

cat >>"$CONFIG_LT" <<_LTEOF
_LT_OUTPUT_LIBTOOL_COMMANDS_INIT
_LTEOF

cat >>"$CONFIG_LT" <<\_LTEOF
AC_MSG_NOTICE([creating $ofile])
_LT_OUTPUT_LIBTOOL_COMMANDS
AS_EXIT(0)
_LTEOF
chmod +x "$CONFIG_LT"

# configure is writing to config.log, but config.lt does its own redirection,
# appending to config.log, which fails on DOS, as config.log is still kept
# open by configure.  Here we exec the FD to /dev/null, effectively closing
# config.log, so it can be properly (re)opened and appended to by config.lt.
if test "$no_create" != yes; then
  lt_cl_success=:
  test "$silent" = yes &&
    lt_config_lt_args="$lt_config_lt_args --quiet"
  exec AS_MESSAGE_LOG_FD>/dev/null
  $SHELL "$CONFIG_LT" $lt_config_lt_args || lt_cl_success=false
  exec AS_MESSAGE_LOG_FD>>config.log
  $lt_cl_success || AS_EXIT(1)
fi
])# LT_OUTPUT


# _LT_CONFIG(TAG)
# ---------------
# If TAG is the built-in tag, create an initial libtool script with a
# default configuration from the untagged config vars.  Otherwise add code
# to config.status for appending the configuration named by TAG from the
# matching tagged config vars.
m4_defun([_LT_CONFIG],
[m4_require([_LT_FILEUTILS_DEFAULTS])dnl
_LT_CONFIG_SAVE_COMMANDS([
  m4_define([_LT_TAG], m4_if([$1], [], [C], [$1]))dnl
  m4_if(_LT_TAG, [C], [
    # See if we are running on zsh, and set the options which allow our
    # commands through without removal of \ escapes.
    if test -n "${ZSH_VERSION+set}" ; then
      setopt NO_GLOB_SUBST
    fi

    cfgfile="${ofile}T"
    trap "$RM \"$cfgfile\"; exit 1" 1 2 15
    $RM "$cfgfile"

    cat <<_LT_EOF >> "$cfgfile"
#! $SHELL

# `$ECHO "$ofile" | sed 's%^.*/%%'` - Provide generalized library-building support services.
# Generated automatically by $as_me ($PACKAGE$TIMESTAMP) $VERSION
# Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
# NOTE: Changes made to this file will be lost: look at ltmain.sh.
#
_LT_COPYING
_LT_LIBTOOL_TAGS

# ### BEGIN LIBTOOL CONFIG
_LT_LIBTOOL_CONFIG_VARS
_LT_LIBTOOL_TAG_VARS
# ### END LIBTOOL CONFIG

_LT_EOF

  case $host_os in
  aix3*)
    cat <<\_LT_EOF >> "$cfgfile"
# AIX sometimes has problems with the GCC collect2 program.  For some
# reason, if we set the COLLECT_NAMES environment variable, the problems
# vanish in a puff of smoke.
if test "X${COLLECT_NAMES+set}" != Xset; then
  COLLECT_NAMES=
  export COLLECT_NAMES
fi
_LT_EOF
    ;;
  esac

  _LT_PROG_LTMAIN

  # We use sed instead of cat because bash on DJGPP gets confused if
  # if finds mixed CR/LF and LF-only lines.  Since sed operates in
  # text mode, it properly converts lines to CR/LF.  This bash problem
  # is reportedly fixed, but why not run on old versions too?
  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
    || (rm -f "$cfgfile"; exit 1)

  _LT_PROG_XSI_SHELLFNS

  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
    || (rm -f "$cfgfile"; exit 1)

  mv -f "$cfgfile" "$ofile" ||
    (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
  chmod +x "$ofile"
],
[cat <<_LT_EOF >> "$ofile"

dnl Unfortunately we have to use $1 here, since _LT_TAG is not expanded
dnl in a comment (ie after a #).
# ### BEGIN LIBTOOL TAG CONFIG: $1
_LT_LIBTOOL_TAG_VARS(_LT_TAG)
# ### END LIBTOOL TAG CONFIG: $1
_LT_EOF
])dnl /m4_if
],
[m4_if([$1], [], [
    PACKAGE='$PACKAGE'
    VERSION='$VERSION'
    TIMESTAMP='$TIMESTAMP'
    RM='$RM'
    ofile='$ofile'], [])
])dnl /_LT_CONFIG_SAVE_COMMANDS
])# _LT_CONFIG


# LT_SUPPORTED_TAG(TAG)
# ---------------------
# Trace this macro to discover what tags are supported by the libtool
# --tag option, using:
#    autoconf --trace 'LT_SUPPORTED_TAG:$1'
AC_DEFUN([LT_SUPPORTED_TAG], [])


# C support is built-in for now
m4_define([_LT_LANG_C_enabled], [])
m4_define([_LT_TAGS], [])


# LT_LANG(LANG)
# -------------
# Enable libtool support for the given language if not already enabled.
AC_DEFUN([LT_LANG],
[AC_BEFORE([$0], [LT_OUTPUT])dnl
m4_case([$1],
  [C],			[_LT_LANG(C)],
  [C++],		[_LT_LANG(CXX)],
  [Java],		[_LT_LANG(GCJ)],
  [Fortran 77],		[_LT_LANG(F77)],
  [Fortran],		[_LT_LANG(FC)],
  [Windows Resource],	[_LT_LANG(RC)],
  [m4_ifdef([_LT_LANG_]$1[_CONFIG],
    [_LT_LANG($1)],
    [m4_fatal([$0: unsupported language: "$1"])])])dnl
])# LT_LANG


# _LT_LANG(LANGNAME)
# ------------------
m4_defun([_LT_LANG],
[m4_ifdef([_LT_LANG_]$1[_enabled], [],
  [LT_SUPPORTED_TAG([$1])dnl
  m4_append([_LT_TAGS], [$1 ])dnl
  m4_define([_LT_LANG_]$1[_enabled], [])dnl
  _LT_LANG_$1_CONFIG($1)])dnl
])# _LT_LANG


# _LT_LANG_DEFAULT_CONFIG
# -----------------------
m4_defun([_LT_LANG_DEFAULT_CONFIG],
[AC_PROVIDE_IFELSE([AC_PROG_CXX],
  [LT_LANG(CXX)],
  [m4_define([AC_PROG_CXX], defn([AC_PROG_CXX])[LT_LANG(CXX)])])

AC_PROVIDE_IFELSE([AC_PROG_F77],
  [LT_LANG(F77)],
  [m4_define([AC_PROG_F77], defn([AC_PROG_F77])[LT_LANG(F77)])])

AC_PROVIDE_IFELSE([AC_PROG_FC],
  [LT_LANG(FC)],
  [m4_define([AC_PROG_FC], defn([AC_PROG_FC])[LT_LANG(FC)])])

dnl The call to [A][M_PROG_GCJ] is quoted like that to stop aclocal
dnl pulling things in needlessly.
AC_PROVIDE_IFELSE([AC_PROG_GCJ],
  [LT_LANG(GCJ)],
  [AC_PROVIDE_IFELSE([A][M_PROG_GCJ],
    [LT_LANG(GCJ)],
    [AC_PROVIDE_IFELSE([LT_PROG_GCJ],
      [LT_LANG(GCJ)],
      [m4_ifdef([AC_PROG_GCJ],
	[m4_define([AC_PROG_GCJ], defn([AC_PROG_GCJ])[LT_LANG(GCJ)])])
       m4_ifdef([A][M_PROG_GCJ],
	[m4_define([A][M_PROG_GCJ], defn([A][M_PROG_GCJ])[LT_LANG(GCJ)])])
       m4_ifdef([LT_PROG_GCJ],
	[m4_define([LT_PROG_GCJ], defn([LT_PROG_GCJ])[LT_LANG(GCJ)])])])])])

AC_PROVIDE_IFELSE([LT_PROG_RC],
  [LT_LANG(RC)],
  [m4_define([LT_PROG_RC], defn([LT_PROG_RC])[LT_LANG(RC)])])
])# _LT_LANG_DEFAULT_CONFIG

# Obsolete macros:
AU_DEFUN([AC_LIBTOOL_CXX], [LT_LANG(C++)])
AU_DEFUN([AC_LIBTOOL_F77], [LT_LANG(Fortran 77)])
AU_DEFUN([AC_LIBTOOL_FC], [LT_LANG(Fortran)])
AU_DEFUN([AC_LIBTOOL_GCJ], [LT_LANG(Java)])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_CXX], [])
dnl AC_DEFUN([AC_LIBTOOL_F77], [])
dnl AC_DEFUN([AC_LIBTOOL_FC], [])
dnl AC_DEFUN([AC_LIBTOOL_GCJ], [])


# _LT_TAG_COMPILER
# ----------------
m4_defun([_LT_TAG_COMPILER],
[AC_REQUIRE([AC_PROG_CC])dnl

_LT_DECL([LTCC], [CC], [1], [A C compiler])dnl
_LT_DECL([LTCFLAGS], [CFLAGS], [1], [LTCC compiler flags])dnl
_LT_TAGDECL([CC], [compiler], [1], [A language specific compiler])dnl
_LT_TAGDECL([with_gcc], [GCC], [0], [Is the compiler the GNU compiler?])dnl

# If no C compiler was specified, use CC.
LTCC=${LTCC-"$CC"}

# If no C compiler flags were specified, use CFLAGS.
LTCFLAGS=${LTCFLAGS-"$CFLAGS"}

# Allow CC to be a program name with arguments.
compiler=$CC
])# _LT_TAG_COMPILER


# _LT_COMPILER_BOILERPLATE
# ------------------------
# Check for compiler boilerplate output or warnings with
# the simple compiler test code.
m4_defun([_LT_COMPILER_BOILERPLATE],
[m4_require([_LT_DECL_SED])dnl
ac_outfile=conftest.$ac_objext
echo "$lt_simple_compile_test_code" >conftest.$ac_ext
eval "$ac_compile" 2>&1 >/dev/null | $SED '/^$/d; /^ *+/d' >conftest.err
_lt_compiler_boilerplate=`cat conftest.err`
$RM conftest*
])# _LT_COMPILER_BOILERPLATE


# _LT_LINKER_BOILERPLATE
# ----------------------
# Check for linker boilerplate output or warnings with
# the simple link test code.
m4_defun([_LT_LINKER_BOILERPLATE],
[m4_require([_LT_DECL_SED])dnl
ac_outfile=conftest.$ac_objext
echo "$lt_simple_link_test_code" >conftest.$ac_ext
eval "$ac_link" 2>&1 >/dev/null | $SED '/^$/d; /^ *+/d' >conftest.err
_lt_linker_boilerplate=`cat conftest.err`
$RM -r conftest*
])# _LT_LINKER_BOILERPLATE

# _LT_REQUIRED_DARWIN_CHECKS
# -------------------------
m4_defun_once([_LT_REQUIRED_DARWIN_CHECKS],[
  case $host_os in
    rhapsody* | darwin*)
    AC_CHECK_TOOL([DSYMUTIL], [dsymutil], [:])
    AC_CHECK_TOOL([NMEDIT], [nmedit], [:])
    AC_CHECK_TOOL([LIPO], [lipo], [:])
    AC_CHECK_TOOL([OTOOL], [otool], [:])
    AC_CHECK_TOOL([OTOOL64], [otool64], [:])
    _LT_DECL([], [DSYMUTIL], [1],
      [Tool to manipulate archived DWARF debug symbol files on Mac OS X])
    _LT_DECL([], [NMEDIT], [1],
      [Tool to change global to local symbols on Mac OS X])
    _LT_DECL([], [LIPO], [1],
      [Tool to manipulate fat objects and archives on Mac OS X])
    _LT_DECL([], [OTOOL], [1],
      [ldd/readelf like tool for Mach-O binaries on Mac OS X])
    _LT_DECL([], [OTOOL64], [1],
      [ldd/readelf like tool for 64 bit Mach-O binaries on Mac OS X 10.4])

    AC_CACHE_CHECK([for -single_module linker flag],[lt_cv_apple_cc_single_mod],
      [lt_cv_apple_cc_single_mod=no
      if test -z "${LT_MULTI_MODULE}"; then
	# By default we will add the -single_module flag. You can override
	# by either setting the environment variable LT_MULTI_MODULE
	# non-empty at configure time, or by adding -multi_module to the
	# link flags.
	rm -rf libconftest.dylib*
	echo "int foo(void){return 1;}" > conftest.c
	echo "$LTCC $LTCFLAGS $LDFLAGS -o libconftest.dylib \
-dynamiclib -Wl,-single_module conftest.c" >&AS_MESSAGE_LOG_FD
	$LTCC $LTCFLAGS $LDFLAGS -o libconftest.dylib \
	  -dynamiclib -Wl,-single_module conftest.c 2>conftest.err
        _lt_result=$?
	if test -f libconftest.dylib && test ! -s conftest.err && test $_lt_result = 0; then
	  lt_cv_apple_cc_single_mod=yes
	else
	  cat conftest.err >&AS_MESSAGE_LOG_FD
	fi
	rm -rf libconftest.dylib*
	rm -f conftest.*
      fi])
    AC_CACHE_CHECK([for -exported_symbols_list linker flag],
      [lt_cv_ld_exported_symbols_list],
      [lt_cv_ld_exported_symbols_list=no
      save_LDFLAGS=$LDFLAGS
      echo "_main" > conftest.sym
      LDFLAGS="$LDFLAGS -Wl,-exported_symbols_list,conftest.sym"
      AC_LINK_IFELSE([AC_LANG_PROGRAM([],[])],
	[lt_cv_ld_exported_symbols_list=yes],
	[lt_cv_ld_exported_symbols_list=no])
	LDFLAGS="$save_LDFLAGS"
    ])
    case $host_os in
    rhapsody* | darwin1.[[012]])
      _lt_dar_allow_undefined='${wl}-undefined ${wl}suppress' ;;
    darwin1.*)
      _lt_dar_allow_undefined='${wl}-flat_namespace ${wl}-undefined ${wl}suppress' ;;
    darwin*) # darwin 5.x on 
      # if running on 10.5 or later, the deployment target defaults
      # to the OS version, if on x86, and 10.4, the deployment
      # target defaults to 10.4. Don't you love it? 
      case ${MACOSX_DEPLOYMENT_TARGET-10.0},$host in
	10.0,*86*-darwin8*|10.0,*-darwin[[91]]*)
	  _lt_dar_allow_undefined='${wl}-undefined ${wl}dynamic_lookup' ;;
	10.[[012]]*)
	  _lt_dar_allow_undefined='${wl}-flat_namespace ${wl}-undefined ${wl}suppress' ;;
	10.*)
	  _lt_dar_allow_undefined='${wl}-undefined ${wl}dynamic_lookup' ;;
      esac
    ;;
  esac
    if test "$lt_cv_apple_cc_single_mod" = "yes"; then
      _lt_dar_single_mod='$single_module'
    fi
    if test "$lt_cv_ld_exported_symbols_list" = "yes"; then
      _lt_dar_export_syms=' ${wl}-exported_symbols_list,$output_objdir/${libname}-symbols.expsym'
    else
      _lt_dar_export_syms='~$NMEDIT -s $output_objdir/${libname}-symbols.expsym ${lib}'
    fi
    if test "$DSYMUTIL" != ":"; then
      _lt_dsymutil='~$DSYMUTIL $lib || :'
    else
      _lt_dsymutil=
    fi
    ;;
  esac
])


# _LT_DARWIN_LINKER_FEATURES
# --------------------------
# Checks for linker and compiler features on darwin
m4_defun([_LT_DARWIN_LINKER_FEATURES],
[
  m4_require([_LT_REQUIRED_DARWIN_CHECKS])
  _LT_TAGVAR(archive_cmds_need_lc, $1)=no
  _LT_TAGVAR(hardcode_direct, $1)=no
  _LT_TAGVAR(hardcode_automatic, $1)=yes
  _LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
  _LT_TAGVAR(whole_archive_flag_spec, $1)=''
  _LT_TAGVAR(link_all_deplibs, $1)=yes
  _LT_TAGVAR(allow_undefined_flag, $1)="$_lt_dar_allow_undefined"
  if test "$GCC" = "yes"; then
    output_verbose_link_cmd=echo
    _LT_TAGVAR(archive_cmds, $1)="\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring $_lt_dar_single_mod${_lt_dsymutil}"
    _LT_TAGVAR(module_cmds, $1)="\$CC \$allow_undefined_flag -o \$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dsymutil}"
    _LT_TAGVAR(archive_expsym_cmds, $1)="sed 's,^,_,' < \$export_symbols > \$output_objdir/\${libname}-symbols.expsym~\$CC -dynamiclib \$allow_undefined_flag -o \$lib \$libobjs \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring ${_lt_dar_single_mod}${_lt_dar_export_syms}${_lt_dsymutil}"
    _LT_TAGVAR(module_expsym_cmds, $1)="sed -e 's,^,_,' < \$export_symbols > \$output_objdir/\${libname}-symbols.expsym~\$CC \$allow_undefined_flag -o \$lib -bundle \$libobjs \$deplibs \$compiler_flags${_lt_dar_export_syms}${_lt_dsymutil}"
    m4_if([$1], [CXX],
[   if test "$lt_cv_apple_cc_single_mod" != "yes"; then
      _LT_TAGVAR(archive_cmds, $1)="\$CC -r -keep_private_externs -nostdlib -o \${lib}-master.o \$libobjs~\$CC -dynamiclib \$allow_undefined_flag -o \$lib \${lib}-master.o \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring${_lt_dsymutil}"
      _LT_TAGVAR(archive_expsym_cmds, $1)="sed 's,^,_,' < \$export_symbols > \$output_objdir/\${libname}-symbols.expsym~\$CC -r -keep_private_externs -nostdlib -o \${lib}-master.o \$libobjs~\$CC -dynamiclib \$allow_undefined_flag -o \$lib \${lib}-master.o \$deplibs \$compiler_flags -install_name \$rpath/\$soname \$verstring${_lt_dar_export_syms}${_lt_dsymutil}"
    fi
],[])
  else
  _LT_TAGVAR(ld_shlibs, $1)=no
  fi
])

# _LT_SYS_MODULE_PATH_AIX
# -----------------------
# Links a minimal program and checks the executable
# for the system default hardcoded library path. In most cases,
# this is /usr/lib:/lib, but when the MPI compilers are used
# the location of the communication and MPI libs are included too.
# If we don't find anything, use the default library path according
# to the aix ld manual.
m4_defun([_LT_SYS_MODULE_PATH_AIX],
[m4_require([_LT_DECL_SED])dnl
AC_LINK_IFELSE(AC_LANG_PROGRAM,[
lt_aix_libpath_sed='
    /Import File Strings/,/^$/ {
	/^0/ {
	    s/^0  *\(.*\)$/\1/
	    p
	}
    }'
aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
# Check for a 64-bit object if we didn't find anything.
if test -z "$aix_libpath"; then
  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
fi],[])
if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
])# _LT_SYS_MODULE_PATH_AIX


# _LT_SHELL_INIT(ARG)
# -------------------
m4_define([_LT_SHELL_INIT],
[ifdef([AC_DIVERSION_NOTICE],
	     [AC_DIVERT_PUSH(AC_DIVERSION_NOTICE)],
	 [AC_DIVERT_PUSH(NOTICE)])
$1
AC_DIVERT_POP
])# _LT_SHELL_INIT


# _LT_PROG_ECHO_BACKSLASH
# -----------------------
# Add some code to the start of the generated configure script which
# will find an echo command which doesn't interpret backslashes.
m4_defun([_LT_PROG_ECHO_BACKSLASH],
[_LT_SHELL_INIT([
# Check that we are running under the correct shell.
SHELL=${CONFIG_SHELL-/bin/sh}

case X$lt_ECHO in
X*--fallback-echo)
  # Remove one level of quotation (which was required for Make).
  ECHO=`echo "$lt_ECHO" | sed 's,\\\\\[$]\\[$]0,'[$]0','`
  ;;
esac

ECHO=${lt_ECHO-echo}
if test "X[$]1" = X--no-reexec; then
  # Discard the --no-reexec flag, and continue.
  shift
elif test "X[$]1" = X--fallback-echo; then
  # Avoid inline document here, it may be left over
  :
elif test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' ; then
  # Yippee, $ECHO works!
  :
else
  # Restart under the correct shell.
  exec $SHELL "[$]0" --no-reexec ${1+"[$]@"}
fi

if test "X[$]1" = X--fallback-echo; then
  # used as fallback echo
  shift
  cat <<_LT_EOF
[$]*
_LT_EOF
  exit 0
fi

# The HP-UX ksh and POSIX shell print the target directory to stdout
# if CDPATH is set.
(unset CDPATH) >/dev/null 2>&1 && unset CDPATH

if test -z "$lt_ECHO"; then
  if test "X${echo_test_string+set}" != Xset; then
    # find a string as large as possible, as long as the shell can cope with it
    for cmd in 'sed 50q "[$]0"' 'sed 20q "[$]0"' 'sed 10q "[$]0"' 'sed 2q "[$]0"' 'echo test'; do
      # expected sizes: less than 2Kb, 1Kb, 512 bytes, 16 bytes, ...
      if { echo_test_string=`eval $cmd`; } 2>/dev/null &&
	 { test "X$echo_test_string" = "X$echo_test_string"; } 2>/dev/null
      then
        break
      fi
    done
  fi

  if test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' &&
     echo_testing_string=`{ $ECHO "$echo_test_string"; } 2>/dev/null` &&
     test "X$echo_testing_string" = "X$echo_test_string"; then
    :
  else
    # The Solaris, AIX, and Digital Unix default echo programs unquote
    # backslashes.  This makes it impossible to quote backslashes using
    #   echo "$something" | sed 's/\\/\\\\/g'
    #
    # So, first we look for a working echo in the user's PATH.

    lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
    for dir in $PATH /usr/ucb; do
      IFS="$lt_save_ifs"
      if (test -f $dir/echo || test -f $dir/echo$ac_exeext) &&
         test "X`($dir/echo '\t') 2>/dev/null`" = 'X\t' &&
         echo_testing_string=`($dir/echo "$echo_test_string") 2>/dev/null` &&
         test "X$echo_testing_string" = "X$echo_test_string"; then
        ECHO="$dir/echo"
        break
      fi
    done
    IFS="$lt_save_ifs"

    if test "X$ECHO" = Xecho; then
      # We didn't find a better echo, so look for alternatives.
      if test "X`{ print -r '\t'; } 2>/dev/null`" = 'X\t' &&
         echo_testing_string=`{ print -r "$echo_test_string"; } 2>/dev/null` &&
         test "X$echo_testing_string" = "X$echo_test_string"; then
        # This shell has a builtin print -r that does the trick.
        ECHO='print -r'
      elif { test -f /bin/ksh || test -f /bin/ksh$ac_exeext; } &&
	   test "X$CONFIG_SHELL" != X/bin/ksh; then
        # If we have ksh, try running configure again with it.
        ORIGINAL_CONFIG_SHELL=${CONFIG_SHELL-/bin/sh}
        export ORIGINAL_CONFIG_SHELL
        CONFIG_SHELL=/bin/ksh
        export CONFIG_SHELL
        exec $CONFIG_SHELL "[$]0" --no-reexec ${1+"[$]@"}
      else
        # Try using printf.
        ECHO='printf %s\n'
        if test "X`{ $ECHO '\t'; } 2>/dev/null`" = 'X\t' &&
	   echo_testing_string=`{ $ECHO "$echo_test_string"; } 2>/dev/null` &&
	   test "X$echo_testing_string" = "X$echo_test_string"; then
	  # Cool, printf works
	  :
        elif echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
	     test "X$echo_testing_string" = 'X\t' &&
	     echo_testing_string=`($ORIGINAL_CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
	     test "X$echo_testing_string" = "X$echo_test_string"; then
	  CONFIG_SHELL=$ORIGINAL_CONFIG_SHELL
	  export CONFIG_SHELL
	  SHELL="$CONFIG_SHELL"
	  export SHELL
	  ECHO="$CONFIG_SHELL [$]0 --fallback-echo"
        elif echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo '\t') 2>/dev/null` &&
	     test "X$echo_testing_string" = 'X\t' &&
	     echo_testing_string=`($CONFIG_SHELL "[$]0" --fallback-echo "$echo_test_string") 2>/dev/null` &&
	     test "X$echo_testing_string" = "X$echo_test_string"; then
	  ECHO="$CONFIG_SHELL [$]0 --fallback-echo"
        else
	  # maybe with a smaller string...
	  prev=:

	  for cmd in 'echo test' 'sed 2q "[$]0"' 'sed 10q "[$]0"' 'sed 20q "[$]0"' 'sed 50q "[$]0"'; do
	    if { test "X$echo_test_string" = "X`eval $cmd`"; } 2>/dev/null
	    then
	      break
	    fi
	    prev="$cmd"
	  done

	  if test "$prev" != 'sed 50q "[$]0"'; then
	    echo_test_string=`eval $prev`
	    export echo_test_string
	    exec ${ORIGINAL_CONFIG_SHELL-${CONFIG_SHELL-/bin/sh}} "[$]0" ${1+"[$]@"}
	  else
	    # Oops.  We lost completely, so just stick with echo.
	    ECHO=echo
	  fi
        fi
      fi
    fi
  fi
fi

# Copy echo and quote the copy suitably for passing to libtool from
# the Makefile, instead of quoting the original, which is used later.
lt_ECHO=$ECHO
if test "X$lt_ECHO" = "X$CONFIG_SHELL [$]0 --fallback-echo"; then
   lt_ECHO="$CONFIG_SHELL \\\$\[$]0 --fallback-echo"
fi

AC_SUBST(lt_ECHO)
])
_LT_DECL([], [SHELL], [1], [Shell to use when invoking shell scripts])
_LT_DECL([], [ECHO], [1],
    [An echo program that does not interpret backslashes])
])# _LT_PROG_ECHO_BACKSLASH


# _LT_ENABLE_LOCK
# ---------------
m4_defun([_LT_ENABLE_LOCK],
[AC_ARG_ENABLE([libtool-lock],
  [AS_HELP_STRING([--disable-libtool-lock],
    [avoid locking (might break parallel builds)])])
test "x$enable_libtool_lock" != xno && enable_libtool_lock=yes

# Some flags need to be propagated to the compiler or linker for good
# libtool support.
case $host in
ia64-*-hpux*)
  # Find out which ABI we are using.
  echo 'int i;' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case `/usr/bin/file conftest.$ac_objext` in
      *ELF-32*)
	HPUX_IA64_MODE="32"
	;;
      *ELF-64*)
	HPUX_IA64_MODE="64"
	;;
    esac
  fi
  rm -rf conftest*
  ;;
*-*-irix6*)
  # Find out which ABI we are using.
  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    if test "$lt_cv_prog_gnu_ld" = yes; then
      case `/usr/bin/file conftest.$ac_objext` in
	*32-bit*)
	  LD="${LD-ld} -melf32bsmip"
	  ;;
	*N32*)
	  LD="${LD-ld} -melf32bmipn32"
	  ;;
	*64-bit*)
	  LD="${LD-ld} -melf64bmip"
	;;
      esac
    else
      case `/usr/bin/file conftest.$ac_objext` in
	*32-bit*)
	  LD="${LD-ld} -32"
	  ;;
	*N32*)
	  LD="${LD-ld} -n32"
	  ;;
	*64-bit*)
	  LD="${LD-ld} -64"
	  ;;
      esac
    fi
  fi
  rm -rf conftest*
  ;;

x86_64-*kfreebsd*-gnu|x86_64-*linux*|ppc*-*linux*|powerpc*-*linux*| \
s390*-*linux*|s390*-*tpf*|sparc*-*linux*)
  # Find out which ABI we are using.
  echo 'int i;' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case `/usr/bin/file conftest.o` in
      *32-bit*)
	case $host in
	  x86_64-*kfreebsd*-gnu)
	    LD="${LD-ld} -m elf_i386_fbsd"
	    ;;
	  x86_64-*linux*)
	    LD="${LD-ld} -m elf_i386"
	    ;;
	  ppc64-*linux*|powerpc64-*linux*)
	    LD="${LD-ld} -m elf32ppclinux"
	    ;;
	  s390x-*linux*)
	    LD="${LD-ld} -m elf_s390"
	    ;;
	  sparc64-*linux*)
	    LD="${LD-ld} -m elf32_sparc"
	    ;;
	esac
	;;
      *64-bit*)
	case $host in
	  x86_64-*kfreebsd*-gnu)
	    LD="${LD-ld} -m elf_x86_64_fbsd"
	    ;;
	  x86_64-*linux*)
	    LD="${LD-ld} -m elf_x86_64"
	    ;;
	  ppc*-*linux*|powerpc*-*linux*)
	    LD="${LD-ld} -m elf64ppc"
	    ;;
	  s390*-*linux*|s390*-*tpf*)
	    LD="${LD-ld} -m elf64_s390"
	    ;;
	  sparc*-*linux*)
	    LD="${LD-ld} -m elf64_sparc"
	    ;;
	esac
	;;
    esac
  fi
  rm -rf conftest*
  ;;

*-*-sco3.2v5*)
  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
  SAVE_CFLAGS="$CFLAGS"
  CFLAGS="$CFLAGS -belf"
  AC_CACHE_CHECK([whether the C compiler needs -belf], lt_cv_cc_needs_belf,
    [AC_LANG_PUSH(C)
     AC_LINK_IFELSE([AC_LANG_PROGRAM([[]],[[]])],[lt_cv_cc_needs_belf=yes],[lt_cv_cc_needs_belf=no])
     AC_LANG_POP])
  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
    CFLAGS="$SAVE_CFLAGS"
  fi
  ;;
sparc*-*solaris*)
  # Find out which ABI we are using.
  echo 'int i;' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case `/usr/bin/file conftest.o` in
    *64-bit*)
      case $lt_cv_prog_gnu_ld in
      yes*) LD="${LD-ld} -m elf64_sparc" ;;
      *)
	if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; then
	  LD="${LD-ld} -64"
	fi
	;;
      esac
      ;;
    esac
  fi
  rm -rf conftest*
  ;;
esac

need_locks="$enable_libtool_lock"
])# _LT_ENABLE_LOCK


# _LT_CMD_OLD_ARCHIVE
# -------------------
m4_defun([_LT_CMD_OLD_ARCHIVE],
[AC_CHECK_TOOL(AR, ar, false)
test -z "$AR" && AR=ar
test -z "$AR_FLAGS" && AR_FLAGS=cru
_LT_DECL([], [AR], [1], [The archiver])
_LT_DECL([], [AR_FLAGS], [1])

AC_CHECK_TOOL(STRIP, strip, :)
test -z "$STRIP" && STRIP=:
_LT_DECL([], [STRIP], [1], [A symbol stripping program])

AC_CHECK_TOOL(RANLIB, ranlib, :)
test -z "$RANLIB" && RANLIB=:
_LT_DECL([], [RANLIB], [1],
    [Commands used to install an old-style archive])

# Determine commands to create old-style static archives.
old_archive_cmds='$AR $AR_FLAGS $oldlib$oldobjs'
old_postinstall_cmds='chmod 644 $oldlib'
old_postuninstall_cmds=

if test -n "$RANLIB"; then
  case $host_os in
  openbsd*)
    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB -t \$oldlib"
    ;;
  *)
    old_postinstall_cmds="$old_postinstall_cmds~\$RANLIB \$oldlib"
    ;;
  esac
  old_archive_cmds="$old_archive_cmds~\$RANLIB \$oldlib"
fi
_LT_DECL([], [old_postinstall_cmds], [2])
_LT_DECL([], [old_postuninstall_cmds], [2])
_LT_TAGDECL([], [old_archive_cmds], [2],
    [Commands used to build an old-style archive])
])# _LT_CMD_OLD_ARCHIVE


# _LT_COMPILER_OPTION(MESSAGE, VARIABLE-NAME, FLAGS,
#		[OUTPUT-FILE], [ACTION-SUCCESS], [ACTION-FAILURE])
# ----------------------------------------------------------------
# Check whether the given compiler option works
AC_DEFUN([_LT_COMPILER_OPTION],
[m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_DECL_SED])dnl
AC_CACHE_CHECK([$1], [$2],
  [$2=no
   m4_if([$4], , [ac_outfile=conftest.$ac_objext], [ac_outfile=$4])
   echo "$lt_simple_compile_test_code" > conftest.$ac_ext
   lt_compiler_flag="$3"
   # Insert the option either (1) after the last *FLAGS variable, or
   # (2) before a word containing "conftest.", or (3) at the end.
   # Note that $ac_compile itself does not contain backslashes and begins
   # with a dollar sign (not a hyphen), so the echo should work correctly.
   # The option is referenced via a variable to avoid confusing sed.
   lt_compile=`echo "$ac_compile" | $SED \
   -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
   -e 's: [[^ ]]*conftest\.: $lt_compiler_flag&:; t' \
   -e 's:$: $lt_compiler_flag:'`
   (eval echo "\"\$as_me:__oline__: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
   (eval "$lt_compile" 2>conftest.err)
   ac_status=$?
   cat conftest.err >&AS_MESSAGE_LOG_FD
   echo "$as_me:__oline__: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
   if (exit $ac_status) && test -s "$ac_outfile"; then
     # The compiler can only warn and ignore the option if not recognized
     # So say no if there are warnings other than the usual output.
     $ECHO "X$_lt_compiler_boilerplate" | $Xsed -e '/^$/d' >conftest.exp
     $SED '/^$/d; /^ *+/d' conftest.err >conftest.er2
     if test ! -s conftest.er2 || diff conftest.exp conftest.er2 >/dev/null; then
       $2=yes
     fi
   fi
   $RM conftest*
])

if test x"[$]$2" = xyes; then
    m4_if([$5], , :, [$5])
else
    m4_if([$6], , :, [$6])
fi
])# _LT_COMPILER_OPTION

# Old name:
AU_ALIAS([AC_LIBTOOL_COMPILER_OPTION], [_LT_COMPILER_OPTION])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_COMPILER_OPTION], [])


# _LT_LINKER_OPTION(MESSAGE, VARIABLE-NAME, FLAGS,
#                  [ACTION-SUCCESS], [ACTION-FAILURE])
# ----------------------------------------------------
# Check whether the given linker option works
AC_DEFUN([_LT_LINKER_OPTION],
[m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_DECL_SED])dnl
AC_CACHE_CHECK([$1], [$2],
  [$2=no
   save_LDFLAGS="$LDFLAGS"
   LDFLAGS="$LDFLAGS $3"
   echo "$lt_simple_link_test_code" > conftest.$ac_ext
   if (eval $ac_link 2>conftest.err) && test -s conftest$ac_exeext; then
     # The linker can only warn and ignore the option if not recognized
     # So say no if there are warnings
     if test -s conftest.err; then
       # Append any errors to the config.log.
       cat conftest.err 1>&AS_MESSAGE_LOG_FD
       $ECHO "X$_lt_linker_boilerplate" | $Xsed -e '/^$/d' > conftest.exp
       $SED '/^$/d; /^ *+/d' conftest.err >conftest.er2
       if diff conftest.exp conftest.er2 >/dev/null; then
         $2=yes
       fi
     else
       $2=yes
     fi
   fi
   $RM -r conftest*
   LDFLAGS="$save_LDFLAGS"
])

if test x"[$]$2" = xyes; then
    m4_if([$4], , :, [$4])
else
    m4_if([$5], , :, [$5])
fi
])# _LT_LINKER_OPTION

# Old name:
AU_ALIAS([AC_LIBTOOL_LINKER_OPTION], [_LT_LINKER_OPTION])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_LINKER_OPTION], [])


# LT_CMD_MAX_LEN
#---------------
AC_DEFUN([LT_CMD_MAX_LEN],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
# find the maximum length of command line arguments
AC_MSG_CHECKING([the maximum length of command line arguments])
AC_CACHE_VAL([lt_cv_sys_max_cmd_len], [dnl
  i=0
  teststring="ABCD"

  case $build_os in
  msdosdjgpp*)
    # On DJGPP, this test can blow up pretty badly due to problems in libc
    # (any single argument exceeding 2000 bytes causes a buffer overrun
    # during glob expansion).  Even if it were fixed, the result of this
    # check would be larger than it should be.
    lt_cv_sys_max_cmd_len=12288;    # 12K is about right
    ;;

  gnu*)
    # Under GNU Hurd, this test is not required because there is
    # no limit to the length of command line arguments.
    # Libtool will interpret -1 as no limit whatsoever
    lt_cv_sys_max_cmd_len=-1;
    ;;

  cygwin* | mingw*)
    # On Win9x/ME, this test blows up -- it succeeds, but takes
    # about 5 minutes as the teststring grows exponentially.
    # Worse, since 9x/ME are not pre-emptively multitasking,
    # you end up with a "frozen" computer, even though with patience
    # the test eventually succeeds (with a max line length of 256k).
    # Instead, let's just punt: use the minimum linelength reported by
    # all of the supported platforms: 8192 (on NT/2K/XP).
    lt_cv_sys_max_cmd_len=8192;
    ;;

  amigaos*)
    # On AmigaOS with pdksh, this test takes hours, literally.
    # So we just punt and use a minimum line length of 8192.
    lt_cv_sys_max_cmd_len=8192;
    ;;

  netbsd* | freebsd* | openbsd* | darwin* | dragonfly*)
    # This has been around since 386BSD, at least.  Likely further.
    if test -x /sbin/sysctl; then
      lt_cv_sys_max_cmd_len=`/sbin/sysctl -n kern.argmax`
    elif test -x /usr/sbin/sysctl; then
      lt_cv_sys_max_cmd_len=`/usr/sbin/sysctl -n kern.argmax`
    else
      lt_cv_sys_max_cmd_len=65536	# usable default for all BSDs
    fi
    # And add a safety zone
    lt_cv_sys_max_cmd_len=`expr $lt_cv_sys_max_cmd_len \/ 4`
    lt_cv_sys_max_cmd_len=`expr $lt_cv_sys_max_cmd_len \* 3`
    ;;

  interix*)
    # We know the value 262144 and hardcode it with a safety zone (like BSD)
    lt_cv_sys_max_cmd_len=196608
    ;;

  osf*)
    # Dr. Hans Ekkehard Plesser reports seeing a kernel panic running configure
    # due to this test when exec_disable_arg_limit is 1 on Tru64. It is not
    # nice to cause kernel panics so lets avoid the loop below.
    # First set a reasonable default.
    lt_cv_sys_max_cmd_len=16384
    #
    if test -x /sbin/sysconfig; then
      case `/sbin/sysconfig -q proc exec_disable_arg_limit` in
        *1*) lt_cv_sys_max_cmd_len=-1 ;;
      esac
    fi
    ;;
  sco3.2v5*)
    lt_cv_sys_max_cmd_len=102400
    ;;
  sysv5* | sco5v6* | sysv4.2uw2*)
    kargmax=`grep ARG_MAX /etc/conf/cf.d/stune 2>/dev/null`
    if test -n "$kargmax"; then
      lt_cv_sys_max_cmd_len=`echo $kargmax | sed 's/.*[[	 ]]//'`
    else
      lt_cv_sys_max_cmd_len=32768
    fi
    ;;
  *)
    lt_cv_sys_max_cmd_len=`(getconf ARG_MAX) 2> /dev/null`
    if test -n "$lt_cv_sys_max_cmd_len"; then
      lt_cv_sys_max_cmd_len=`expr $lt_cv_sys_max_cmd_len \/ 4`
      lt_cv_sys_max_cmd_len=`expr $lt_cv_sys_max_cmd_len \* 3`
    else
      # Make teststring a little bigger before we do anything with it.
      # a 1K string should be a reasonable start.
      for i in 1 2 3 4 5 6 7 8 ; do
        teststring=$teststring$teststring
      done
      SHELL=${SHELL-${CONFIG_SHELL-/bin/sh}}
      # If test is not a shell built-in, we'll probably end up computing a
      # maximum length that is only half of the actual maximum length, but
      # we can't tell.
      while { test "X"`$SHELL [$]0 --fallback-echo "X$teststring$teststring" 2>/dev/null` \
	         = "XX$teststring$teststring"; } >/dev/null 2>&1 &&
	      test $i != 17 # 1/2 MB should be enough
      do
        i=`expr $i + 1`
        teststring=$teststring$teststring
      done
      # Only check the string length outside the loop.
      lt_cv_sys_max_cmd_len=`expr "X$teststring" : ".*" 2>&1`
      teststring=
      # Add a significant safety factor because C++ compilers can tack on
      # massive amounts of additional arguments before passing them to the
      # linker.  It appears as though 1/2 is a usable value.
      lt_cv_sys_max_cmd_len=`expr $lt_cv_sys_max_cmd_len \/ 2`
    fi
    ;;
  esac
])
if test -n $lt_cv_sys_max_cmd_len ; then
  AC_MSG_RESULT($lt_cv_sys_max_cmd_len)
else
  AC_MSG_RESULT(none)
fi
max_cmd_len=$lt_cv_sys_max_cmd_len
_LT_DECL([], [max_cmd_len], [0],
    [What is the maximum length of a command?])
])# LT_CMD_MAX_LEN

# Old name:
AU_ALIAS([AC_LIBTOOL_SYS_MAX_CMD_LEN], [LT_CMD_MAX_LEN])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_SYS_MAX_CMD_LEN], [])


# _LT_HEADER_DLFCN
# ----------------
m4_defun([_LT_HEADER_DLFCN],
[AC_CHECK_HEADERS([dlfcn.h], [], [], [AC_INCLUDES_DEFAULT])dnl
])# _LT_HEADER_DLFCN


# _LT_TRY_DLOPEN_SELF (ACTION-IF-TRUE, ACTION-IF-TRUE-W-USCORE,
#                      ACTION-IF-FALSE, ACTION-IF-CROSS-COMPILING)
# ----------------------------------------------------------------
m4_defun([_LT_TRY_DLOPEN_SELF],
[m4_require([_LT_HEADER_DLFCN])dnl
if test "$cross_compiling" = yes; then :
  [$4]
else
  lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
  lt_status=$lt_dlunknown
  cat > conftest.$ac_ext <<_LT_EOF
[#line __oline__ "configure"
#include "confdefs.h"

#if HAVE_DLFCN_H
#include <dlfcn.h>
#endif

#include <stdio.h>

#ifdef RTLD_GLOBAL
#  define LT_DLGLOBAL		RTLD_GLOBAL
#else
#  ifdef DL_GLOBAL
#    define LT_DLGLOBAL		DL_GLOBAL
#  else
#    define LT_DLGLOBAL		0
#  endif
#endif

/* We may have to define LT_DLLAZY_OR_NOW in the command line if we
   find out it does not work in some platform. */
#ifndef LT_DLLAZY_OR_NOW
#  ifdef RTLD_LAZY
#    define LT_DLLAZY_OR_NOW		RTLD_LAZY
#  else
#    ifdef DL_LAZY
#      define LT_DLLAZY_OR_NOW		DL_LAZY
#    else
#      ifdef RTLD_NOW
#        define LT_DLLAZY_OR_NOW	RTLD_NOW
#      else
#        ifdef DL_NOW
#          define LT_DLLAZY_OR_NOW	DL_NOW
#        else
#          define LT_DLLAZY_OR_NOW	0
#        endif
#      endif
#    endif
#  endif
#endif

#ifdef __cplusplus
extern "C" void exit (int);
#endif

void fnord() { int i=42;}
int main ()
{
  void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
  int status = $lt_dlunknown;

  if (self)
    {
      if (dlsym (self,"fnord"))       status = $lt_dlno_uscore;
      else if (dlsym( self,"_fnord")) status = $lt_dlneed_uscore;
      /* dlclose (self); */
    }
  else
    puts (dlerror ());

    exit (status);
}]
_LT_EOF
  if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext} 2>/dev/null; then
    (./conftest; exit; ) >&AS_MESSAGE_LOG_FD 2>/dev/null
    lt_status=$?
    case x$lt_status in
      x$lt_dlno_uscore) $1 ;;
      x$lt_dlneed_uscore) $2 ;;
      x$lt_dlunknown|x*) $3 ;;
    esac
  else :
    # compilation failed
    $3
  fi
fi
rm -fr conftest*
])# _LT_TRY_DLOPEN_SELF


# LT_SYS_DLOPEN_SELF
# ------------------
AC_DEFUN([LT_SYS_DLOPEN_SELF],
[m4_require([_LT_HEADER_DLFCN])dnl
if test "x$enable_dlopen" != xyes; then
  enable_dlopen=unknown
  enable_dlopen_self=unknown
  enable_dlopen_self_static=unknown
else
  lt_cv_dlopen=no
  lt_cv_dlopen_libs=

  case $host_os in
  beos*)
    lt_cv_dlopen="load_add_on"
    lt_cv_dlopen_libs=
    lt_cv_dlopen_self=yes
    ;;

  mingw* | pw32*)
    lt_cv_dlopen="LoadLibrary"
    lt_cv_dlopen_libs=
    ;;

  cygwin*)
    lt_cv_dlopen="dlopen"
    lt_cv_dlopen_libs=
    ;;

  darwin*)
  # if libdl is installed we need to link against it
    AC_CHECK_LIB([dl], [dlopen],
		[lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-ldl"],[
    lt_cv_dlopen="dyld"
    lt_cv_dlopen_libs=
    lt_cv_dlopen_self=yes
    ])
    ;;

  *)
    AC_CHECK_FUNC([shl_load],
	  [lt_cv_dlopen="shl_load"],
      [AC_CHECK_LIB([dld], [shl_load],
	    [lt_cv_dlopen="shl_load" lt_cv_dlopen_libs="-ldld"],
	[AC_CHECK_FUNC([dlopen],
	      [lt_cv_dlopen="dlopen"],
	  [AC_CHECK_LIB([dl], [dlopen],
		[lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-ldl"],
	    [AC_CHECK_LIB([svld], [dlopen],
		  [lt_cv_dlopen="dlopen" lt_cv_dlopen_libs="-lsvld"],
	      [AC_CHECK_LIB([dld], [dld_link],
		    [lt_cv_dlopen="dld_link" lt_cv_dlopen_libs="-ldld"])
	      ])
	    ])
	  ])
	])
      ])
    ;;
  esac

  if test "x$lt_cv_dlopen" != xno; then
    enable_dlopen=yes
  else
    enable_dlopen=no
  fi

  case $lt_cv_dlopen in
  dlopen)
    save_CPPFLAGS="$CPPFLAGS"
    test "x$ac_cv_header_dlfcn_h" = xyes && CPPFLAGS="$CPPFLAGS -DHAVE_DLFCN_H"

    save_LDFLAGS="$LDFLAGS"
    wl=$lt_prog_compiler_wl eval LDFLAGS=\"\$LDFLAGS $export_dynamic_flag_spec\"

    save_LIBS="$LIBS"
    LIBS="$lt_cv_dlopen_libs $LIBS"

    AC_CACHE_CHECK([whether a program can dlopen itself],
	  lt_cv_dlopen_self, [dnl
	  _LT_TRY_DLOPEN_SELF(
	    lt_cv_dlopen_self=yes, lt_cv_dlopen_self=yes,
	    lt_cv_dlopen_self=no, lt_cv_dlopen_self=cross)
    ])

    if test "x$lt_cv_dlopen_self" = xyes; then
      wl=$lt_prog_compiler_wl eval LDFLAGS=\"\$LDFLAGS $lt_prog_compiler_static\"
      AC_CACHE_CHECK([whether a statically linked program can dlopen itself],
	  lt_cv_dlopen_self_static, [dnl
	  _LT_TRY_DLOPEN_SELF(
	    lt_cv_dlopen_self_static=yes, lt_cv_dlopen_self_static=yes,
	    lt_cv_dlopen_self_static=no,  lt_cv_dlopen_self_static=cross)
      ])
    fi

    CPPFLAGS="$save_CPPFLAGS"
    LDFLAGS="$save_LDFLAGS"
    LIBS="$save_LIBS"
    ;;
  esac

  case $lt_cv_dlopen_self in
  yes|no) enable_dlopen_self=$lt_cv_dlopen_self ;;
  *) enable_dlopen_self=unknown ;;
  esac

  case $lt_cv_dlopen_self_static in
  yes|no) enable_dlopen_self_static=$lt_cv_dlopen_self_static ;;
  *) enable_dlopen_self_static=unknown ;;
  esac
fi
_LT_DECL([dlopen_support], [enable_dlopen], [0],
	 [Whether dlopen is supported])
_LT_DECL([dlopen_self], [enable_dlopen_self], [0],
	 [Whether dlopen of programs is supported])
_LT_DECL([dlopen_self_static], [enable_dlopen_self_static], [0],
	 [Whether dlopen of statically linked programs is supported])
])# LT_SYS_DLOPEN_SELF

# Old name:
AU_ALIAS([AC_LIBTOOL_DLOPEN_SELF], [LT_SYS_DLOPEN_SELF])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_DLOPEN_SELF], [])


# _LT_COMPILER_C_O([TAGNAME])
# ---------------------------
# Check to see if options -c and -o are simultaneously supported by compiler.
# This macro does not hard code the compiler like AC_PROG_CC_C_O.
m4_defun([_LT_COMPILER_C_O],
[m4_require([_LT_DECL_SED])dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_TAG_COMPILER])dnl
AC_CACHE_CHECK([if $compiler supports -c -o file.$ac_objext],
  [_LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)],
  [_LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)=no
   $RM -r conftest 2>/dev/null
   mkdir conftest
   cd conftest
   mkdir out
   echo "$lt_simple_compile_test_code" > conftest.$ac_ext

   lt_compiler_flag="-o out/conftest2.$ac_objext"
   # Insert the option either (1) after the last *FLAGS variable, or
   # (2) before a word containing "conftest.", or (3) at the end.
   # Note that $ac_compile itself does not contain backslashes and begins
   # with a dollar sign (not a hyphen), so the echo should work correctly.
   lt_compile=`echo "$ac_compile" | $SED \
   -e 's:.*FLAGS}\{0,1\} :&$lt_compiler_flag :; t' \
   -e 's: [[^ ]]*conftest\.: $lt_compiler_flag&:; t' \
   -e 's:$: $lt_compiler_flag:'`
   (eval echo "\"\$as_me:__oline__: $lt_compile\"" >&AS_MESSAGE_LOG_FD)
   (eval "$lt_compile" 2>out/conftest.err)
   ac_status=$?
   cat out/conftest.err >&AS_MESSAGE_LOG_FD
   echo "$as_me:__oline__: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
   if (exit $ac_status) && test -s out/conftest2.$ac_objext
   then
     # The compiler can only warn and ignore the option if not recognized
     # So say no if there are warnings
     $ECHO "X$_lt_compiler_boilerplate" | $Xsed -e '/^$/d' > out/conftest.exp
     $SED '/^$/d; /^ *+/d' out/conftest.err >out/conftest.er2
     if test ! -s out/conftest.er2 || diff out/conftest.exp out/conftest.er2 >/dev/null; then
       _LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)=yes
     fi
   fi
   chmod u+w . 2>&AS_MESSAGE_LOG_FD
   $RM conftest*
   # SGI C++ compiler will create directory out/ii_files/ for
   # template instantiation
   test -d out/ii_files && $RM out/ii_files/* && rmdir out/ii_files
   $RM out/* && rmdir out
   cd ..
   $RM -r conftest
   $RM conftest*
])
_LT_TAGDECL([compiler_c_o], [lt_cv_prog_compiler_c_o], [1],
	[Does compiler simultaneously support -c and -o options?])
])# _LT_COMPILER_C_O


# _LT_COMPILER_FILE_LOCKS([TAGNAME])
# ----------------------------------
# Check to see if we can do hard links to lock some files if needed
m4_defun([_LT_COMPILER_FILE_LOCKS],
[m4_require([_LT_ENABLE_LOCK])dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
_LT_COMPILER_C_O([$1])

hard_links="nottested"
if test "$_LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)" = no && test "$need_locks" != no; then
  # do not overwrite the value of need_locks provided by the user
  AC_MSG_CHECKING([if we can lock with hard links])
  hard_links=yes
  $RM conftest*
  ln conftest.a conftest.b 2>/dev/null && hard_links=no
  touch conftest.a
  ln conftest.a conftest.b 2>&5 || hard_links=no
  ln conftest.a conftest.b 2>/dev/null && hard_links=no
  AC_MSG_RESULT([$hard_links])
  if test "$hard_links" = no; then
    AC_MSG_WARN([`$CC' does not support `-c -o', so `make -j' may be unsafe])
    need_locks=warn
  fi
else
  need_locks=no
fi
_LT_DECL([], [need_locks], [1], [Must we lock files when doing compilation?])
])# _LT_COMPILER_FILE_LOCKS


# _LT_CHECK_OBJDIR
# ----------------
m4_defun([_LT_CHECK_OBJDIR],
[AC_CACHE_CHECK([for objdir], [lt_cv_objdir],
[rm -f .libs 2>/dev/null
mkdir .libs 2>/dev/null
if test -d .libs; then
  lt_cv_objdir=.libs
else
  # MS-DOS does not allow filenames that begin with a dot.
  lt_cv_objdir=_libs
fi
rmdir .libs 2>/dev/null])
objdir=$lt_cv_objdir
_LT_DECL([], [objdir], [0],
         [The name of the directory that contains temporary libtool files])dnl
m4_pattern_allow([LT_OBJDIR])dnl
AC_DEFINE_UNQUOTED(LT_OBJDIR, "$lt_cv_objdir/",
  [Define to the sub-directory in which libtool stores uninstalled libraries.])
])# _LT_CHECK_OBJDIR


# _LT_LINKER_HARDCODE_LIBPATH([TAGNAME])
# --------------------------------------
# Check hardcoding attributes.
m4_defun([_LT_LINKER_HARDCODE_LIBPATH],
[AC_MSG_CHECKING([how to hardcode library paths into programs])
_LT_TAGVAR(hardcode_action, $1)=
if test -n "$_LT_TAGVAR(hardcode_libdir_flag_spec, $1)" ||
   test -n "$_LT_TAGVAR(runpath_var, $1)" ||
   test "X$_LT_TAGVAR(hardcode_automatic, $1)" = "Xyes" ; then

  # We can hardcode non-existent directories.
  if test "$_LT_TAGVAR(hardcode_direct, $1)" != no &&
     # If the only mechanism to avoid hardcoding is shlibpath_var, we
     # have to relink, otherwise we might link with an installed library
     # when we should be linking with a yet-to-be-installed one
     ## test "$_LT_TAGVAR(hardcode_shlibpath_var, $1)" != no &&
     test "$_LT_TAGVAR(hardcode_minus_L, $1)" != no; then
    # Linking always hardcodes the temporary library directory.
    _LT_TAGVAR(hardcode_action, $1)=relink
  else
    # We can link without hardcoding, and we can hardcode nonexisting dirs.
    _LT_TAGVAR(hardcode_action, $1)=immediate
  fi
else
  # We cannot hardcode anything, or else we can only hardcode existing
  # directories.
  _LT_TAGVAR(hardcode_action, $1)=unsupported
fi
AC_MSG_RESULT([$_LT_TAGVAR(hardcode_action, $1)])

if test "$_LT_TAGVAR(hardcode_action, $1)" = relink ||
   test "$_LT_TAGVAR(inherit_rpath, $1)" = yes; then
  # Fast installation is not supported
  enable_fast_install=no
elif test "$shlibpath_overrides_runpath" = yes ||
     test "$enable_shared" = no; then
  # Fast installation is not necessary
  enable_fast_install=needless
fi
_LT_TAGDECL([], [hardcode_action], [0],
    [How to hardcode a shared library path into an executable])
])# _LT_LINKER_HARDCODE_LIBPATH


# _LT_CMD_STRIPLIB
# ----------------
m4_defun([_LT_CMD_STRIPLIB],
[m4_require([_LT_DECL_EGREP])
striplib=
old_striplib=
AC_MSG_CHECKING([whether stripping libraries is possible])
if test -n "$STRIP" && $STRIP -V 2>&1 | $GREP "GNU strip" >/dev/null; then
  test -z "$old_striplib" && old_striplib="$STRIP --strip-debug"
  test -z "$striplib" && striplib="$STRIP --strip-unneeded"
  AC_MSG_RESULT([yes])
else
# FIXME - insert some real tests, host_os isn't really good enough
  case $host_os in
  darwin*)
    if test -n "$STRIP" ; then
      striplib="$STRIP -x"
      old_striplib="$STRIP -S"
      AC_MSG_RESULT([yes])
    else
      AC_MSG_RESULT([no])
    fi
    ;;
  *)
    AC_MSG_RESULT([no])
    ;;
  esac
fi
_LT_DECL([], [old_striplib], [1], [Commands to strip libraries])
_LT_DECL([], [striplib], [1])
])# _LT_CMD_STRIPLIB


# _LT_SYS_DYNAMIC_LINKER([TAG])
# -----------------------------
# PORTME Fill in your ld.so characteristics
m4_defun([_LT_SYS_DYNAMIC_LINKER],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
m4_require([_LT_DECL_EGREP])dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_DECL_SED])dnl
AC_MSG_CHECKING([dynamic linker characteristics])
m4_if([$1],
	[], [
if test "$GCC" = yes; then
  case $host_os in
    darwin*) lt_awk_arg="/^libraries:/,/LR/" ;;
    *) lt_awk_arg="/^libraries:/" ;;
  esac
  lt_search_path_spec=`$CC -print-search-dirs | awk $lt_awk_arg | $SED -e "s/^libraries://" -e "s,=/,/,g"`
  if $ECHO "$lt_search_path_spec" | $GREP ';' >/dev/null ; then
    # if the path contains ";" then we assume it to be the separator
    # otherwise default to the standard path separator (i.e. ":") - it is
    # assumed that no part of a normal pathname contains ";" but that should
    # okay in the real world where ";" in dirpaths is itself problematic.
    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED -e 's/;/ /g'`
  else
    lt_search_path_spec=`$ECHO "$lt_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
  fi
  # Ok, now we have the path, separated by spaces, we can step through it
  # and add multilib dir if necessary.
  lt_tmp_lt_search_path_spec=
  lt_multi_os_dir=`$CC $CPPFLAGS $CFLAGS $LDFLAGS -print-multi-os-directory 2>/dev/null`
  for lt_sys_path in $lt_search_path_spec; do
    if test -d "$lt_sys_path/$lt_multi_os_dir"; then
      lt_tmp_lt_search_path_spec="$lt_tmp_lt_search_path_spec $lt_sys_path/$lt_multi_os_dir"
    else
      test -d "$lt_sys_path" && \
	lt_tmp_lt_search_path_spec="$lt_tmp_lt_search_path_spec $lt_sys_path"
    fi
  done
  lt_search_path_spec=`$ECHO $lt_tmp_lt_search_path_spec | awk '
BEGIN {RS=" "; FS="/|\n";} {
  lt_foo="";
  lt_count=0;
  for (lt_i = NF; lt_i > 0; lt_i--) {
    if ($lt_i != "" && $lt_i != ".") {
      if ($lt_i == "..") {
        lt_count++;
      } else {
        if (lt_count == 0) {
          lt_foo="/" $lt_i lt_foo;
        } else {
          lt_count--;
        }
      }
    }
  }
  if (lt_foo != "") { lt_freq[[lt_foo]]++; }
  if (lt_freq[[lt_foo]] == 1) { print lt_foo; }
}'`
  sys_lib_search_path_spec=`$ECHO $lt_search_path_spec`
else
  sys_lib_search_path_spec="/lib /usr/lib /usr/local/lib"
fi])
library_names_spec=
libname_spec='lib$name'
soname_spec=
shrext_cmds=".so"
postinstall_cmds=
postuninstall_cmds=
finish_cmds=
finish_eval=
shlibpath_var=
shlibpath_overrides_runpath=unknown
version_type=none
dynamic_linker="$host_os ld.so"
sys_lib_dlsearch_path_spec="/lib /usr/lib"
need_lib_prefix=unknown
hardcode_into_libs=no

# when you set need_version to no, make sure it does not cause -set_version
# flags to be left without arguments
need_version=unknown

case $host_os in
aix3*)
  version_type=linux
  library_names_spec='${libname}${release}${shared_ext}$versuffix $libname.a'
  shlibpath_var=LIBPATH

  # AIX 3 has no versioning support, so we append a major version to the name.
  soname_spec='${libname}${release}${shared_ext}$major'
  ;;

aix[[4-9]]*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  hardcode_into_libs=yes
  if test "$host_cpu" = ia64; then
    # AIX 5 supports IA64
    library_names_spec='${libname}${release}${shared_ext}$major ${libname}${release}${shared_ext}$versuffix $libname${shared_ext}'
    shlibpath_var=LD_LIBRARY_PATH
  else
    # With GCC up to 2.95.x, collect2 would create an import file
    # for dependence libraries.  The import file would start with
    # the line `#! .'.  This would cause the generated library to
    # depend on `.', always an invalid library.  This was fixed in
    # development snapshots of GCC prior to 3.0.
    case $host_os in
      aix4 | aix4.[[01]] | aix4.[[01]].*)
      if { echo '#if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ >= 97)'
	   echo ' yes '
	   echo '#endif'; } | ${CC} -E - | $GREP yes > /dev/null; then
	:
      else
	can_build_shared=no
      fi
      ;;
    esac
    # AIX (on Power*) has no versioning support, so currently we can not hardcode correct
    # soname into executable. Probably we can add versioning support to
    # collect2, so additional links can be useful in future.
    if test "$aix_use_runtimelinking" = yes; then
      # If using run time linking (on AIX 4.2 or later) use lib<name>.so
      # instead of lib<name>.a to let people know that these are not
      # typical AIX shared libraries.
      library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
    else
      # We preserve .a as extension for shared libraries through AIX4.2
      # and later when we are not doing run time linking.
      library_names_spec='${libname}${release}.a $libname.a'
      soname_spec='${libname}${release}${shared_ext}$major'
    fi
    shlibpath_var=LIBPATH
  fi
  ;;

amigaos*)
  case $host_cpu in
  powerpc)
    # Since July 2007 AmigaOS4 officially supports .so libraries.
    # When compiling the executable, add -use-dynld -Lsobjs: to the compileline.
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
    ;;
  m68k)
    library_names_spec='$libname.ixlibrary $libname.a'
    # Create ${libname}_ixlibrary.a entries in /sys/libs.
    finish_eval='for lib in `ls $libdir/*.ixlibrary 2>/dev/null`; do libname=`$ECHO "X$lib" | $Xsed -e '\''s%^.*/\([[^/]]*\)\.ixlibrary$%\1%'\''`; test $RM /sys/libs/${libname}_ixlibrary.a; $show "cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a"; cd /sys/libs && $LN_S $lib ${libname}_ixlibrary.a || exit 1; done'
    ;;
  esac
  ;;

beos*)
  library_names_spec='${libname}${shared_ext}'
  dynamic_linker="$host_os ld.so"
  shlibpath_var=LIBRARY_PATH
  ;;

bsdi[[45]]*)
  version_type=linux
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  finish_cmds='PATH="\$PATH:/sbin" ldconfig $libdir'
  shlibpath_var=LD_LIBRARY_PATH
  sys_lib_search_path_spec="/shlib /usr/lib /usr/X11/lib /usr/contrib/lib /lib /usr/local/lib"
  sys_lib_dlsearch_path_spec="/shlib /usr/lib /usr/local/lib"
  # the default ld.so.conf also contains /usr/contrib/lib and
  # /usr/X11R6/lib (/usr/X11 is a link to /usr/X11R6), but let us allow
  # libtool to hard-code these into programs
  ;;

cygwin* | mingw* | pw32*)
  version_type=windows
  shrext_cmds=".dll"
  need_version=no
  need_lib_prefix=no

  case $GCC,$host_os in
  yes,cygwin* | yes,mingw* | yes,pw32*)
    library_names_spec='$libname.dll.a'
    # DLL is installed to $(libdir)/../bin by postinstall_cmds
    postinstall_cmds='base_file=`basename \${file}`~
      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
      dldir=$destdir/`dirname \$dlpath`~
      test -d \$dldir || mkdir -p \$dldir~
      $install_prog $dir/$dlname \$dldir/$dlname~
      chmod a+x \$dldir/$dlname~
      if test -n '\''$stripme'\'' && test -n '\''$striplib'\''; then
        eval '\''$striplib \$dldir/$dlname'\'' || exit \$?;
      fi'
    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
      dlpath=$dir/\$dldll~
       $RM \$dlpath'
    shlibpath_overrides_runpath=yes

    case $host_os in
    cygwin*)
      # Cygwin DLLs use 'cyg' prefix rather than 'lib'
      soname_spec='`echo ${libname} | sed -e 's/^lib/cyg/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
      sys_lib_search_path_spec="/usr/lib /lib/w32api /lib /usr/local/lib"
      ;;
    mingw*)
      # MinGW DLLs use traditional 'lib' prefix
      soname_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
      sys_lib_search_path_spec=`$CC -print-search-dirs | $GREP "^libraries:" | $SED -e "s/^libraries://" -e "s,=/,/,g"`
      if $ECHO "$sys_lib_search_path_spec" | [$GREP ';[c-zC-Z]:/' >/dev/null]; then
        # It is most probably a Windows format PATH printed by
        # mingw gcc, but we are running on Cygwin. Gcc prints its search
        # path with ; separators, and with drive letters. We can handle the
        # drive letters (cygwin fileutils understands them), so leave them,
        # especially as we might pass files found there to a mingw objdump,
        # which wouldn't understand a cygwinified path. Ahh.
        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
      else
        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED  -e "s/$PATH_SEPARATOR/ /g"`
      fi
      ;;
    pw32*)
      # pw32 DLLs use 'pw' prefix rather than 'lib'
      library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
      ;;
    esac
    ;;

  *)
    library_names_spec='${libname}`echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext} $libname.lib'
    ;;
  esac
  dynamic_linker='Win32 ld.exe'
  # FIXME: first we should search . and the directory the executable is in
  shlibpath_var=PATH
  ;;

darwin* | rhapsody*)
  dynamic_linker="$host_os dyld"
  version_type=darwin
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${major}$shared_ext ${libname}$shared_ext'
  soname_spec='${libname}${release}${major}$shared_ext'
  shlibpath_overrides_runpath=yes
  shlibpath_var=DYLD_LIBRARY_PATH
  shrext_cmds='`test .$module = .yes && echo .so || echo .dylib`'
m4_if([$1], [],[
  sys_lib_search_path_spec="$sys_lib_search_path_spec /usr/local/lib"])
  sys_lib_dlsearch_path_spec='/usr/local/lib /lib /usr/lib'
  ;;

dgux*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname$shared_ext'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  ;;

freebsd1*)
  dynamic_linker=no
  ;;

freebsd* | dragonfly*)
  # DragonFly does not have aout.  When/if they implement a new
  # versioning mechanism, adjust this.
  if test -x /usr/bin/objformat; then
    objformat=`/usr/bin/objformat`
  else
    case $host_os in
    freebsd[[123]]*) objformat=aout ;;
    *) objformat=elf ;;
    esac
  fi
  version_type=freebsd-$objformat
  case $version_type in
    freebsd-elf*)
      library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext} $libname${shared_ext}'
      need_version=no
      need_lib_prefix=no
      ;;
    freebsd-*)
      library_names_spec='${libname}${release}${shared_ext}$versuffix $libname${shared_ext}$versuffix'
      need_version=yes
      ;;
  esac
  shlibpath_var=LD_LIBRARY_PATH
  case $host_os in
  freebsd2*)
    shlibpath_overrides_runpath=yes
    ;;
  freebsd3.[[01]]* | freebsdelf3.[[01]]*)
    shlibpath_overrides_runpath=yes
    hardcode_into_libs=yes
    ;;
  freebsd3.[[2-9]]* | freebsdelf3.[[2-9]]* | \
  freebsd4.[[0-5]] | freebsdelf4.[[0-5]] | freebsd4.1.1 | freebsdelf4.1.1)
    shlibpath_overrides_runpath=no
    hardcode_into_libs=yes
    ;;
  *) # from 4.6 on, and DragonFly
    shlibpath_overrides_runpath=yes
    hardcode_into_libs=yes
    ;;
  esac
  ;;

gnu*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}${major} ${libname}${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  hardcode_into_libs=yes
  ;;

hpux9* | hpux10* | hpux11*)
  # Give a soname corresponding to the major version so that dld.sl refuses to
  # link against other versions.
  version_type=sunos
  need_lib_prefix=no
  need_version=no
  case $host_cpu in
  ia64*)
    shrext_cmds='.so'
    hardcode_into_libs=yes
    dynamic_linker="$host_os dld.so"
    shlibpath_var=LD_LIBRARY_PATH
    shlibpath_overrides_runpath=yes # Unless +noenvvar is specified.
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
    soname_spec='${libname}${release}${shared_ext}$major'
    if test "X$HPUX_IA64_MODE" = X32; then
      sys_lib_search_path_spec="/usr/lib/hpux32 /usr/local/lib/hpux32 /usr/local/lib"
    else
      sys_lib_search_path_spec="/usr/lib/hpux64 /usr/local/lib/hpux64"
    fi
    sys_lib_dlsearch_path_spec=$sys_lib_search_path_spec
    ;;
  hppa*64*)
    shrext_cmds='.sl'
    hardcode_into_libs=yes
    dynamic_linker="$host_os dld.sl"
    shlibpath_var=LD_LIBRARY_PATH # How should we handle SHLIB_PATH
    shlibpath_overrides_runpath=yes # Unless +noenvvar is specified.
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
    soname_spec='${libname}${release}${shared_ext}$major'
    sys_lib_search_path_spec="/usr/lib/pa20_64 /usr/ccs/lib/pa20_64"
    sys_lib_dlsearch_path_spec=$sys_lib_search_path_spec
    ;;
  *)
    shrext_cmds='.sl'
    dynamic_linker="$host_os dld.sl"
    shlibpath_var=SHLIB_PATH
    shlibpath_overrides_runpath=no # +s is required to enable SHLIB_PATH
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
    soname_spec='${libname}${release}${shared_ext}$major'
    ;;
  esac
  # HP-UX runs *really* slowly unless shared libraries are mode 555.
  postinstall_cmds='chmod 555 $lib'
  ;;

interix[[3-9]]*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  dynamic_linker='Interix 3.x ld.so.1 (PE, like ELF)'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=no
  hardcode_into_libs=yes
  ;;

irix5* | irix6* | nonstopux*)
  case $host_os in
    nonstopux*) version_type=nonstopux ;;
    *)
	if test "$lt_cv_prog_gnu_ld" = yes; then
		version_type=linux
	else
		version_type=irix
	fi ;;
  esac
  need_lib_prefix=no
  need_version=no
  soname_spec='${libname}${release}${shared_ext}$major'
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${release}${shared_ext} $libname${shared_ext}'
  case $host_os in
  irix5* | nonstopux*)
    libsuff= shlibsuff=
    ;;
  *)
    case $LD in # libtool.m4 will add one of these switches to LD
    *-32|*"-32 "|*-melf32bsmip|*"-melf32bsmip ")
      libsuff= shlibsuff= libmagic=32-bit;;
    *-n32|*"-n32 "|*-melf32bmipn32|*"-melf32bmipn32 ")
      libsuff=32 shlibsuff=N32 libmagic=N32;;
    *-64|*"-64 "|*-melf64bmip|*"-melf64bmip ")
      libsuff=64 shlibsuff=64 libmagic=64-bit;;
    *) libsuff= shlibsuff= libmagic=never-match;;
    esac
    ;;
  esac
  shlibpath_var=LD_LIBRARY${shlibsuff}_PATH
  shlibpath_overrides_runpath=no
  sys_lib_search_path_spec="/usr/lib${libsuff} /lib${libsuff} /usr/local/lib${libsuff}"
  sys_lib_dlsearch_path_spec="/usr/lib${libsuff} /lib${libsuff}"
  hardcode_into_libs=yes
  ;;

# No shared lib support for Linux oldld, aout, or coff.
linux*oldld* | linux*aout* | linux*coff*)
  dynamic_linker=no
  ;;

# This must be Linux ELF.
linux* | k*bsd*-gnu)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  finish_cmds='PATH="\$PATH:/sbin" ldconfig -n $libdir'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=no
  # Some binutils ld are patched to set DT_RUNPATH
  save_LDFLAGS=$LDFLAGS
  save_libdir=$libdir
  eval "libdir=/foo; wl=\"$_LT_TAGVAR(lt_prog_compiler_wl, $1)\"; \
       LDFLAGS=\"\$LDFLAGS $_LT_TAGVAR(hardcode_libdir_flag_spec, $1)\""
  AC_LINK_IFELSE([AC_LANG_PROGRAM([],[])],
    [AS_IF([ ($OBJDUMP -p conftest$ac_exeext) 2>/dev/null | grep "RUNPATH.*$libdir" >/dev/null],
       [shlibpath_overrides_runpath=yes])])
  LDFLAGS=$save_LDFLAGS
  libdir=$save_libdir

  # This implies no fast_install, which is unacceptable.
  # Some rework will be needed to allow for fast_install
  # before this can be enabled.
  hardcode_into_libs=yes

  # Append ld.so.conf contents to the search path
  if test -f /etc/ld.so.conf; then
    lt_ld_extra=`awk '/^include / { system(sprintf("cd /etc; cat %s 2>/dev/null", \[$]2)); skip = 1; } { if (!skip) print \[$]0; skip = 0; }' < /etc/ld.so.conf | $SED -e 's/#.*//;/^[	 ]*hwcap[	 ]/d;s/[:,	]/ /g;s/=[^=]*$//;s/=[^= ]* / /g;/^$/d' | tr '\n' ' '`
    sys_lib_dlsearch_path_spec="/lib /usr/lib $lt_ld_extra"
  fi

  # We used to test for /lib/ld.so.1 and disable shared libraries on
  # powerpc, because MkLinux only supported shared libraries with the
  # GNU dynamic linker.  Since this was broken with cross compilers,
  # most powerpc-linux boxes support dynamic linking these days and
  # people can always --disable-shared, the test was removed, and we
  # assume the GNU/Linux dynamic linker is in use.
  dynamic_linker='GNU/Linux ld.so'
  ;;

netbsd*)
  version_type=sunos
  need_lib_prefix=no
  need_version=no
  if echo __ELF__ | $CC -E - | $GREP __ELF__ >/dev/null; then
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
    finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
    dynamic_linker='NetBSD (a.out) ld.so'
  else
    library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
    soname_spec='${libname}${release}${shared_ext}$major'
    dynamic_linker='NetBSD ld.elf_so'
  fi
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=yes
  hardcode_into_libs=yes
  ;;

newsos6)
  version_type=linux
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=yes
  ;;

*nto* | *qnx*)
  version_type=qnx
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=no
  hardcode_into_libs=yes
  dynamic_linker='ldqnx.so'
  ;;

openbsd*)
  version_type=sunos
  sys_lib_dlsearch_path_spec="/usr/lib"
  need_lib_prefix=no
  # Some older versions of OpenBSD (3.3 at least) *do* need versioned libs.
  case $host_os in
    openbsd3.3 | openbsd3.3.*)	need_version=yes ;;
    *)				need_version=no  ;;
  esac
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
  finish_cmds='PATH="\$PATH:/sbin" ldconfig -m $libdir'
  shlibpath_var=LD_LIBRARY_PATH
  if test -z "`echo __ELF__ | $CC -E - | $GREP __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
    case $host_os in
      openbsd2.[[89]] | openbsd2.[[89]].*)
	shlibpath_overrides_runpath=no
	;;
      *)
	shlibpath_overrides_runpath=yes
	;;
      esac
  else
    shlibpath_overrides_runpath=yes
  fi
  ;;

os2*)
  libname_spec='$name'
  shrext_cmds=".dll"
  need_lib_prefix=no
  library_names_spec='$libname${shared_ext} $libname.a'
  dynamic_linker='OS/2 ld.exe'
  shlibpath_var=LIBPATH
  ;;

osf3* | osf4* | osf5*)
  version_type=osf
  need_lib_prefix=no
  need_version=no
  soname_spec='${libname}${release}${shared_ext}$major'
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  shlibpath_var=LD_LIBRARY_PATH
  sys_lib_search_path_spec="/usr/shlib /usr/ccs/lib /usr/lib/cmplrs/cc /usr/lib /usr/local/lib /var/shlib"
  sys_lib_dlsearch_path_spec="$sys_lib_search_path_spec"
  ;;

rdos*)
  dynamic_linker=no
  ;;

solaris*)
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=yes
  hardcode_into_libs=yes
  # ldd complains unless libraries are executable
  postinstall_cmds='chmod +x $lib'
  ;;

sunos4*)
  version_type=sunos
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${shared_ext}$versuffix'
  finish_cmds='PATH="\$PATH:/usr/etc" ldconfig $libdir'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=yes
  if test "$with_gnu_ld" = yes; then
    need_lib_prefix=no
  fi
  need_version=yes
  ;;

sysv4 | sysv4.3*)
  version_type=linux
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  case $host_vendor in
    sni)
      shlibpath_overrides_runpath=no
      need_lib_prefix=no
      runpath_var=LD_RUN_PATH
      ;;
    siemens)
      need_lib_prefix=no
      ;;
    motorola)
      need_lib_prefix=no
      need_version=no
      shlibpath_overrides_runpath=no
      sys_lib_search_path_spec='/lib /usr/lib /usr/ccs/lib'
      ;;
  esac
  ;;

sysv4*MP*)
  if test -d /usr/nec ;then
    version_type=linux
    library_names_spec='$libname${shared_ext}.$versuffix $libname${shared_ext}.$major $libname${shared_ext}'
    soname_spec='$libname${shared_ext}.$major'
    shlibpath_var=LD_LIBRARY_PATH
  fi
  ;;

sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
  version_type=freebsd-elf
  need_lib_prefix=no
  need_version=no
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext} $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=yes
  hardcode_into_libs=yes
  if test "$with_gnu_ld" = yes; then
    sys_lib_search_path_spec='/usr/local/lib /usr/gnu/lib /usr/ccs/lib /usr/lib /lib'
  else
    sys_lib_search_path_spec='/usr/ccs/lib /usr/lib'
    case $host_os in
      sco3.2v5*)
        sys_lib_search_path_spec="$sys_lib_search_path_spec /lib"
	;;
    esac
  fi
  sys_lib_dlsearch_path_spec='/usr/lib'
  ;;

tpf*)
  # TPF is a cross-target only.  Preferred cross-host = GNU/Linux.
  version_type=linux
  need_lib_prefix=no
  need_version=no
  library_name_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  shlibpath_var=LD_LIBRARY_PATH
  shlibpath_overrides_runpath=no
  hardcode_into_libs=yes
  ;;

uts4*)
  version_type=linux
  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
  soname_spec='${libname}${release}${shared_ext}$major'
  shlibpath_var=LD_LIBRARY_PATH
  ;;

*)
  dynamic_linker=no
  ;;
esac
AC_MSG_RESULT([$dynamic_linker])
test "$dynamic_linker" = no && can_build_shared=no

variables_saved_for_relink="PATH $shlibpath_var $runpath_var"
if test "$GCC" = yes; then
  variables_saved_for_relink="$variables_saved_for_relink GCC_EXEC_PREFIX COMPILER_PATH LIBRARY_PATH"
fi
 
if test "${lt_cv_sys_lib_search_path_spec+set}" = set; then
  sys_lib_search_path_spec="$lt_cv_sys_lib_search_path_spec"
fi
if test "${lt_cv_sys_lib_dlsearch_path_spec+set}" = set; then
  sys_lib_dlsearch_path_spec="$lt_cv_sys_lib_dlsearch_path_spec"
fi

_LT_DECL([], [variables_saved_for_relink], [1],
    [Variables whose values should be saved in libtool wrapper scripts and
    restored at link time])
_LT_DECL([], [need_lib_prefix], [0],
    [Do we need the "lib" prefix for modules?])
_LT_DECL([], [need_version], [0], [Do we need a version for libraries?])
_LT_DECL([], [version_type], [0], [Library versioning type])
_LT_DECL([], [runpath_var], [0],  [Shared library runtime path variable])
_LT_DECL([], [shlibpath_var], [0],[Shared library path variable])
_LT_DECL([], [shlibpath_overrides_runpath], [0],
    [Is shlibpath searched before the hard-coded library search path?])
_LT_DECL([], [libname_spec], [1], [Format of library name prefix])
_LT_DECL([], [library_names_spec], [1],
    [[List of archive names.  First name is the real one, the rest are links.
    The last name is the one that the linker finds with -lNAME]])
_LT_DECL([], [soname_spec], [1],
    [[The coded name of the library, if different from the real name]])
_LT_DECL([], [postinstall_cmds], [2],
    [Command to use after installation of a shared archive])
_LT_DECL([], [postuninstall_cmds], [2],
    [Command to use after uninstallation of a shared archive])
_LT_DECL([], [finish_cmds], [2],
    [Commands used to finish a libtool library installation in a directory])
_LT_DECL([], [finish_eval], [1],
    [[As "finish_cmds", except a single script fragment to be evaled but
    not shown]])
_LT_DECL([], [hardcode_into_libs], [0],
    [Whether we should hardcode library paths into libraries])
_LT_DECL([], [sys_lib_search_path_spec], [2],
    [Compile-time system search path for libraries])
_LT_DECL([], [sys_lib_dlsearch_path_spec], [2],
    [Run-time system search path for libraries])
])# _LT_SYS_DYNAMIC_LINKER


# _LT_PATH_TOOL_PREFIX(TOOL)
# --------------------------
# find a file program which can recognize shared library
AC_DEFUN([_LT_PATH_TOOL_PREFIX],
[m4_require([_LT_DECL_EGREP])dnl
AC_MSG_CHECKING([for $1])
AC_CACHE_VAL(lt_cv_path_MAGIC_CMD,
[case $MAGIC_CMD in
[[\\/*] |  ?:[\\/]*])
  lt_cv_path_MAGIC_CMD="$MAGIC_CMD" # Let the user override the test with a path.
  ;;
*)
  lt_save_MAGIC_CMD="$MAGIC_CMD"
  lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
dnl $ac_dummy forces splitting on constant user-supplied paths.
dnl POSIX.2 word splitting is done only on the output of word expansions,
dnl not every word.  This closes a longstanding sh security hole.
  ac_dummy="m4_if([$2], , $PATH, [$2])"
  for ac_dir in $ac_dummy; do
    IFS="$lt_save_ifs"
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/$1; then
      lt_cv_path_MAGIC_CMD="$ac_dir/$1"
      if test -n "$file_magic_test_file"; then
	case $deplibs_check_method in
	"file_magic "*)
	  file_magic_regex=`expr "$deplibs_check_method" : "file_magic \(.*\)"`
	  MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
	  if eval $file_magic_cmd \$file_magic_test_file 2> /dev/null |
	    $EGREP "$file_magic_regex" > /dev/null; then
	    :
	  else
	    cat <<_LT_EOF 1>&2

*** Warning: the command libtool uses to detect shared libraries,
*** $file_magic_cmd, produces output that libtool cannot recognize.
*** The result is that libtool may fail to recognize shared libraries
*** as such.  This will affect the creation of libtool libraries that
*** depend on shared libraries, but programs linked with such libtool
*** libraries will work regardless of this problem.  Nevertheless, you
*** may want to report the problem to your system manager and/or to
*** bug-libtool@gnu.org

_LT_EOF
	  fi ;;
	esac
      fi
      break
    fi
  done
  IFS="$lt_save_ifs"
  MAGIC_CMD="$lt_save_MAGIC_CMD"
  ;;
esac])
MAGIC_CMD="$lt_cv_path_MAGIC_CMD"
if test -n "$MAGIC_CMD"; then
  AC_MSG_RESULT($MAGIC_CMD)
else
  AC_MSG_RESULT(no)
fi
_LT_DECL([], [MAGIC_CMD], [0],
	 [Used to examine libraries when file_magic_cmd begins with "file"])dnl
])# _LT_PATH_TOOL_PREFIX

# Old name:
AU_ALIAS([AC_PATH_TOOL_PREFIX], [_LT_PATH_TOOL_PREFIX])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_PATH_TOOL_PREFIX], [])


# _LT_PATH_MAGIC
# --------------
# find a file program which can recognize a shared library
m4_defun([_LT_PATH_MAGIC],
[_LT_PATH_TOOL_PREFIX(${ac_tool_prefix}file, /usr/bin$PATH_SEPARATOR$PATH)
if test -z "$lt_cv_path_MAGIC_CMD"; then
  if test -n "$ac_tool_prefix"; then
    _LT_PATH_TOOL_PREFIX(file, /usr/bin$PATH_SEPARATOR$PATH)
  else
    MAGIC_CMD=:
  fi
fi
])# _LT_PATH_MAGIC


# LT_PATH_LD
# ----------
# find the pathname to the GNU or non-GNU linker
AC_DEFUN([LT_PATH_LD],
[AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
m4_require([_LT_DECL_SED])dnl
m4_require([_LT_DECL_EGREP])dnl

AC_ARG_WITH([gnu-ld],
    [AS_HELP_STRING([--with-gnu-ld],
	[assume the C compiler uses GNU ld @<:@default=no@:>@])],
    [test "$withval" = no || with_gnu_ld=yes],
    [with_gnu_ld=no])dnl

ac_prog=ld
if test "$GCC" = yes; then
  # Check if gcc -print-prog-name=ld gives a path.
  AC_MSG_CHECKING([for ld used by $CC])
  case $host in
  *-*-mingw*)
    # gcc leaves a trailing carriage return which upsets mingw
    ac_prog=`($CC -print-prog-name=ld) 2>&5 | tr -d '\015'` ;;
  *)
    ac_prog=`($CC -print-prog-name=ld) 2>&5` ;;
  esac
  case $ac_prog in
    # Accept absolute paths.
    [[\\/]]* | ?:[[\\/]]*)
      re_direlt='/[[^/]][[^/]]*/\.\./'
      # Canonicalize the pathname of ld
      ac_prog=`$ECHO "$ac_prog"| $SED 's%\\\\%/%g'`
      while $ECHO "$ac_prog" | $GREP "$re_direlt" > /dev/null 2>&1; do
	ac_prog=`$ECHO $ac_prog| $SED "s%$re_direlt%/%"`
      done
      test -z "$LD" && LD="$ac_prog"
      ;;
  "")
    # If it fails, then pretend we aren't using GCC.
    ac_prog=ld
    ;;
  *)
    # If it is relative, then search for the first ld in PATH.
    with_gnu_ld=unknown
    ;;
  esac
elif test "$with_gnu_ld" = yes; then
  AC_MSG_CHECKING([for GNU ld])
else
  AC_MSG_CHECKING([for non-GNU ld])
fi
AC_CACHE_VAL(lt_cv_path_LD,
[if test -z "$LD"; then
  lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
  for ac_dir in $PATH; do
    IFS="$lt_save_ifs"
    test -z "$ac_dir" && ac_dir=.
    if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
      lt_cv_path_LD="$ac_dir/$ac_prog"
      # Check to see if the program is GNU ld.  I'd rather use --version,
      # but apparently some variants of GNU ld only accept -v.
      # Break only if it was the GNU/non-GNU ld that we prefer.
      case `"$lt_cv_path_LD" -v 2>&1 </dev/null` in
      *GNU* | *'with BFD'*)
	test "$with_gnu_ld" != no && break
	;;
      *)
	test "$with_gnu_ld" != yes && break
	;;
      esac
    fi
  done
  IFS="$lt_save_ifs"
else
  lt_cv_path_LD="$LD" # Let the user override the test with a path.
fi])
LD="$lt_cv_path_LD"
if test -n "$LD"; then
  AC_MSG_RESULT($LD)
else
  AC_MSG_RESULT(no)
fi
test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
_LT_PATH_LD_GNU
AC_SUBST([LD])

_LT_TAGDECL([], [LD], [1], [The linker used to build libraries])
])# LT_PATH_LD

# Old names:
AU_ALIAS([AM_PROG_LD], [LT_PATH_LD])
AU_ALIAS([AC_PROG_LD], [LT_PATH_LD])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AM_PROG_LD], [])
dnl AC_DEFUN([AC_PROG_LD], [])


# _LT_PATH_LD_GNU
#- --------------
m4_defun([_LT_PATH_LD_GNU],
[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], lt_cv_prog_gnu_ld,
[# I'd rather use --version here, but apparently some GNU lds only accept -v.
case `$LD -v 2>&1 </dev/null` in
*GNU* | *'with BFD'*)
  lt_cv_prog_gnu_ld=yes
  ;;
*)
  lt_cv_prog_gnu_ld=no
  ;;
esac])
with_gnu_ld=$lt_cv_prog_gnu_ld
])# _LT_PATH_LD_GNU


# _LT_CMD_RELOAD
# --------------
# find reload flag for linker
#   -- PORTME Some linkers may need a different reload flag.
m4_defun([_LT_CMD_RELOAD],
[AC_CACHE_CHECK([for $LD option to reload object files],
  lt_cv_ld_reload_flag,
  [lt_cv_ld_reload_flag='-r'])
reload_flag=$lt_cv_ld_reload_flag
case $reload_flag in
"" | " "*) ;;
*) reload_flag=" $reload_flag" ;;
esac
reload_cmds='$LD$reload_flag -o $output$reload_objs'
case $host_os in
  darwin*)
    if test "$GCC" = yes; then
      reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
    else
      reload_cmds='$LD$reload_flag -o $output$reload_objs'
    fi
    ;;
esac
_LT_DECL([], [reload_flag], [1], [How to create reloadable object files])dnl
_LT_DECL([], [reload_cmds], [2])dnl
])# _LT_CMD_RELOAD


# _LT_CHECK_MAGIC_METHOD
# ----------------------
# how to check for library dependencies
#  -- PORTME fill in with the dynamic library characteristics
m4_defun([_LT_CHECK_MAGIC_METHOD],
[m4_require([_LT_DECL_EGREP])
AC_CACHE_CHECK([how to recognize dependent libraries],
lt_cv_deplibs_check_method,
[lt_cv_file_magic_cmd='$MAGIC_CMD'
lt_cv_file_magic_test_file=
lt_cv_deplibs_check_method='unknown'
# Need to set the preceding variable on all platforms that support
# interlibrary dependencies.
# 'none' -- dependencies not supported.
# `unknown' -- same as none, but documents that we really don't know.
# 'pass_all' -- all dependencies passed with no checks.
# 'test_compile' -- check by making test program.
# 'file_magic [[regex]]' -- check by looking for files in library path
# which responds to the $file_magic_cmd with a given extended regex.
# If you have `file' or equivalent on your system and you're not sure
# whether `pass_all' will *always* work, you probably want this one.

case $host_os in
aix[[4-9]]*)
  lt_cv_deplibs_check_method=pass_all
  ;;

beos*)
  lt_cv_deplibs_check_method=pass_all
  ;;

bsdi[[45]]*)
  lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[ML]]SB (shared object|dynamic lib)'
  lt_cv_file_magic_cmd='/usr/bin/file -L'
  lt_cv_file_magic_test_file=/shlib/libc.so
  ;;

cygwin*)
  # func_win32_libid is a shell function defined in ltmain.sh
  lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
  lt_cv_file_magic_cmd='func_win32_libid'
  ;;

mingw* | pw32*)
  # Base MSYS/MinGW do not provide the 'file' command needed by
  # func_win32_libid shell function, so use a weaker test based on 'objdump',
  # unless we find 'file', for example because we are cross-compiling.
  if ( file / ) >/dev/null 2>&1; then
    lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
    lt_cv_file_magic_cmd='func_win32_libid'
  else
    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
    lt_cv_file_magic_cmd='$OBJDUMP -f'
  fi
  ;;

darwin* | rhapsody*)
  lt_cv_deplibs_check_method=pass_all
  ;;

freebsd* | dragonfly*)
  if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
    case $host_cpu in
    i*86 )
      # Not sure whether the presence of OpenBSD here was a mistake.
      # Let's accept both of them until this is cleared up.
      lt_cv_deplibs_check_method='file_magic (FreeBSD|OpenBSD|DragonFly)/i[[3-9]]86 (compact )?demand paged shared library'
      lt_cv_file_magic_cmd=/usr/bin/file
      lt_cv_file_magic_test_file=`echo /usr/lib/libc.so.*`
      ;;
    esac
  else
    lt_cv_deplibs_check_method=pass_all
  fi
  ;;

gnu*)
  lt_cv_deplibs_check_method=pass_all
  ;;

hpux10.20* | hpux11*)
  lt_cv_file_magic_cmd=/usr/bin/file
  case $host_cpu in
  ia64*)
    lt_cv_deplibs_check_method='file_magic (s[[0-9]][[0-9]][[0-9]]|ELF-[[0-9]][[0-9]]) shared object file - IA64'
    lt_cv_file_magic_test_file=/usr/lib/hpux32/libc.so
    ;;
  hppa*64*)
    [lt_cv_deplibs_check_method='file_magic (s[0-9][0-9][0-9]|ELF-[0-9][0-9]) shared object file - PA-RISC [0-9].[0-9]']
    lt_cv_file_magic_test_file=/usr/lib/pa20_64/libc.sl
    ;;
  *)
    lt_cv_deplibs_check_method='file_magic (s[[0-9]][[0-9]][[0-9]]|PA-RISC[[0-9]].[[0-9]]) shared library'
    lt_cv_file_magic_test_file=/usr/lib/libc.sl
    ;;
  esac
  ;;

interix[[3-9]]*)
  # PIC code is broken on Interix 3.x, that's why |\.a not |_pic\.a here
  lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|\.a)$'
  ;;

irix5* | irix6* | nonstopux*)
  case $LD in
  *-32|*"-32 ") libmagic=32-bit;;
  *-n32|*"-n32 ") libmagic=N32;;
  *-64|*"-64 ") libmagic=64-bit;;
  *) libmagic=never-match;;
  esac
  lt_cv_deplibs_check_method=pass_all
  ;;

# This must be Linux ELF.
linux* | k*bsd*-gnu)
  lt_cv_deplibs_check_method=pass_all
  ;;

netbsd*)
  if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
    lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so\.[[0-9]]+\.[[0-9]]+|_pic\.a)$'
  else
    lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|_pic\.a)$'
  fi
  ;;

newos6*)
  lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[ML]]SB (executable|dynamic lib)'
  lt_cv_file_magic_cmd=/usr/bin/file
  lt_cv_file_magic_test_file=/usr/lib/libnls.so
  ;;

*nto* | *qnx*)
  lt_cv_deplibs_check_method=pass_all
  ;;

openbsd*)
  if test -z "`echo __ELF__ | $CC -E - | $GREP __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
    lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so\.[[0-9]]+\.[[0-9]]+|\.so|_pic\.a)$'
  else
    lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so\.[[0-9]]+\.[[0-9]]+|_pic\.a)$'
  fi
  ;;

osf3* | osf4* | osf5*)
  lt_cv_deplibs_check_method=pass_all
  ;;

rdos*)
  lt_cv_deplibs_check_method=pass_all
  ;;

solaris*)
  lt_cv_deplibs_check_method=pass_all
  ;;

sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX* | sysv4*uw2*)
  lt_cv_deplibs_check_method=pass_all
  ;;

sysv4 | sysv4.3*)
  case $host_vendor in
  motorola)
    lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[ML]]SB (shared object|dynamic lib) M[[0-9]][[0-9]]* Version [[0-9]]'
    lt_cv_file_magic_test_file=`echo /usr/lib/libc.so*`
    ;;
  ncr)
    lt_cv_deplibs_check_method=pass_all
    ;;
  sequent)
    lt_cv_file_magic_cmd='/bin/file'
    lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[LM]]SB (shared object|dynamic lib )'
    ;;
  sni)
    lt_cv_file_magic_cmd='/bin/file'
    lt_cv_deplibs_check_method="file_magic ELF [[0-9]][[0-9]]*-bit [[LM]]SB dynamic lib"
    lt_cv_file_magic_test_file=/lib/libc.so
    ;;
  siemens)
    lt_cv_deplibs_check_method=pass_all
    ;;
  pc)
    lt_cv_deplibs_check_method=pass_all
    ;;
  esac
  ;;

tpf*)
  lt_cv_deplibs_check_method=pass_all
  ;;
esac
])
file_magic_cmd=$lt_cv_file_magic_cmd
deplibs_check_method=$lt_cv_deplibs_check_method
test -z "$deplibs_check_method" && deplibs_check_method=unknown

_LT_DECL([], [deplibs_check_method], [1],
    [Method to check whether dependent libraries are shared objects])
_LT_DECL([], [file_magic_cmd], [1],
    [Command to use when deplibs_check_method == "file_magic"])
])# _LT_CHECK_MAGIC_METHOD


# LT_PATH_NM
# ----------
# find the pathname to a BSD- or MS-compatible name lister
AC_DEFUN([LT_PATH_NM],
[AC_REQUIRE([AC_PROG_CC])dnl
AC_CACHE_CHECK([for BSD- or MS-compatible name lister (nm)], lt_cv_path_NM,
[if test -n "$NM"; then
  # Let the user override the test.
  lt_cv_path_NM="$NM"
else
  lt_nm_to_check="${ac_tool_prefix}nm"
  if test -n "$ac_tool_prefix" && test "$build" = "$host"; then
    lt_nm_to_check="$lt_nm_to_check nm"
  fi
  for lt_tmp_nm in $lt_nm_to_check; do
    lt_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
    for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
      IFS="$lt_save_ifs"
      test -z "$ac_dir" && ac_dir=.
      tmp_nm="$ac_dir/$lt_tmp_nm"
      if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
	# Check to see if the nm accepts a BSD-compat flag.
	# Adding the `sed 1q' prevents false positives on HP-UX, which says:
	#   nm: unknown option "B" ignored
	# Tru64's nm complains that /dev/null is an invalid object file
	case `"$tmp_nm" -B /dev/null 2>&1 | sed '1q'` in
	*/dev/null* | *'Invalid file or object type'*)
	  lt_cv_path_NM="$tmp_nm -B"
	  break
	  ;;
	*)
	  case `"$tmp_nm" -p /dev/null 2>&1 | sed '1q'` in
	  */dev/null*)
	    lt_cv_path_NM="$tmp_nm -p"
	    break
	    ;;
	  *)
	    lt_cv_path_NM=${lt_cv_path_NM="$tmp_nm"} # keep the first match, but
	    continue # so that we can try to find one that supports BSD flags
	    ;;
	  esac
	  ;;
	esac
      fi
    done
    IFS="$lt_save_ifs"
  done
  : ${lt_cv_path_NM=no}
fi])
if test "$lt_cv_path_NM" != "no"; then
  NM="$lt_cv_path_NM"
else
  # Didn't find any BSD compatible name lister, look for dumpbin.
  AC_CHECK_TOOLS(DUMPBIN, ["dumpbin -symbols" "link -dump -symbols"], :)
  AC_SUBST([DUMPBIN])
  if test "$DUMPBIN" != ":"; then
    NM="$DUMPBIN"
  fi
fi
test -z "$NM" && NM=nm
AC_SUBST([NM])
_LT_DECL([], [NM], [1], [A BSD- or MS-compatible name lister])dnl

AC_CACHE_CHECK([the name lister ($NM) interface], [lt_cv_nm_interface],
  [lt_cv_nm_interface="BSD nm"
  echo "int some_variable = 0;" > conftest.$ac_ext
  (eval echo "\"\$as_me:__oline__: $ac_compile\"" >&AS_MESSAGE_LOG_FD)
  (eval "$ac_compile" 2>conftest.err)
  cat conftest.err >&AS_MESSAGE_LOG_FD
  (eval echo "\"\$as_me:__oline__: $NM \\\"conftest.$ac_objext\\\"\"" >&AS_MESSAGE_LOG_FD)
  (eval "$NM \"conftest.$ac_objext\"" 2>conftest.err > conftest.out)
  cat conftest.err >&AS_MESSAGE_LOG_FD
  (eval echo "\"\$as_me:__oline__: output\"" >&AS_MESSAGE_LOG_FD)
  cat conftest.out >&AS_MESSAGE_LOG_FD
  if $GREP 'External.*some_variable' conftest.out > /dev/null; then
    lt_cv_nm_interface="MS dumpbin"
  fi
  rm -f conftest*])
])# LT_PATH_NM

# Old names:
AU_ALIAS([AM_PROG_NM], [LT_PATH_NM])
AU_ALIAS([AC_PROG_NM], [LT_PATH_NM])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AM_PROG_NM], [])
dnl AC_DEFUN([AC_PROG_NM], [])


# LT_LIB_M
# --------
# check for math library
AC_DEFUN([LT_LIB_M],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
LIBM=
case $host in
*-*-beos* | *-*-cygwin* | *-*-pw32* | *-*-darwin*)
  # These system don't have libm, or don't need it
  ;;
*-ncr-sysv4.3*)
  AC_CHECK_LIB(mw, _mwvalidcheckl, LIBM="-lmw")
  AC_CHECK_LIB(m, cos, LIBM="$LIBM -lm")
  ;;
*)
  AC_CHECK_LIB(m, cos, LIBM="-lm")
  ;;
esac
AC_SUBST([LIBM])
])# LT_LIB_M

# Old name:
AU_ALIAS([AC_CHECK_LIBM], [LT_LIB_M])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_CHECK_LIBM], [])


# _LT_COMPILER_NO_RTTI([TAGNAME])
# -------------------------------
m4_defun([_LT_COMPILER_NO_RTTI],
[m4_require([_LT_TAG_COMPILER])dnl

_LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=

if test "$GCC" = yes; then
  _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=' -fno-builtin'

  _LT_COMPILER_OPTION([if $compiler supports -fno-rtti -fno-exceptions],
    lt_cv_prog_compiler_rtti_exceptions,
    [-fno-rtti -fno-exceptions], [],
    [_LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)="$_LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1) -fno-rtti -fno-exceptions"])
fi
_LT_TAGDECL([no_builtin_flag], [lt_prog_compiler_no_builtin_flag], [1],
	[Compiler flag to turn off builtin functions])
])# _LT_COMPILER_NO_RTTI


# _LT_CMD_GLOBAL_SYMBOLS
# ----------------------
m4_defun([_LT_CMD_GLOBAL_SYMBOLS],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([LT_PATH_NM])dnl
AC_REQUIRE([LT_PATH_LD])dnl
m4_require([_LT_DECL_SED])dnl
m4_require([_LT_DECL_EGREP])dnl
m4_require([_LT_TAG_COMPILER])dnl

# Check for command to grab the raw symbol name followed by C symbol from nm.
AC_MSG_CHECKING([command to parse $NM output from $compiler object])
AC_CACHE_VAL([lt_cv_sys_global_symbol_pipe],
[
# These are sane defaults that work on at least a few old systems.
# [They come from Ultrix.  What could be older than Ultrix?!! ;)]

# Character class describing NM global symbol codes.
symcode='[[BCDEGRST]]'

# Regexp to match symbols that can be accessed directly from C.
sympat='\([[_A-Za-z]][[_A-Za-z0-9]]*\)'

# Define system-specific variables.
case $host_os in
aix*)
  symcode='[[BCDT]]'
  ;;
cygwin* | mingw* | pw32*)
  symcode='[[ABCDGISTW]]'
  ;;
hpux*)
  if test "$host_cpu" = ia64; then
    symcode='[[ABCDEGRST]]'
  fi
  ;;
irix* | nonstopux*)
  symcode='[[BCDEGRST]]'
  ;;
osf*)
  symcode='[[BCDEGQRST]]'
  ;;
solaris*)
  symcode='[[BDRT]]'
  ;;
sco3.2v5*)
  symcode='[[DT]]'
  ;;
sysv4.2uw2*)
  symcode='[[DT]]'
  ;;
sysv5* | sco5v6* | unixware* | OpenUNIX*)
  symcode='[[ABDT]]'
  ;;
sysv4)
  symcode='[[DFNSTU]]'
  ;;
esac

# If we're using GNU nm, then use its standard symbol codes.
case `$NM -V 2>&1` in
*GNU* | *'with BFD'*)
  symcode='[[ABCDGIRSTW]]' ;;
esac

# Transform an extracted symbol line into a proper C declaration.
# Some systems (esp. on ia64) link data and code symbols differently,
# so use this general approach.
lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"

# Transform an extracted symbol line into symbol name and symbol address
lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([[^ ]]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p'"
lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([[^ ]]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([[^ ]]*\) \(lib[[^ ]]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([[^ ]]*\) \([[^ ]]*\)$/  {\"lib\2\", (void *) \&\2},/p'"

# Handle CRLF in mingw tool chain
opt_cr=
case $build_os in
mingw*)
  opt_cr=`$ECHO 'x\{0,1\}' | tr x '\015'` # option cr in regexp
  ;;
esac

# Try without a prefix underscore, then with it.
for ac_symprfx in "" "_"; do

  # Transform symcode, sympat, and symprfx into a raw symbol and a C symbol.
  symxfrm="\\1 $ac_symprfx\\2 \\2"

  # Write the raw and C identifiers.
  if test "$lt_cv_nm_interface" = "MS dumpbin"; then
    # Fake it for dumpbin and say T for any non-static function
    # and D for any global variable.
    # Also find C++ and __fastcall symbols from MSVC++,
    # which start with @ or ?.
    lt_cv_sys_global_symbol_pipe="$AWK ['"\
"     {last_section=section; section=\$ 3};"\
"     /Section length .*#relocs.*(pick any)/{hide[last_section]=1};"\
"     \$ 0!~/External *\|/{next};"\
"     / 0+ UNDEF /{next}; / UNDEF \([^|]\)*()/{next};"\
"     {if(hide[section]) next};"\
"     {f=0}; \$ 0~/\(\).*\|/{f=1}; {printf f ? \"T \" : \"D \"};"\
"     {split(\$ 0, a, /\||\r/); split(a[2], s)};"\
"     s[1]~/^[@?]/{print s[1], s[1]; next};"\
"     s[1]~prfx {split(s[1],t,\"@\"); print t[1], substr(t[1],length(prfx))}"\
"     ' prfx=^$ac_symprfx]"
  else
    lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
  fi

  # Check to see that the pipe works correctly.
  pipe_works=no

  rm -f conftest*
  cat > conftest.$ac_ext <<_LT_EOF
#ifdef __cplusplus
extern "C" {
#endif
char nm_test_var;
void nm_test_func(void);
void nm_test_func(void){}
#ifdef __cplusplus
}
#endif
int main(){nm_test_var='a';nm_test_func();return(0);}
_LT_EOF

  if AC_TRY_EVAL(ac_compile); then
    # Now try to grab the symbols.
    nlist=conftest.nm
    if AC_TRY_EVAL(NM conftest.$ac_objext \| $lt_cv_sys_global_symbol_pipe \> $nlist) && test -s "$nlist"; then
      # Try sorting and uniquifying the output.
      if sort "$nlist" | uniq > "$nlist"T; then
	mv -f "$nlist"T "$nlist"
      else
	rm -f "$nlist"T
      fi

      # Make sure that we snagged all the symbols we need.
      if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
	  cat <<_LT_EOF > conftest.$ac_ext
#ifdef __cplusplus
extern "C" {
#endif

_LT_EOF
	  # Now generate the symbol file.
	  eval "$lt_cv_sys_global_symbol_to_cdecl"' < "$nlist" | $GREP -v main >> conftest.$ac_ext'

	  cat <<_LT_EOF >> conftest.$ac_ext

/* The mapping between symbol names and symbols.  */
const struct {
  const char *name;
  void       *address;
}
lt__PROGRAM__LTX_preloaded_symbols[[]] =
{
  { "@PROGRAM@", (void *) 0 },
_LT_EOF
	  $SED "s/^$symcode$symcode* \(.*\) \(.*\)$/  {\"\2\", (void *) \&\2},/" < "$nlist" | $GREP -v main >> conftest.$ac_ext
	  cat <<\_LT_EOF >> conftest.$ac_ext
  {0, (void *) 0}
};

/* This works around a problem in FreeBSD linker */
#ifdef FREEBSD_WORKAROUND
static const void *lt_preloaded_setup() {
  return lt__PROGRAM__LTX_preloaded_symbols;
}
#endif

#ifdef __cplusplus
}
#endif
_LT_EOF
	  # Now try linking the two files.
	  mv conftest.$ac_objext conftstm.$ac_objext
	  lt_save_LIBS="$LIBS"
	  lt_save_CFLAGS="$CFLAGS"
	  LIBS="conftstm.$ac_objext"
	  CFLAGS="$CFLAGS$_LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)"
	  if AC_TRY_EVAL(ac_link) && test -s conftest${ac_exeext}; then
	    pipe_works=yes
	  fi
	  LIBS="$lt_save_LIBS"
	  CFLAGS="$lt_save_CFLAGS"
	else
	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
	fi
      else
	echo "cannot find nm_test_var in $nlist" >&AS_MESSAGE_LOG_FD
      fi
    else
      echo "cannot run $lt_cv_sys_global_symbol_pipe" >&AS_MESSAGE_LOG_FD
    fi
  else
    echo "$progname: failed program was:" >&AS_MESSAGE_LOG_FD
    cat conftest.$ac_ext >&5
  fi
  rm -rf conftest* conftst*

  # Do not use the global_symbol_pipe unless it works.
  if test "$pipe_works" = yes; then
    break
  else
    lt_cv_sys_global_symbol_pipe=
  fi
done
])
if test -z "$lt_cv_sys_global_symbol_pipe"; then
  lt_cv_sys_global_symbol_to_cdecl=
fi
if test -z "$lt_cv_sys_global_symbol_pipe$lt_cv_sys_global_symbol_to_cdecl"; then
  AC_MSG_RESULT(failed)
else
  AC_MSG_RESULT(ok)
fi

_LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
    [Take the output of nm and produce a listing of raw symbols and C names])
_LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
    [Transform the output of nm in a proper C declaration])
_LT_DECL([global_symbol_to_c_name_address],
    [lt_cv_sys_global_symbol_to_c_name_address], [1],
    [Transform the output of nm in a C name address pair])
_LT_DECL([global_symbol_to_c_name_address_lib_prefix],
    [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
    [Transform the output of nm in a C name address pair when lib prefix is needed])
]) # _LT_CMD_GLOBAL_SYMBOLS


# _LT_COMPILER_PIC([TAGNAME])
# ---------------------------
m4_defun([_LT_COMPILER_PIC],
[m4_require([_LT_TAG_COMPILER])dnl
_LT_TAGVAR(lt_prog_compiler_wl, $1)=
_LT_TAGVAR(lt_prog_compiler_pic, $1)=
_LT_TAGVAR(lt_prog_compiler_static, $1)=

AC_MSG_CHECKING([for $compiler option to produce PIC])
m4_if([$1], [CXX], [
  # C++ specific cases for pic, static, wl, etc.
  if test "$GXX" = yes; then
    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'

    case $host_os in
    aix*)
      # All AIX code is PIC.
      if test "$host_cpu" = ia64; then
	# AIX 5 now supports IA64 processor
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      fi
      ;;

    amigaos*)
      case $host_cpu in
      powerpc)
            # see comment about AmigaOS4 .so support
            _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
        ;;
      m68k)
            # FIXME: we need at least 68020 code to build shared libraries, but
            # adding the `-m68020' flag to GCC prevents building anything better,
            # like `-m68040'.
            _LT_TAGVAR(lt_prog_compiler_pic, $1)='-m68020 -resident32 -malways-restore-a4'
        ;;
      esac
      ;;

    beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
      # PIC is the default for these OSes.
      ;;
    mingw* | cygwin* | os2* | pw32*)
      # This hack is so that the source file can tell whether it is being
      # built for inclusion in a dll (and should export symbols for example).
      # Although the cygwin gcc ignores -fPIC, still need this for old-style
      # (--disable-auto-import) libraries
      m4_if([$1], [GCJ], [],
	[_LT_TAGVAR(lt_prog_compiler_pic, $1)='-DDLL_EXPORT'])
      ;;
    darwin* | rhapsody*)
      # PIC is the default on this platform
      # Common symbols not allowed in MH_DYLIB files
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fno-common'
      ;;
    *djgpp*)
      # DJGPP does not support shared libraries at all
      _LT_TAGVAR(lt_prog_compiler_pic, $1)=
      ;;
    interix[[3-9]]*)
      # Interix 3.x gcc -fpic/-fPIC options generate broken code.
      # Instead, we relocate shared libraries at runtime.
      ;;
    sysv4*MP*)
      if test -d /usr/nec; then
	_LT_TAGVAR(lt_prog_compiler_pic, $1)=-Kconform_pic
      fi
      ;;
    hpux*)
      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
      # not for PA HP-UX.
      case $host_cpu in
      hppa*64*|ia64*)
	;;
      *)
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
	;;
      esac
      ;;
    *qnx* | *nto*)
      # QNX uses GNU C++, but need to define -shared option too, otherwise
      # it will coredump.
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC -shared'
      ;;
    *)
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
      ;;
    esac
  else
    case $host_os in
      aix[[4-9]]*)
	# All AIX code is PIC.
	if test "$host_cpu" = ia64; then
	  # AIX 5 now supports IA64 processor
	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	else
	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-bnso -bI:/lib/syscalls.exp'
	fi
	;;
      chorus*)
	case $cc_basename in
	cxch68*)
	  # Green Hills C++ Compiler
	  # _LT_TAGVAR(lt_prog_compiler_static, $1)="--no_auto_instantiation -u __main -u __premain -u _abort -r $COOL_DIR/lib/libOrb.a $MVME_DIR/lib/CC/libC.a $MVME_DIR/lib/classix/libcx.s.a"
	  ;;
	esac
	;;
      dgux*)
	case $cc_basename in
	  ec++*)
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	    ;;
	  ghcx*)
	    # Green Hills C++ Compiler
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-pic'
	    ;;
	  *)
	    ;;
	esac
	;;
      freebsd* | dragonfly*)
	# FreeBSD uses GNU C++
	;;
      hpux9* | hpux10* | hpux11*)
	case $cc_basename in
	  CC*)
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='${wl}-a ${wl}archive'
	    if test "$host_cpu" != ia64; then
	      _LT_TAGVAR(lt_prog_compiler_pic, $1)='+Z'
	    fi
	    ;;
	  aCC*)
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='${wl}-a ${wl}archive'
	    case $host_cpu in
	    hppa*64*|ia64*)
	      # +Z the default
	      ;;
	    *)
	      _LT_TAGVAR(lt_prog_compiler_pic, $1)='+Z'
	      ;;
	    esac
	    ;;
	  *)
	    ;;
	esac
	;;
      interix*)
	# This is c89, which is MS Visual C++ (no shared libs)
	# Anyone wants to do a port?
	;;
      irix5* | irix6* | nonstopux*)
	case $cc_basename in
	  CC*)
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
	    # CC pic flag -KPIC is the default.
	    ;;
	  *)
	    ;;
	esac
	;;
      linux* | k*bsd*-gnu)
	case $cc_basename in
	  KCC*)
	    # KAI C++ Compiler
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='--backend -Wl,'
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
	    ;;
	  icpc* | ecpc* )
	    # Intel C++
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
	    ;;
	  pgCC* | pgcpp*)
	    # Portland Group C++ compiler
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fpic'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	    ;;
	  cxx*)
	    # Compaq C++
	    # Make sure the PIC flag is empty.  It appears that all Alpha
	    # Linux and Compaq Tru64 Unix objects are PIC.
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)=
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
	    ;;
	  xlc* | xlC*)
	    # IBM XL 8.0 on PPC
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-qpic'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-qstaticlink'
	    ;;
	  *)
	    case `$CC -V 2>&1 | sed 5q` in
	    *Sun\ C*)
	      # Sun C++ 5.9
	      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld '
	      ;;
	    esac
	    ;;
	esac
	;;
      lynxos*)
	;;
      m88k*)
	;;
      mvs*)
	case $cc_basename in
	  cxx*)
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-W c,exportall'
	    ;;
	  *)
	    ;;
	esac
	;;
      netbsd*)
	;;
      *qnx* | *nto*)
        # QNX uses GNU C++, but need to define -shared option too, otherwise
        # it will coredump.
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC -shared'
        ;;
      osf3* | osf4* | osf5*)
	case $cc_basename in
	  KCC*)
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='--backend -Wl,'
	    ;;
	  RCC*)
	    # Rational C++ 2.4.1
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-pic'
	    ;;
	  cxx*)
	    # Digital/Compaq C++
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    # Make sure the PIC flag is empty.  It appears that all Alpha
	    # Linux and Compaq Tru64 Unix objects are PIC.
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)=
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
	    ;;
	  *)
	    ;;
	esac
	;;
      psos*)
	;;
      solaris*)
	case $cc_basename in
	  CC*)
	    # Sun C++ 4.2, 5.x and Centerline C++
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld '
	    ;;
	  gcx*)
	    # Green Hills C++ Compiler
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-PIC'
	    ;;
	  *)
	    ;;
	esac
	;;
      sunos4*)
	case $cc_basename in
	  CC*)
	    # Sun C++ 4.x
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-pic'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	    ;;
	  lcc*)
	    # Lucid
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-pic'
	    ;;
	  *)
	    ;;
	esac
	;;
      sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
	case $cc_basename in
	  CC*)
	    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	    ;;
	esac
	;;
      tandem*)
	case $cc_basename in
	  NCC*)
	    # NonStop-UX NCC 3.20
	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	    ;;
	  *)
	    ;;
	esac
	;;
      vxworks*)
	;;
      *)
	_LT_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
	;;
    esac
  fi
],
[
  if test "$GCC" = yes; then
    _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
    _LT_TAGVAR(lt_prog_compiler_static, $1)='-static'

    case $host_os in
      aix*)
      # All AIX code is PIC.
      if test "$host_cpu" = ia64; then
	# AIX 5 now supports IA64 processor
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      fi
      ;;

    amigaos*)
      case $host_cpu in
      powerpc)
            # see comment about AmigaOS4 .so support
            _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
        ;;
      m68k)
            # FIXME: we need at least 68020 code to build shared libraries, but
            # adding the `-m68020' flag to GCC prevents building anything better,
            # like `-m68040'.
            _LT_TAGVAR(lt_prog_compiler_pic, $1)='-m68020 -resident32 -malways-restore-a4'
        ;;
      esac
      ;;

    beos* | irix5* | irix6* | nonstopux* | osf3* | osf4* | osf5*)
      # PIC is the default for these OSes.
      ;;

    mingw* | cygwin* | pw32* | os2*)
      # This hack is so that the source file can tell whether it is being
      # built for inclusion in a dll (and should export symbols for example).
      # Although the cygwin gcc ignores -fPIC, still need this for old-style
      # (--disable-auto-import) libraries
      m4_if([$1], [GCJ], [],
	[_LT_TAGVAR(lt_prog_compiler_pic, $1)='-DDLL_EXPORT'])
      ;;

    darwin* | rhapsody*)
      # PIC is the default on this platform
      # Common symbols not allowed in MH_DYLIB files
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fno-common'
      ;;

    hpux*)
      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
      # not for PA HP-UX.
      case $host_cpu in
      hppa*64*|ia64*)
	# +Z the default
	;;
      *)
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
	;;
      esac
      ;;

    interix[[3-9]]*)
      # Interix 3.x gcc -fpic/-fPIC options generate broken code.
      # Instead, we relocate shared libraries at runtime.
      ;;

    msdosdjgpp*)
      # Just because we use GCC doesn't mean we suddenly get shared libraries
      # on systems that don't support them.
      _LT_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
      enable_shared=no
      ;;

    *nto* | *qnx*)
      # QNX uses GNU C++, but need to define -shared option too, otherwise
      # it will coredump.
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC -shared'
      ;;

    sysv4*MP*)
      if test -d /usr/nec; then
	_LT_TAGVAR(lt_prog_compiler_pic, $1)=-Kconform_pic
      fi
      ;;

    *)
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC'
      ;;
    esac
  else
    # PORTME Check for flag to pass linker flags through the system compiler.
    case $host_os in
    aix*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      if test "$host_cpu" = ia64; then
	# AIX 5 now supports IA64 processor
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      else
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-bnso -bI:/lib/syscalls.exp'
      fi
      ;;

    mingw* | cygwin* | pw32* | os2*)
      # This hack is so that the source file can tell whether it is being
      # built for inclusion in a dll (and should export symbols for example).
      m4_if([$1], [GCJ], [],
	[_LT_TAGVAR(lt_prog_compiler_pic, $1)='-DDLL_EXPORT'])
      ;;

    hpux9* | hpux10* | hpux11*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      # PIC is the default for IA64 HP-UX and 64-bit HP-UX, but
      # not for PA HP-UX.
      case $host_cpu in
      hppa*64*|ia64*)
	# +Z the default
	;;
      *)
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='+Z'
	;;
      esac
      # Is there a better lt_prog_compiler_static that works with the bundled CC?
      _LT_TAGVAR(lt_prog_compiler_static, $1)='${wl}-a ${wl}archive'
      ;;

    irix5* | irix6* | nonstopux*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      # PIC (with -KPIC) is the default.
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
      ;;

    linux* | k*bsd*-gnu)
      case $cc_basename in
      icc* | ecc* | ifort*)
	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-static'
        ;;
      pgcc* | pgf77* | pgf90* | pgf95*)
        # Portland Group compilers (*not* the Pentium gcc compiler,
	# which looks to be a dead project)
	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-fpic'
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        ;;
      ccc*)
        _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
        # All Alpha code is PIC.
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
        ;;
      xl*)
	# IBM XL C 8.0/Fortran 10.1 on PPC
	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-qpic'
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-qstaticlink'
	;;
      *)
	case `$CC -V 2>&1 | sed 5q` in
	*Sun\ C*)
	  # Sun C 5.9
	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	  _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
	  ;;
	*Sun\ F*)
	  # Sun Fortran 8.3 passes all unrecognized flags to the linker
	  _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
	  _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
	  _LT_TAGVAR(lt_prog_compiler_wl, $1)=''
	  ;;
	esac
	;;
      esac
      ;;

    newsos6)
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      ;;

    *nto* | *qnx*)
      # QNX uses GNU C++, but need to define -shared option too, otherwise
      # it will coredump.
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-fPIC -shared'
      ;;

    osf3* | osf4* | osf5*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      # All OSF/1 code is PIC.
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
      ;;

    rdos*)
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-non_shared'
      ;;

    solaris*)
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      case $cc_basename in
      f77* | f90* | f95*)
	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
      *)
	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
      esac
      ;;

    sunos4*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld '
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-PIC'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      ;;

    sysv4 | sysv4.2uw2* | sysv4.3*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      ;;

    sysv4*MP*)
      if test -d /usr/nec ;then
	_LT_TAGVAR(lt_prog_compiler_pic, $1)='-Kconform_pic'
	_LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      fi
      ;;

    sysv5* | unixware* | sco3.2v5* | sco5v6* | OpenUNIX*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      ;;

    unicos*)
      _LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,'
      _LT_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
      ;;

    uts4*)
      _LT_TAGVAR(lt_prog_compiler_pic, $1)='-pic'
      _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
      ;;

    *)
      _LT_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no
      ;;
    esac
  fi
])
case $host_os in
  # For platforms which do not support PIC, -DPIC is meaningless:
  *djgpp*)
    _LT_TAGVAR(lt_prog_compiler_pic, $1)=
    ;;
  *)
    _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
    ;;
esac
AC_MSG_RESULT([$_LT_TAGVAR(lt_prog_compiler_pic, $1)])
_LT_TAGDECL([wl], [lt_prog_compiler_wl], [1],
	[How to pass a linker flag through the compiler])

#
# Check to make sure the PIC flag actually works.
#
if test -n "$_LT_TAGVAR(lt_prog_compiler_pic, $1)"; then
  _LT_COMPILER_OPTION([if $compiler PIC flag $_LT_TAGVAR(lt_prog_compiler_pic, $1) works],
    [_LT_TAGVAR(lt_cv_prog_compiler_pic_works, $1)],
    [$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])], [],
    [case $_LT_TAGVAR(lt_prog_compiler_pic, $1) in
     "" | " "*) ;;
     *) _LT_TAGVAR(lt_prog_compiler_pic, $1)=" $_LT_TAGVAR(lt_prog_compiler_pic, $1)" ;;
     esac],
    [_LT_TAGVAR(lt_prog_compiler_pic, $1)=
     _LT_TAGVAR(lt_prog_compiler_can_build_shared, $1)=no])
fi
_LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
	[Additional compiler flags for building library objects])

#
# Check to make sure the static flag actually works.
#
wl=$_LT_TAGVAR(lt_prog_compiler_wl, $1) eval lt_tmp_static_flag=\"$_LT_TAGVAR(lt_prog_compiler_static, $1)\"
_LT_LINKER_OPTION([if $compiler static flag $lt_tmp_static_flag works],
  _LT_TAGVAR(lt_cv_prog_compiler_static_works, $1),
  $lt_tmp_static_flag,
  [],
  [_LT_TAGVAR(lt_prog_compiler_static, $1)=])
_LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
	[Compiler flag to prevent dynamic linking])
])# _LT_COMPILER_PIC


# _LT_LINKER_SHLIBS([TAGNAME])
# ----------------------------
# See if the linker supports building shared libraries.
m4_defun([_LT_LINKER_SHLIBS],
[AC_REQUIRE([LT_PATH_LD])dnl
AC_REQUIRE([LT_PATH_NM])dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_DECL_EGREP])dnl
m4_require([_LT_DECL_SED])dnl
m4_require([_LT_CMD_GLOBAL_SYMBOLS])dnl
m4_require([_LT_TAG_COMPILER])dnl
AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
m4_if([$1], [CXX], [
  _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
  case $host_os in
  aix[[4-9]]*)
    # If we're using GNU nm, then we don't want the "-C" option.
    # -C means demangle to AIX nm, but means don't demangle with GNU nm
    if $NM -V 2>&1 | $GREP 'GNU' > /dev/null; then
      _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
    else
      _LT_TAGVAR(export_symbols_cmds, $1)='$NM -BCpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
    fi
    ;;
  pw32*)
    _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
  ;;
  cygwin* | mingw*)
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/;/^.*[[ ]]__nm__/s/^.*[[ ]]__nm__\([[^ ]]*\)[[ ]][[^ ]]*/\1 DATA/;/^I[[ ]]/d;/^[[AITW]][[ ]]/s/.* //'\'' | sort | uniq > $export_symbols'
  ;;
  *)
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
  ;;
  esac
  _LT_TAGVAR(exclude_expsyms, $1)=['_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*']
], [
  runpath_var=
  _LT_TAGVAR(allow_undefined_flag, $1)=
  _LT_TAGVAR(always_export_symbols, $1)=no
  _LT_TAGVAR(archive_cmds, $1)=
  _LT_TAGVAR(archive_expsym_cmds, $1)=
  _LT_TAGVAR(compiler_needs_object, $1)=no
  _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no
  _LT_TAGVAR(export_dynamic_flag_spec, $1)=
  _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
  _LT_TAGVAR(hardcode_automatic, $1)=no
  _LT_TAGVAR(hardcode_direct, $1)=no
  _LT_TAGVAR(hardcode_direct_absolute, $1)=no
  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
  _LT_TAGVAR(hardcode_libdir_separator, $1)=
  _LT_TAGVAR(hardcode_minus_L, $1)=no
  _LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
  _LT_TAGVAR(inherit_rpath, $1)=no
  _LT_TAGVAR(link_all_deplibs, $1)=unknown
  _LT_TAGVAR(module_cmds, $1)=
  _LT_TAGVAR(module_expsym_cmds, $1)=
  _LT_TAGVAR(old_archive_from_new_cmds, $1)=
  _LT_TAGVAR(old_archive_from_expsyms_cmds, $1)=
  _LT_TAGVAR(thread_safe_flag_spec, $1)=
  _LT_TAGVAR(whole_archive_flag_spec, $1)=
  # include_expsyms should be a list of space-separated symbols to be *always*
  # included in the symbol list
  _LT_TAGVAR(include_expsyms, $1)=
  # exclude_expsyms can be an extended regexp of symbols to exclude
  # it will be wrapped by ` (' and `)$', so one must not match beginning or
  # end of line.  Example: `a|bc|.*d.*' will exclude the symbols `a' and `bc',
  # as well as any symbol that contains `d'.
  _LT_TAGVAR(exclude_expsyms, $1)=['_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*']
  # Although _GLOBAL_OFFSET_TABLE_ is a valid symbol C name, most a.out
  # platforms (ab)use it in PIC code, but their linkers get confused if
  # the symbol is explicitly referenced.  Since portable code cannot
  # rely on this symbol name, it's probably fine to never include it in
  # preloaded symbol tables.
  # Exclude shared library initialization/finalization symbols.
dnl Note also adjust exclude_expsyms for C++ above.
  extract_expsyms_cmds=

  case $host_os in
  cygwin* | mingw* | pw32*)
    # FIXME: the MSVC++ port hasn't been tested in a loooong time
    # When not using gcc, we currently assume that we are using
    # Microsoft Visual C++.
    if test "$GCC" != yes; then
      with_gnu_ld=no
    fi
    ;;
  interix*)
    # we just hope/assume this is gcc and not c89 (= MSVC++)
    with_gnu_ld=yes
    ;;
  openbsd*)
    with_gnu_ld=no
    ;;
  esac

  _LT_TAGVAR(ld_shlibs, $1)=yes
  if test "$with_gnu_ld" = yes; then
    # If archive_cmds runs LD, not CC, wlarc should be empty
    wlarc='${wl}'

    # Set some defaults for GNU ld with shared library support. These
    # are reset later if shared libraries are not supported. Putting them
    # here allows them to be overridden if necessary.
    runpath_var=LD_RUN_PATH
    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
    # ancient GNU ld didn't support --whole-archive et. al.
    if $LD --help 2>&1 | $GREP 'no-whole-archive' > /dev/null; then
      _LT_TAGVAR(whole_archive_flag_spec, $1)="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
    else
      _LT_TAGVAR(whole_archive_flag_spec, $1)=
    fi
    supports_anon_versioning=no
    case `$LD -v 2>&1` in
      *\ [[01]].* | *\ 2.[[0-9]].* | *\ 2.10.*) ;; # catch versions < 2.11
      *\ 2.11.93.0.2\ *) supports_anon_versioning=yes ;; # RH7.3 ...
      *\ 2.11.92.0.12\ *) supports_anon_versioning=yes ;; # Mandrake 8.2 ...
      *\ 2.11.*) ;; # other 2.11 versions
      *) supports_anon_versioning=yes ;;
    esac

    # See if GNU ld supports shared libraries.
    case $host_os in
    aix[[3-9]]*)
      # On AIX/PPC, the GNU linker is very broken
      if test "$host_cpu" != ia64; then
	_LT_TAGVAR(ld_shlibs, $1)=no
	cat <<_LT_EOF 1>&2

*** Warning: the GNU linker, at least up to release 2.9.1, is reported
*** to be unable to reliably create shared libraries on AIX.
*** Therefore, libtool is disabling shared libraries support.  If you
*** really care for shared libraries, you may want to modify your PATH
*** so that a non-GNU linker is found, and then restart.

_LT_EOF
      fi
      ;;

    amigaos*)
      case $host_cpu in
      powerpc)
            # see comment about AmigaOS4 .so support
            _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
            _LT_TAGVAR(archive_expsym_cmds, $1)=''
        ;;
      m68k)
            _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/a2ixlibrary.data~$ECHO "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$ECHO "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$ECHO "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$ECHO "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
            _LT_TAGVAR(hardcode_minus_L, $1)=yes
        ;;
      esac
      ;;

    beos*)
      if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
	_LT_TAGVAR(allow_undefined_flag, $1)=unsupported
	# Joseph Beckenbach <jrb3@best.com> says some releases of gcc
	# support --undefined.  This deserves some investigation.  FIXME
	_LT_TAGVAR(archive_cmds, $1)='$CC -nostart $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
      else
	_LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;

    cygwin* | mingw* | pw32*)
      # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
      # as there is no search path for DLLs.
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
      _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
      _LT_TAGVAR(always_export_symbols, $1)=no
      _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
      _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[[BCDGRS]][[ ]]/s/.*[[ ]]\([[^ ]]*\)/\1 DATA/'\'' | $SED -e '\''/^[[AITW]][[ ]]/s/.*[[ ]]//'\'' | sort | uniq > $export_symbols'

      if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
	# If the export-symbols file already is a .def file (1st line
	# is EXPORTS), use it as is; otherwise, prepend...
	_LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
	  cp $export_symbols $output_objdir/$soname.def;
	else
	  echo EXPORTS > $output_objdir/$soname.def;
	  cat $export_symbols >> $output_objdir/$soname.def;
	fi~
	$CC -shared $output_objdir/$soname.def $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
      else
	_LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;

    interix[[3-9]]*)
      _LT_TAGVAR(hardcode_direct, $1)=no
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
      # Hack: On Interix 3.x, we cannot compile PIC because of a broken gcc.
      # Instead, shared libraries are loaded at an image base (0x10000000 by
      # default) and relocated if they conflict, which is a slow very memory
      # consuming and fragmenting process.  To avoid this, we pick a random,
      # 256 KiB-aligned image base between 0x50000000 and 0x6FFC0000 at link
      # time.  Moving up from 0x10000000 also allows more sbrk(2) space.
      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
      _LT_TAGVAR(archive_expsym_cmds, $1)='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
      ;;

    gnu* | linux* | tpf* | k*bsd*-gnu)
      tmp_diet=no
      if test "$host_os" = linux-dietlibc; then
	case $cc_basename in
	  diet\ *) tmp_diet=yes;;	# linux-dietlibc with static linking (!diet-dyn)
	esac
      fi
      if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
	 && test "$tmp_diet" = no
      then
	tmp_addflag=
	tmp_sharedflag='-shared'
	case $cc_basename,$host_cpu in
        pgcc*)				# Portland Group C compiler
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
	  tmp_addflag=' $pic_flag'
	  ;;
	pgf77* | pgf90* | pgf95*)	# Portland Group f77 and f90 compilers
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
	  tmp_addflag=' $pic_flag -Mnomain' ;;
	ecc*,ia64* | icc*,ia64*)	# Intel C compiler on ia64
	  tmp_addflag=' -i_dynamic' ;;
	efc*,ia64* | ifort*,ia64*)	# Intel Fortran compiler on ia64
	  tmp_addflag=' -i_dynamic -nofor_main' ;;
	ifc* | ifort*)			# Intel Fortran compiler
	  tmp_addflag=' -nofor_main' ;;
	xl[[cC]]*)			# IBM XL C 8.0 on PPC (deal with xlf below)
	  tmp_sharedflag='-qmkshrobj'
	  tmp_addflag= ;;
	esac
	case `$CC -V 2>&1 | sed 5q` in
	*Sun\ C*)			# Sun C 5.9
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
	  _LT_TAGVAR(compiler_needs_object, $1)=yes
	  tmp_sharedflag='-G' ;;
	*Sun\ F*)			# Sun Fortran 8.3
	  tmp_sharedflag='-G' ;;
	esac
	_LT_TAGVAR(archive_cmds, $1)='$CC '"$tmp_sharedflag""$tmp_addflag"' $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'

        if test "x$supports_anon_versioning" = xyes; then
          _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $output_objdir/$libname.ver~
	    cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
	    echo "local: *; };" >> $output_objdir/$libname.ver~
	    $CC '"$tmp_sharedflag""$tmp_addflag"' $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-version-script ${wl}$output_objdir/$libname.ver -o $lib'
        fi

	case $cc_basename in
	xlf*)
	  # IBM XL Fortran 10.1 on PPC cannot create shared libs itself
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
	  _LT_TAGVAR(archive_cmds, $1)='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
	  if test "x$supports_anon_versioning" = xyes; then
	    _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $output_objdir/$libname.ver~
	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
	      echo "local: *; };" >> $output_objdir/$libname.ver~
	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
	  fi
	  ;;
	esac
      else
        _LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;

    netbsd*)
      if echo __ELF__ | $CC -E - | $GREP __ELF__ >/dev/null; then
	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
	wlarc=
      else
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
      fi
      ;;

    solaris*)
      if $LD -v 2>&1 | $GREP 'BFD 2\.8' > /dev/null; then
	_LT_TAGVAR(ld_shlibs, $1)=no
	cat <<_LT_EOF 1>&2

*** Warning: The releases 2.8.* of the GNU linker cannot reliably
*** create shared libraries on Solaris systems.  Therefore, libtool
*** is disabling shared libraries support.  We urge you to upgrade GNU
*** binutils to release 2.9.1 or newer.  Another option is to modify
*** your PATH or compiler configuration so that the native linker is
*** used, and then restart.

_LT_EOF
      elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
      else
	_LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;

    sysv5* | sco3.2v5* | sco5v6* | unixware* | OpenUNIX*)
      case `$LD -v 2>&1` in
        *\ [[01]].* | *\ 2.[[0-9]].* | *\ 2.1[[0-5]].*)
	_LT_TAGVAR(ld_shlibs, $1)=no
	cat <<_LT_EOF 1>&2

*** Warning: Releases of the GNU linker prior to 2.16.91.0.3 can not
*** reliably create shared libraries on SCO systems.  Therefore, libtool
*** is disabling shared libraries support.  We urge you to upgrade GNU
*** binutils to release 2.16.91.0.3 or newer.  Another option is to modify
*** your PATH or compiler configuration so that the native linker is
*** used, and then restart.

_LT_EOF
	;;
	*)
	  # For security reasons, it is highly recommended that you always
	  # use absolute paths for naming shared libraries, and exclude the
	  # DT_RUNPATH tag from executables and libraries.  But doing so
	  # requires that you compile everything twice, which is a pain.
	  if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
	  else
	    _LT_TAGVAR(ld_shlibs, $1)=no
	  fi
	;;
      esac
      ;;

    sunos4*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -assert pure-text -Bshareable -o $lib $libobjs $deplibs $linker_flags'
      wlarc=
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    *)
      if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
      else
	_LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;
    esac

    if test "$_LT_TAGVAR(ld_shlibs, $1)" = no; then
      runpath_var=
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
      _LT_TAGVAR(export_dynamic_flag_spec, $1)=
      _LT_TAGVAR(whole_archive_flag_spec, $1)=
    fi
  else
    # PORTME fill in a description of your system's linker (not GNU ld)
    case $host_os in
    aix3*)
      _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
      _LT_TAGVAR(always_export_symbols, $1)=yes
      _LT_TAGVAR(archive_expsym_cmds, $1)='$LD -o $output_objdir/$soname $libobjs $deplibs $linker_flags -bE:$export_symbols -T512 -H512 -bM:SRE~$AR $AR_FLAGS $lib $output_objdir/$soname'
      # Note: this linker hardcodes the directories in LIBPATH if there
      # are no directories specified by -L.
      _LT_TAGVAR(hardcode_minus_L, $1)=yes
      if test "$GCC" = yes && test -z "$lt_prog_compiler_static"; then
	# Neither direct hardcoding nor static linking is supported with a
	# broken collect2.
	_LT_TAGVAR(hardcode_direct, $1)=unsupported
      fi
      ;;

    aix[[4-9]]*)
      if test "$host_cpu" = ia64; then
	# On IA64, the linker does run time linking by default, so we don't
	# have to do anything special.
	aix_use_runtimelinking=no
	exp_sym_flag='-Bexport'
	no_entry_flag=""
      else
	# If we're using GNU nm, then we don't want the "-C" option.
	# -C means demangle to AIX nm, but means don't demangle with GNU nm
	if $NM -V 2>&1 | $GREP 'GNU' > /dev/null; then
	  _LT_TAGVAR(export_symbols_cmds, $1)='$NM -Bpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
	else
	  _LT_TAGVAR(export_symbols_cmds, $1)='$NM -BCpg $libobjs $convenience | awk '\''{ if (((\$ 2 == "T") || (\$ 2 == "D") || (\$ 2 == "B")) && ([substr](\$ 3,1,1) != ".")) { print \$ 3 } }'\'' | sort -u > $export_symbols'
	fi
	aix_use_runtimelinking=no

	# Test if we are trying to use run time linking or normal
	# AIX style linking. If -brtl is somewhere in LDFLAGS, we
	# need to do runtime linking.
	case $host_os in aix4.[[23]]|aix4.[[23]].*|aix[[5-9]]*)
	  for ld_flag in $LDFLAGS; do
	  if (test $ld_flag = "-brtl" || test $ld_flag = "-Wl,-brtl"); then
	    aix_use_runtimelinking=yes
	    break
	  fi
	  done
	  ;;
	esac

	exp_sym_flag='-bexport'
	no_entry_flag='-bnoentry'
      fi

      # When large executables or shared objects are built, AIX ld can
      # have problems creating the table of contents.  If linking a library
      # or program results in "error TOC overflow" add -mminimal-toc to
      # CXXFLAGS/CFLAGS for g++/gcc.  In the cases where that is not
      # enough to fix the problem, add -Wl,-bbigtoc to LDFLAGS.

      _LT_TAGVAR(archive_cmds, $1)=''
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_direct_absolute, $1)=yes
      _LT_TAGVAR(hardcode_libdir_separator, $1)=':'
      _LT_TAGVAR(link_all_deplibs, $1)=yes
      _LT_TAGVAR(file_list_spec, $1)='${wl}-f,'

      if test "$GCC" = yes; then
	case $host_os in aix4.[[012]]|aix4.[[012]].*)
	# We only want to do this on AIX 4.2 and lower, the check
	# below for broken collect2 doesn't work under 4.3+
	  collect2name=`${CC} -print-prog-name=collect2`
	  if test -f "$collect2name" &&
	   strings "$collect2name" | $GREP resolve_lib_name >/dev/null
	  then
	  # We have reworked collect2
	  :
	  else
	  # We have old collect2
	  _LT_TAGVAR(hardcode_direct, $1)=unsupported
	  # It fails to find uninstalled libraries when the uninstalled
	  # path is not listed in the libpath.  Setting hardcode_minus_L
	  # to unsupported forces relinking
	  _LT_TAGVAR(hardcode_minus_L, $1)=yes
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
	  _LT_TAGVAR(hardcode_libdir_separator, $1)=
	  fi
	  ;;
	esac
	shared_flag='-shared'
	if test "$aix_use_runtimelinking" = yes; then
	  shared_flag="$shared_flag "'${wl}-G'
	fi
      else
	# not using gcc
	if test "$host_cpu" = ia64; then
	# VisualAge C++, Version 5.5 for AIX 5L for IA-64, Beta 3 Release
	# chokes on -Wl,-G. The following line is correct:
	  shared_flag='-G'
	else
	  if test "$aix_use_runtimelinking" = yes; then
	    shared_flag='${wl}-G'
	  else
	    shared_flag='${wl}-bM:SRE'
	  fi
	fi
      fi

      # It seems that -bexpall does not export symbols beginning with
      # underscore (_), so it is better to generate a list of symbols to export.
      _LT_TAGVAR(always_export_symbols, $1)=yes
      if test "$aix_use_runtimelinking" = yes; then
	# Warning - without using the other runtime loading flags (-brtl),
	# -berok will link without error, but may produce a broken library.
	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
        # Determine the default libpath from the value encoded in an
        # empty executable.
        _LT_SYS_MODULE_PATH_AIX
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then $ECHO "X${wl}${allow_undefined_flag}" | $Xsed; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
      else
	if test "$host_cpu" = ia64; then
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $libdir:/usr/lib:/lib'
	  _LT_TAGVAR(allow_undefined_flag, $1)="-z nodefs"
	  _LT_TAGVAR(archive_expsym_cmds, $1)="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags ${wl}${allow_undefined_flag} '"\${wl}$exp_sym_flag:\$export_symbols"
	else
	 # Determine the default libpath from the value encoded in an
	 # empty executable.
	 _LT_SYS_MODULE_PATH_AIX
	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
	  # Warning - without using the other run time loading flags,
	  # -berok will link without error, but may produce a broken library.
	  _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-bernotok'
	  _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-berok'
	  # Exported symbols can be pulled into shared objects from archives
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
	  _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
	  # This is similar to how AIX traditionally builds its shared libraries.
	  _LT_TAGVAR(archive_expsym_cmds, $1)="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs ${wl}-bnoentry $compiler_flags ${wl}-bE:$export_symbols${allow_undefined_flag}~$AR $AR_FLAGS $output_objdir/$libname$release.a $output_objdir/$soname'
	fi
      fi
      ;;

    amigaos*)
      case $host_cpu in
      powerpc)
            # see comment about AmigaOS4 .so support
            _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
            _LT_TAGVAR(archive_expsym_cmds, $1)=''
        ;;
      m68k)
            _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/a2ixlibrary.data~$ECHO "#define NAME $libname" > $output_objdir/a2ixlibrary.data~$ECHO "#define LIBRARY_ID 1" >> $output_objdir/a2ixlibrary.data~$ECHO "#define VERSION $major" >> $output_objdir/a2ixlibrary.data~$ECHO "#define REVISION $revision" >> $output_objdir/a2ixlibrary.data~$AR $AR_FLAGS $lib $libobjs~$RANLIB $lib~(cd $output_objdir && a2ixlibrary -32)'
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
            _LT_TAGVAR(hardcode_minus_L, $1)=yes
        ;;
      esac
      ;;

    bsdi[[45]]*)
      _LT_TAGVAR(export_dynamic_flag_spec, $1)=-rdynamic
      ;;

    cygwin* | mingw* | pw32*)
      # When not using gcc, we currently assume that we are using
      # Microsoft Visual C++.
      # hardcode_libdir_flag_spec is actually meaningless, as there is
      # no search path for DLLs.
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=' '
      _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
      # Tell ltmain to make .lib files, not .a files.
      libext=lib
      # Tell ltmain to make .dll files, not .so files.
      shrext_cmds=".dll"
      # FIXME: Setting linknames here is a bad hack.
      _LT_TAGVAR(archive_cmds, $1)='$CC -o $lib $libobjs $compiler_flags `$ECHO "X$deplibs" | $Xsed -e '\''s/ -lc$//'\''` -link -dll~linknames='
      # The linker will automatically build a .lib file if we build a DLL.
      _LT_TAGVAR(old_archive_from_new_cmds, $1)='true'
      # FIXME: Should let the user specify the lib program.
      _LT_TAGVAR(old_archive_cmds, $1)='lib -OUT:$oldlib$oldobjs$old_deplibs'
      _LT_TAGVAR(fix_srcfile_path, $1)='`cygpath -w "$srcfile"`'
      _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
      ;;

    darwin* | rhapsody*)
      _LT_DARWIN_LINKER_FEATURES($1)
      ;;

    dgux*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    freebsd1*)
      _LT_TAGVAR(ld_shlibs, $1)=no
      ;;

    # FreeBSD 2.2.[012] allows us to include c++rt0.o to get C++ constructor
    # support.  Future versions do this automatically, but an explicit c++rt0.o
    # does not break anything, and helps significantly (at the cost of a little
    # extra space).
    freebsd2.2*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags /usr/lib/c++rt0.o'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    # Unfortunately, older versions of FreeBSD 2 do not have this feature.
    freebsd2*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_minus_L, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
    freebsd* | dragonfly*)
      _LT_TAGVAR(archive_cmds, $1)='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    hpux9*)
      if test "$GCC" = yes; then
	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
      else
	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
      fi
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=:
      _LT_TAGVAR(hardcode_direct, $1)=yes

      # hardcode_minus_L: Not really in the search PATH,
      # but as the default location of the library.
      _LT_TAGVAR(hardcode_minus_L, $1)=yes
      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
      ;;

    hpux10*)
      if test "$GCC" = yes -a "$with_gnu_ld" = no; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
      else
	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
      fi
      if test "$with_gnu_ld" = no; then
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
	_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='+b $libdir'
	_LT_TAGVAR(hardcode_libdir_separator, $1)=:
	_LT_TAGVAR(hardcode_direct, $1)=yes
	_LT_TAGVAR(hardcode_direct_absolute, $1)=yes
	_LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
	# hardcode_minus_L: Not really in the search PATH,
	# but as the default location of the library.
	_LT_TAGVAR(hardcode_minus_L, $1)=yes
      fi
      ;;

    hpux11*)
      if test "$GCC" = yes -a "$with_gnu_ld" = no; then
	case $host_cpu in
	hppa*64*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	ia64*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	esac
      else
	case $host_cpu in
	hppa*64*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	ia64*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	esac
      fi
      if test "$with_gnu_ld" = no; then
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
	_LT_TAGVAR(hardcode_libdir_separator, $1)=:

	case $host_cpu in
	hppa*64*|ia64*)
	  _LT_TAGVAR(hardcode_direct, $1)=no
	  _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	  ;;
	*)
	  _LT_TAGVAR(hardcode_direct, $1)=yes
	  _LT_TAGVAR(hardcode_direct_absolute, $1)=yes
	  _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'

	  # hardcode_minus_L: Not really in the search PATH,
	  # but as the default location of the library.
	  _LT_TAGVAR(hardcode_minus_L, $1)=yes
	  ;;
	esac
      fi
      ;;

    irix5* | irix6* | nonstopux*)
      if test "$GCC" = yes; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
	# Try to use the -exported_symbol ld option, if it does not
	# work, assume that -exports_file does not work either and
	# implicitly export all symbols.
        save_LDFLAGS="$LDFLAGS"
        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
        AC_LINK_IFELSE(int foo(void) {},
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
        )
        LDFLAGS="$save_LDFLAGS"
      else
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
      fi
      _LT_TAGVAR(archive_cmds_need_lc, $1)='no'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=:
      _LT_TAGVAR(inherit_rpath, $1)=yes
      _LT_TAGVAR(link_all_deplibs, $1)=yes
      ;;

    netbsd*)
      if echo __ELF__ | $CC -E - | $GREP __ELF__ >/dev/null; then
	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'  # a.out
      else
	_LT_TAGVAR(archive_cmds, $1)='$LD -shared -o $lib $libobjs $deplibs $linker_flags'      # ELF
      fi
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    newsos6)
      _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=:
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    *nto* | *qnx*)
      ;;

    openbsd*)
      if test -f /usr/libexec/ld.so; then
	_LT_TAGVAR(hardcode_direct, $1)=yes
	_LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	_LT_TAGVAR(hardcode_direct_absolute, $1)=yes
	if test -z "`echo __ELF__ | $CC -E - | $GREP __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
	  _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags ${wl}-retain-symbols-file,$export_symbols'
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	  _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
	else
	  case $host_os in
	   openbsd[[01]].* | openbsd2.[[0-7]] | openbsd2.[[0-7]].*)
	     _LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable -o $lib $libobjs $deplibs $linker_flags'
	     _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
	     ;;
	   *)
	     _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
	     _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	     ;;
	  esac
	fi
      else
	_LT_TAGVAR(ld_shlibs, $1)=no
      fi
      ;;

    os2*)
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
      _LT_TAGVAR(hardcode_minus_L, $1)=yes
      _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
      _LT_TAGVAR(archive_cmds, $1)='$ECHO "LIBRARY $libname INITINSTANCE" > $output_objdir/$libname.def~$ECHO "DESCRIPTION \"$libname\"" >> $output_objdir/$libname.def~$ECHO DATA >> $output_objdir/$libname.def~$ECHO " SINGLE NONSHARED" >> $output_objdir/$libname.def~$ECHO EXPORTS >> $output_objdir/$libname.def~emxexp $libobjs >> $output_objdir/$libname.def~$CC -Zdll -Zcrtdll -o $lib $libobjs $deplibs $compiler_flags $output_objdir/$libname.def'
      _LT_TAGVAR(old_archive_from_new_cmds, $1)='emximp -o $output_objdir/$libname.a $output_objdir/$libname.def'
      ;;

    osf3*)
      if test "$GCC" = yes; then
	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
      else
	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
      fi
      _LT_TAGVAR(archive_cmds_need_lc, $1)='no'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=:
      ;;

    osf4* | osf5*)	# as osf3* with the addition of -msym flag
      if test "$GCC" = yes; then
	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
      else
	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags -msym -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='for i in `cat $export_symbols`; do printf "%s %s\\n" -exported_symbol "\$i" >> $lib.exp; done; printf "%s\\n" "-hidden">> $lib.exp~
	$CC -shared${allow_undefined_flag} ${wl}-input ${wl}$lib.exp $compiler_flags $libobjs $deplibs -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib~$RM $lib.exp'

	# Both c and cxx compiler support -rpath directly
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-rpath $libdir'
      fi
      _LT_TAGVAR(archive_cmds_need_lc, $1)='no'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=:
      ;;

    solaris*)
      _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
      if test "$GCC" = yes; then
	wlarc='${wl}'
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
	_LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
      else
	case `$CC -V 2>&1` in
	*"Compilers 5.0"*)
	  wlarc=''
	  _LT_TAGVAR(archive_cmds, $1)='$LD -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $linker_flags'
	  _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
	  $LD -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $linker_flags~$RM $lib.exp'
	  ;;
	*)
	  wlarc='${wl}'
	  _LT_TAGVAR(archive_cmds, $1)='$CC -G${allow_undefined_flag} -h $soname -o $lib $libobjs $deplibs $compiler_flags'
	  _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
	  $CC -G${allow_undefined_flag} -M $lib.exp -h $soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
	  ;;
	esac
      fi
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      case $host_os in
      solaris2.[[0-5]] | solaris2.[[0-5]].*) ;;
      *)
	# The compiler driver will combine and reorder linker options,
	# but understands `-z linker_flag'.  GCC discards it without `$wl',
	# but is careful enough not to reorder.
	# Supported since Solaris 2.6 (maybe 2.5.1?)
	if test "$GCC" = yes; then
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}-z ${wl}allextract$convenience ${wl}-z ${wl}defaultextract'
	else
	  _LT_TAGVAR(whole_archive_flag_spec, $1)='-z allextract$convenience -z defaultextract'
	fi
	;;
      esac
      _LT_TAGVAR(link_all_deplibs, $1)=yes
      ;;

    sunos4*)
      if test "x$host_vendor" = xsequent; then
	# Use $CC to link under sequent, because it throws in some extra .o
	# files that make .init and .fini sections work.
	_LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h $soname -o $lib $libobjs $deplibs $compiler_flags'
      else
	_LT_TAGVAR(archive_cmds, $1)='$LD -assert pure-text -Bstatic -o $lib $libobjs $deplibs $linker_flags'
      fi
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
      _LT_TAGVAR(hardcode_direct, $1)=yes
      _LT_TAGVAR(hardcode_minus_L, $1)=yes
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    sysv4)
      case $host_vendor in
	sni)
	  _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
	  _LT_TAGVAR(hardcode_direct, $1)=yes # is this really true???
	;;
	siemens)
	  ## LD is ld it makes a PLAMLIB
	  ## CC just makes a GrossModule.
	  _LT_TAGVAR(archive_cmds, $1)='$LD -G -o $lib $libobjs $deplibs $linker_flags'
	  _LT_TAGVAR(reload_cmds, $1)='$CC -r -o $output$reload_objs'
	  _LT_TAGVAR(hardcode_direct, $1)=no
        ;;
	motorola)
	  _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
	  _LT_TAGVAR(hardcode_direct, $1)=no #Motorola manual says yes, but my tests say they lie
	;;
      esac
      runpath_var='LD_RUN_PATH'
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    sysv4.3*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      _LT_TAGVAR(export_dynamic_flag_spec, $1)='-Bexport'
      ;;

    sysv4*MP*)
      if test -d /usr/nec; then
	_LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
	_LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	runpath_var=LD_RUN_PATH
	hardcode_runpath_var=yes
	_LT_TAGVAR(ld_shlibs, $1)=yes
      fi
      ;;

    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[[01]].[[10]]* | unixware7* | sco3.2v5.0.[[024]]*)
      _LT_TAGVAR(no_undefined_flag, $1)='${wl}-z,text'
      _LT_TAGVAR(archive_cmds_need_lc, $1)=no
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      runpath_var='LD_RUN_PATH'

      if test "$GCC" = yes; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
      else
	_LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
      fi
      ;;

    sysv5* | sco3.2v5* | sco5v6*)
      # Note: We can NOT use -z defs as we might desire, because we do not
      # link with -lc, and that would cause any symbols used from libc to
      # always be unresolved, which means just about no library would
      # ever link correctly.  If we're not using GNU ld we use -z text
      # though, which does catch some bad symbols but isn't as heavy-handed
      # as -z defs.
      _LT_TAGVAR(no_undefined_flag, $1)='${wl}-z,text'
      _LT_TAGVAR(allow_undefined_flag, $1)='${wl}-z,nodefs'
      _LT_TAGVAR(archive_cmds_need_lc, $1)=no
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R,$libdir'
      _LT_TAGVAR(hardcode_libdir_separator, $1)=':'
      _LT_TAGVAR(link_all_deplibs, $1)=yes
      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-Bexport'
      runpath_var='LD_RUN_PATH'

      if test "$GCC" = yes; then
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
      else
	_LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
      fi
      ;;

    uts4*)
      _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      ;;

    *)
      _LT_TAGVAR(ld_shlibs, $1)=no
      ;;
    esac

    if test x$host_vendor = xsni; then
      case $host in
      sysv4 | sysv4.2uw2* | sysv4.3* | sysv5*)
	_LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-Blargedynsym'
	;;
      esac
    fi
  fi
])
AC_MSG_RESULT([$_LT_TAGVAR(ld_shlibs, $1)])
test "$_LT_TAGVAR(ld_shlibs, $1)" = no && can_build_shared=no

_LT_TAGVAR(with_gnu_ld, $1)=$with_gnu_ld

_LT_DECL([], [libext], [0], [Old archive suffix (normally "a")])dnl
_LT_DECL([], [shrext_cmds], [1], [Shared library suffix (normally ".so")])dnl
_LT_DECL([], [extract_expsyms_cmds], [2],
    [The commands to extract the exported symbol list from a shared archive])

#
# Do we need to explicitly link libc?
#
case "x$_LT_TAGVAR(archive_cmds_need_lc, $1)" in
x|xyes)
  # Assume -lc should be added
  _LT_TAGVAR(archive_cmds_need_lc, $1)=yes

  if test "$enable_shared" = yes && test "$GCC" = yes; then
    case $_LT_TAGVAR(archive_cmds, $1) in
    *'~'*)
      # FIXME: we may have to deal with multi-command sequences.
      ;;
    '$CC '*)
      # Test whether the compiler implicitly links with -lc since on some
      # systems, -lgcc has to come before -lc. If gcc already passes -lc
      # to ld, don't add -lc before -lgcc.
      AC_MSG_CHECKING([whether -lc should be explicitly linked in])
      $RM conftest*
      echo "$lt_simple_compile_test_code" > conftest.$ac_ext

      if AC_TRY_EVAL(ac_compile) 2>conftest.err; then
        soname=conftest
        lib=conftest
        libobjs=conftest.$ac_objext
        deplibs=
        wl=$_LT_TAGVAR(lt_prog_compiler_wl, $1)
	pic_flag=$_LT_TAGVAR(lt_prog_compiler_pic, $1)
        compiler_flags=-v
        linker_flags=-v
        verstring=
        output_objdir=.
        libname=conftest
        lt_save_allow_undefined_flag=$_LT_TAGVAR(allow_undefined_flag, $1)
        _LT_TAGVAR(allow_undefined_flag, $1)=
        if AC_TRY_EVAL(_LT_TAGVAR(archive_cmds, $1) 2\>\&1 \| $GREP \" -lc \" \>/dev/null 2\>\&1)
        then
	  _LT_TAGVAR(archive_cmds_need_lc, $1)=no
        else
	  _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
        fi
        _LT_TAGVAR(allow_undefined_flag, $1)=$lt_save_allow_undefined_flag
      else
        cat conftest.err 1>&5
      fi
      $RM conftest*
      AC_MSG_RESULT([$_LT_TAGVAR(archive_cmds_need_lc, $1)])
      ;;
    esac
  fi
  ;;
esac

_LT_TAGDECL([build_libtool_need_lc], [archive_cmds_need_lc], [0],
    [Whether or not to add -lc for building shared libraries])
_LT_TAGDECL([allow_libtool_libs_with_static_runtimes],
    [enable_shared_with_static_runtimes], [0],
    [Whether or not to disallow shared libs when runtime libs are static])
_LT_TAGDECL([], [export_dynamic_flag_spec], [1],
    [Compiler flag to allow reflexive dlopens])
_LT_TAGDECL([], [whole_archive_flag_spec], [1],
    [Compiler flag to generate shared objects directly from archives])
_LT_TAGDECL([], [compiler_needs_object], [1],
    [Whether the compiler copes with passing no objects directly])
_LT_TAGDECL([], [old_archive_from_new_cmds], [2],
    [Create an old-style archive from a shared archive])
_LT_TAGDECL([], [old_archive_from_expsyms_cmds], [2],
    [Create a temporary old-style archive to link instead of a shared archive])
_LT_TAGDECL([], [archive_cmds], [2], [Commands used to build a shared archive])
_LT_TAGDECL([], [archive_expsym_cmds], [2])
_LT_TAGDECL([], [module_cmds], [2],
    [Commands used to build a loadable module if different from building
    a shared archive.])
_LT_TAGDECL([], [module_expsym_cmds], [2])
_LT_TAGDECL([], [with_gnu_ld], [1],
    [Whether we are building with GNU ld or not])
_LT_TAGDECL([], [allow_undefined_flag], [1],
    [Flag that allows shared libraries with undefined symbols to be built])
_LT_TAGDECL([], [no_undefined_flag], [1],
    [Flag that enforces no undefined symbols])
_LT_TAGDECL([], [hardcode_libdir_flag_spec], [1],
    [Flag to hardcode $libdir into a binary during linking.
    This must work even if $libdir does not exist])
_LT_TAGDECL([], [hardcode_libdir_flag_spec_ld], [1],
    [[If ld is used when linking, flag to hardcode $libdir into a binary
    during linking.  This must work even if $libdir does not exist]])
_LT_TAGDECL([], [hardcode_libdir_separator], [1],
    [Whether we need a single "-rpath" flag with a separated argument])
_LT_TAGDECL([], [hardcode_direct], [0],
    [Set to "yes" if using DIR/libNAME${shared_ext} during linking hardcodes
    DIR into the resulting binary])
_LT_TAGDECL([], [hardcode_direct_absolute], [0],
    [Set to "yes" if using DIR/libNAME${shared_ext} during linking hardcodes
    DIR into the resulting binary and the resulting library dependency is
    "absolute", i.e impossible to change by setting ${shlibpath_var} if the
    library is relocated])
_LT_TAGDECL([], [hardcode_minus_L], [0],
    [Set to "yes" if using the -LDIR flag during linking hardcodes DIR
    into the resulting binary])
_LT_TAGDECL([], [hardcode_shlibpath_var], [0],
    [Set to "yes" if using SHLIBPATH_VAR=DIR during linking hardcodes DIR
    into the resulting binary])
_LT_TAGDECL([], [hardcode_automatic], [0],
    [Set to "yes" if building a shared library automatically hardcodes DIR
    into the library and all subsequent libraries and executables linked
    against it])
_LT_TAGDECL([], [inherit_rpath], [0],
    [Set to yes if linker adds runtime paths of dependent libraries
    to runtime path list])
_LT_TAGDECL([], [link_all_deplibs], [0],
    [Whether libtool must link a program against all its dependency libraries])
_LT_TAGDECL([], [fix_srcfile_path], [1],
    [Fix the shell variable $srcfile for the compiler])
_LT_TAGDECL([], [always_export_symbols], [0],
    [Set to "yes" if exported symbols are required])
_LT_TAGDECL([], [export_symbols_cmds], [2],
    [The commands to list exported symbols])
_LT_TAGDECL([], [exclude_expsyms], [1],
    [Symbols that should not be listed in the preloaded symbols])
_LT_TAGDECL([], [include_expsyms], [1],
    [Symbols that must always be exported])
_LT_TAGDECL([], [prelink_cmds], [2],
    [Commands necessary for linking programs (against libraries) with templates])
_LT_TAGDECL([], [file_list_spec], [1],
    [Specify filename containing input files])
dnl FIXME: Not yet implemented
dnl _LT_TAGDECL([], [thread_safe_flag_spec], [1],
dnl    [Compiler flag to generate thread safe objects])
])# _LT_LINKER_SHLIBS


# _LT_LANG_C_CONFIG([TAG])
# ------------------------
# Ensure that the configuration variables for a C compiler are suitably
# defined.  These variables are subsequently used by _LT_CONFIG to write
# the compiler configuration to `libtool'.
m4_defun([_LT_LANG_C_CONFIG],
[m4_require([_LT_DECL_EGREP])dnl
lt_save_CC="$CC"
AC_LANG_PUSH(C)

# Source file extension for C test sources.
ac_ext=c

# Object file extension for compiled C test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# Code to be used in simple compile tests
lt_simple_compile_test_code="int some_variable = 0;"

# Code to be used in simple link tests
lt_simple_link_test_code='int main(){return(0);}'

_LT_TAG_COMPILER
# Save the default compiler, since it gets overwritten when the other
# tags are being tested, and _LT_TAGVAR(compiler, []) is a NOP.
compiler_DEFAULT=$CC

# save warnings/boilerplate of simple test code
_LT_COMPILER_BOILERPLATE
_LT_LINKER_BOILERPLATE

if test -n "$compiler"; then
  _LT_COMPILER_NO_RTTI($1)
  _LT_COMPILER_PIC($1)
  _LT_COMPILER_C_O($1)
  _LT_COMPILER_FILE_LOCKS($1)
  _LT_LINKER_SHLIBS($1)
  _LT_SYS_DYNAMIC_LINKER($1)
  _LT_LINKER_HARDCODE_LIBPATH($1)
  LT_SYS_DLOPEN_SELF
  _LT_CMD_STRIPLIB

  # Report which library types will actually be built
  AC_MSG_CHECKING([if libtool supports shared libraries])
  AC_MSG_RESULT([$can_build_shared])

  AC_MSG_CHECKING([whether to build shared libraries])
  test "$can_build_shared" = "no" && enable_shared=no

  # On AIX, shared libraries and static libraries use the same namespace, and
  # are all built from PIC.
  case $host_os in
  aix3*)
    test "$enable_shared" = yes && enable_static=no
    if test -n "$RANLIB"; then
      archive_cmds="$archive_cmds~\$RANLIB \$lib"
      postinstall_cmds='$RANLIB $lib'
    fi
    ;;

  aix[[4-9]]*)
    if test "$host_cpu" != ia64 && test "$aix_use_runtimelinking" = no ; then
      test "$enable_shared" = yes && enable_static=no
    fi
    ;;
  esac
  AC_MSG_RESULT([$enable_shared])

  AC_MSG_CHECKING([whether to build static libraries])
  # Make sure either enable_shared or enable_static is yes.
  test "$enable_shared" = yes || enable_static=yes
  AC_MSG_RESULT([$enable_static])

  _LT_CONFIG($1)
fi
AC_LANG_POP
CC="$lt_save_CC"
])# _LT_LANG_C_CONFIG


# _LT_PROG_CXX
# ------------
# Since AC_PROG_CXX is broken, in that it returns g++ if there is no c++
# compiler, we have our own version here.
m4_defun([_LT_PROG_CXX],
[
pushdef([AC_MSG_ERROR], [_lt_caught_CXX_error=yes])
AC_PROG_CXX
if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
    ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
    (test "X$CXX" != "Xg++"))) ; then
  AC_PROG_CXXCPP
else
  _lt_caught_CXX_error=yes
fi
popdef([AC_MSG_ERROR])
])# _LT_PROG_CXX

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([_LT_PROG_CXX], [])


# _LT_LANG_CXX_CONFIG([TAG])
# --------------------------
# Ensure that the configuration variables for a C++ compiler are suitably
# defined.  These variables are subsequently used by _LT_CONFIG to write
# the compiler configuration to `libtool'.
m4_defun([_LT_LANG_CXX_CONFIG],
[AC_REQUIRE([_LT_PROG_CXX])dnl
m4_require([_LT_FILEUTILS_DEFAULTS])dnl
m4_require([_LT_DECL_EGREP])dnl

AC_LANG_PUSH(C++)
_LT_TAGVAR(archive_cmds_need_lc, $1)=no
_LT_TAGVAR(allow_undefined_flag, $1)=
_LT_TAGVAR(always_export_symbols, $1)=no
_LT_TAGVAR(archive_expsym_cmds, $1)=
_LT_TAGVAR(compiler_needs_object, $1)=no
_LT_TAGVAR(export_dynamic_flag_spec, $1)=
_LT_TAGVAR(hardcode_direct, $1)=no
_LT_TAGVAR(hardcode_direct_absolute, $1)=no
_LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
_LT_TAGVAR(hardcode_libdir_separator, $1)=
_LT_TAGVAR(hardcode_minus_L, $1)=no
_LT_TAGVAR(hardcode_shlibpath_var, $1)=unsupported
_LT_TAGVAR(hardcode_automatic, $1)=no
_LT_TAGVAR(inherit_rpath, $1)=no
_LT_TAGVAR(module_cmds, $1)=
_LT_TAGVAR(module_expsym_cmds, $1)=
_LT_TAGVAR(link_all_deplibs, $1)=unknown
_LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
_LT_TAGVAR(no_undefined_flag, $1)=
_LT_TAGVAR(whole_archive_flag_spec, $1)=
_LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no

# Source file extension for C++ test sources.
ac_ext=cpp

# Object file extension for compiled C++ test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# No sense in running all these tests if we already determined that
# the CXX compiler isn't working.  Some variables (like enable_shared)
# are currently assumed to apply to all compilers on this platform,
# and will be corrupted by setting them based on a non-working compiler.
if test "$_lt_caught_CXX_error" != yes; then
  # Code to be used in simple compile tests
  lt_simple_compile_test_code="int some_variable = 0;"

  # Code to be used in simple link tests
  lt_simple_link_test_code='int main(int, char *[[]]) { return(0); }'

  # ltmain only uses $CC for tagged configurations so make sure $CC is set.
  _LT_TAG_COMPILER

  # save warnings/boilerplate of simple test code
  _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE

  # Allow CC to be a program name with arguments.
  lt_save_CC=$CC
  lt_save_LD=$LD
  lt_save_GCC=$GCC
  GCC=$GXX
  lt_save_with_gnu_ld=$with_gnu_ld
  lt_save_path_LD=$lt_cv_path_LD
  if test -n "${lt_cv_prog_gnu_ldcxx+set}"; then
    lt_cv_prog_gnu_ld=$lt_cv_prog_gnu_ldcxx
  else
    $as_unset lt_cv_prog_gnu_ld
  fi
  if test -n "${lt_cv_path_LDCXX+set}"; then
    lt_cv_path_LD=$lt_cv_path_LDCXX
  else
    $as_unset lt_cv_path_LD
  fi
  test -z "${LDCXX+set}" || LD=$LDCXX
  CC=${CXX-"c++"}
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])

  if test -n "$compiler"; then
    # We don't want -fno-exception when compiling C++ code, so set the
    # no_builtin_flag separately
    if test "$GXX" = yes; then
      _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=' -fno-builtin'
    else
      _LT_TAGVAR(lt_prog_compiler_no_builtin_flag, $1)=
    fi

    if test "$GXX" = yes; then
      # Set up default GNU C++ configuration

      LT_PATH_LD

      # Check if GNU C++ uses GNU ld as the underlying linker, since the
      # archiving commands below assume that GNU ld is being used.
      if test "$with_gnu_ld" = yes; then
        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'

        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'

        # If archive_cmds runs LD, not CC, wlarc should be empty
        # XXX I think wlarc can be eliminated in ltcf-cxx, but I need to
        #     investigate it a little bit more. (MM)
        wlarc='${wl}'

        # ancient GNU ld didn't support --whole-archive et. al.
        if eval "`$CC -print-prog-name=ld` --help 2>&1" |
	  $GREP 'no-whole-archive' > /dev/null; then
          _LT_TAGVAR(whole_archive_flag_spec, $1)="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
        else
          _LT_TAGVAR(whole_archive_flag_spec, $1)=
        fi
      else
        with_gnu_ld=no
        wlarc=

        # A generic and very simple default shared library creation
        # command for GNU C++ for the case where it uses the native
        # linker, instead of GNU ld.  If possible, this setting should
        # overridden to take advantage of the native linker features on
        # the platform it is being used on.
        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $lib'
      fi

      # Commands to make compiler produce verbose output that lists
      # what "hidden" libraries, object files and flags are used when
      # linking a shared library.
      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'

    else
      GXX=no
      with_gnu_ld=no
      wlarc=
    fi

    # PORTME: fill in a description of your system's C++ link characteristics
    AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
    _LT_TAGVAR(ld_shlibs, $1)=yes
    case $host_os in
      aix3*)
        # FIXME: insert proper C++ library support
        _LT_TAGVAR(ld_shlibs, $1)=no
        ;;
      aix[[4-9]]*)
        if test "$host_cpu" = ia64; then
          # On IA64, the linker does run time linking by default, so we don't
          # have to do anything special.
          aix_use_runtimelinking=no
          exp_sym_flag='-Bexport'
          no_entry_flag=""
        else
          aix_use_runtimelinking=no

          # Test if we are trying to use run time linking or normal
          # AIX style linking. If -brtl is somewhere in LDFLAGS, we
          # need to do runtime linking.
          case $host_os in aix4.[[23]]|aix4.[[23]].*|aix[[5-9]]*)
	    for ld_flag in $LDFLAGS; do
	      case $ld_flag in
	      *-brtl*)
	        aix_use_runtimelinking=yes
	        break
	        ;;
	      esac
	    done
	    ;;
          esac

          exp_sym_flag='-bexport'
          no_entry_flag='-bnoentry'
        fi

        # When large executables or shared objects are built, AIX ld can
        # have problems creating the table of contents.  If linking a library
        # or program results in "error TOC overflow" add -mminimal-toc to
        # CXXFLAGS/CFLAGS for g++/gcc.  In the cases where that is not
        # enough to fix the problem, add -Wl,-bbigtoc to LDFLAGS.

        _LT_TAGVAR(archive_cmds, $1)=''
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_direct_absolute, $1)=yes
        _LT_TAGVAR(hardcode_libdir_separator, $1)=':'
        _LT_TAGVAR(link_all_deplibs, $1)=yes
        _LT_TAGVAR(file_list_spec, $1)='${wl}-f,'

        if test "$GXX" = yes; then
          case $host_os in aix4.[[012]]|aix4.[[012]].*)
          # We only want to do this on AIX 4.2 and lower, the check
          # below for broken collect2 doesn't work under 4.3+
	  collect2name=`${CC} -print-prog-name=collect2`
	  if test -f "$collect2name" &&
	     strings "$collect2name" | $GREP resolve_lib_name >/dev/null
	  then
	    # We have reworked collect2
	    :
	  else
	    # We have old collect2
	    _LT_TAGVAR(hardcode_direct, $1)=unsupported
	    # It fails to find uninstalled libraries when the uninstalled
	    # path is not listed in the libpath.  Setting hardcode_minus_L
	    # to unsupported forces relinking
	    _LT_TAGVAR(hardcode_minus_L, $1)=yes
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
	    _LT_TAGVAR(hardcode_libdir_separator, $1)=
	  fi
          esac
          shared_flag='-shared'
	  if test "$aix_use_runtimelinking" = yes; then
	    shared_flag="$shared_flag "'${wl}-G'
	  fi
        else
          # not using gcc
          if test "$host_cpu" = ia64; then
	  # VisualAge C++, Version 5.5 for AIX 5L for IA-64, Beta 3 Release
	  # chokes on -Wl,-G. The following line is correct:
	  shared_flag='-G'
          else
	    if test "$aix_use_runtimelinking" = yes; then
	      shared_flag='${wl}-G'
	    else
	      shared_flag='${wl}-bM:SRE'
	    fi
          fi
        fi

        # It seems that -bexpall does not export symbols beginning with
        # underscore (_), so it is better to generate a list of symbols to
	# export.
        _LT_TAGVAR(always_export_symbols, $1)=yes
        if test "$aix_use_runtimelinking" = yes; then
          # Warning - without using the other runtime loading flags (-brtl),
          # -berok will link without error, but may produce a broken library.
          _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an empty
          # executable.
          _LT_SYS_MODULE_PATH_AIX
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"

          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then $ECHO "X${wl}${allow_undefined_flag}" | $Xsed; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
          if test "$host_cpu" = ia64; then
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $libdir:/usr/lib:/lib'
	    _LT_TAGVAR(allow_undefined_flag, $1)="-z nodefs"
	    _LT_TAGVAR(archive_expsym_cmds, $1)="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags ${wl}${allow_undefined_flag} '"\${wl}$exp_sym_flag:\$export_symbols"
          else
	    # Determine the default libpath from the value encoded in an
	    # empty executable.
	    _LT_SYS_MODULE_PATH_AIX
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
	    # Warning - without using the other run time loading flags,
	    # -berok will link without error, but may produce a broken library.
	    _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-bernotok'
	    _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-berok'
	    # Exported symbols can be pulled into shared objects from archives
	    _LT_TAGVAR(whole_archive_flag_spec, $1)='$convenience'
	    _LT_TAGVAR(archive_cmds_need_lc, $1)=yes
	    # This is similar to how AIX traditionally builds its shared
	    # libraries.
	    _LT_TAGVAR(archive_expsym_cmds, $1)="\$CC $shared_flag"' -o $output_objdir/$soname $libobjs $deplibs ${wl}-bnoentry $compiler_flags ${wl}-bE:$export_symbols${allow_undefined_flag}~$AR $AR_FLAGS $output_objdir/$libname$release.a $output_objdir/$soname'
          fi
        fi
        ;;

      beos*)
	if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
	  _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
	  # Joseph Beckenbach <jrb3@best.com> says some releases of gcc
	  # support --undefined.  This deserves some investigation.  FIXME
	  _LT_TAGVAR(archive_cmds, $1)='$CC -nostart $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	else
	  _LT_TAGVAR(ld_shlibs, $1)=no
	fi
	;;

      chorus*)
        case $cc_basename in
          *)
	  # FIXME: insert proper C++ library support
	  _LT_TAGVAR(ld_shlibs, $1)=no
	  ;;
        esac
        ;;

      cygwin* | mingw* | pw32*)
        # _LT_TAGVAR(hardcode_libdir_flag_spec, $1) is actually meaningless,
        # as there is no search path for DLLs.
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-L$libdir'
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes

        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
          # If the export-symbols file already is a .def file (1st line
          # is EXPORTS), use it as is; otherwise, prepend...
          _LT_TAGVAR(archive_expsym_cmds, $1)='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
	    cp $export_symbols $output_objdir/$soname.def;
          else
	    echo EXPORTS > $output_objdir/$soname.def;
	    cat $export_symbols >> $output_objdir/$soname.def;
          fi~
          $CC -shared -nostdlib $output_objdir/$soname.def $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
        else
          _LT_TAGVAR(ld_shlibs, $1)=no
        fi
        ;;
      darwin* | rhapsody*)
        _LT_DARWIN_LINKER_FEATURES($1)
	;;

      dgux*)
        case $cc_basename in
          ec++*)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          ghcx*)
	    # Green Hills C++ Compiler
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          *)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
        esac
        ;;

      freebsd[[12]]*)
        # C++ shared libraries reported to be fairly broken before
	# switch to ELF
        _LT_TAGVAR(ld_shlibs, $1)=no
        ;;

      freebsd-elf*)
        _LT_TAGVAR(archive_cmds_need_lc, $1)=no
        ;;

      freebsd* | dragonfly*)
        # FreeBSD 3 and later use GNU C++ and GNU ld with standard ELF
        # conventions
        _LT_TAGVAR(ld_shlibs, $1)=yes
        ;;

      gnu*)
        ;;

      hpux9*)
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
        _LT_TAGVAR(hardcode_libdir_separator, $1)=:
        _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_minus_L, $1)=yes # Not in the search PATH,
				             # but as the default
				             # location of the library.

        case $cc_basename in
          CC*)
            # FIXME: insert proper C++ library support
            _LT_TAGVAR(ld_shlibs, $1)=no
            ;;
          aCC*)
            _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -b ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
            # Commands to make compiler produce verbose output that lists
            # what "hidden" libraries, object files and flags are used when
            # linking a shared library.
            #
            # There doesn't appear to be a way to prevent this compiler from
            # explicitly linking system object files so we need to strip them
            # from the output so that they don't get included in the library
            # dependencies.
            output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $EGREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
            ;;
          *)
            if test "$GXX" = yes; then
              _LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$CC -shared -nostdlib -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
            else
              # FIXME: insert proper C++ library support
              _LT_TAGVAR(ld_shlibs, $1)=no
            fi
            ;;
        esac
        ;;

      hpux10*|hpux11*)
        if test $with_gnu_ld = no; then
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}+b ${wl}$libdir'
	  _LT_TAGVAR(hardcode_libdir_separator, $1)=:

          case $host_cpu in
            hppa*64*|ia64*)
              ;;
            *)
	      _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
              ;;
          esac
        fi
        case $host_cpu in
          hppa*64*|ia64*)
            _LT_TAGVAR(hardcode_direct, $1)=no
            _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
            ;;
          *)
            _LT_TAGVAR(hardcode_direct, $1)=yes
            _LT_TAGVAR(hardcode_direct_absolute, $1)=yes
            _LT_TAGVAR(hardcode_minus_L, $1)=yes # Not in the search PATH,
					         # but as the default
					         # location of the library.
            ;;
        esac

        case $cc_basename in
          CC*)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          aCC*)
	    case $host_cpu in
	      hppa*64*)
	        _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	        ;;
	      ia64*)
	        _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	        ;;
	      *)
	        _LT_TAGVAR(archive_cmds, $1)='$CC -b ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	        ;;
	    esac
	    # Commands to make compiler produce verbose output that lists
	    # what "hidden" libraries, object files and flags are used when
	    # linking a shared library.
	    #
	    # There doesn't appear to be a way to prevent this compiler from
	    # explicitly linking system object files so we need to strip them
	    # from the output so that they don't get included in the library
	    # dependencies.
	    output_verbose_link_cmd='templist=`($CC -b $CFLAGS -v conftest.$objext 2>&1) | $GREP "\-L"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
	    ;;
          *)
	    if test "$GXX" = yes; then
	      if test $with_gnu_ld = no; then
	        case $host_cpu in
	          hppa*64*)
	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	            ;;
	          ia64*)
	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	            ;;
	          *)
	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	            ;;
	        esac
	      fi
	    else
	      # FIXME: insert proper C++ library support
	      _LT_TAGVAR(ld_shlibs, $1)=no
	    fi
	    ;;
        esac
        ;;

      interix[[3-9]]*)
	_LT_TAGVAR(hardcode_direct, $1)=no
	_LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	_LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
	# Hack: On Interix 3.x, we cannot compile PIC because of a broken gcc.
	# Instead, shared libraries are loaded at an image base (0x10000000 by
	# default) and relocated if they conflict, which is a slow very memory
	# consuming and fragmenting process.  To avoid this, we pick a random,
	# 256 KiB-aligned image base between 0x50000000 and 0x6FFC0000 at link
	# time.  Moving up from 0x10000000 also allows more sbrk(2) space.
	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
	_LT_TAGVAR(archive_expsym_cmds, $1)='sed "s,^,_," $export_symbols >$output_objdir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${wl}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $lib'
	;;
      irix5* | irix6*)
        case $cc_basename in
          CC*)
	    # SGI C++
	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared -all -multigot $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'

	    # Archives containing C++ object files must be created using
	    # "CC -ar", where "CC" is the IRIX C++ compiler.  This is
	    # necessary to make sure instantiated templates are included
	    # in the archive.
	    _LT_TAGVAR(old_archive_cmds, $1)='$CC -ar -WR,-u -o $oldlib $oldobjs'
	    ;;
          *)
	    if test "$GXX" = yes; then
	      if test "$with_gnu_ld" = no; then
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
	      else
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` -o $lib'
	      fi
	    fi
	    _LT_TAGVAR(link_all_deplibs, $1)=yes
	    ;;
        esac
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        _LT_TAGVAR(hardcode_libdir_separator, $1)=:
        _LT_TAGVAR(inherit_rpath, $1)=yes
        ;;

      linux* | k*bsd*-gnu)
        case $cc_basename in
          KCC*)
	    # Kuck and Associates, Inc. (KAI) C++ Compiler

	    # KCC will only create a shared library if the output file
	    # ends with ".so" (or ".sl" for HP-UX), so rename the library
	    # to its proper name (with version) after linking.
	    _LT_TAGVAR(archive_cmds, $1)='tempext=`echo $shared_ext | $SED -e '\''s/\([[^()0-9A-Za-z{}]]\)/\\\\\1/g'\''`; templib=`echo $lib | $SED -e "s/\${tempext}\..*/.so/"`; $CC $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags --soname $soname -o \$templib; mv \$templib $lib'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='tempext=`echo $shared_ext | $SED -e '\''s/\([[^()0-9A-Za-z{}]]\)/\\\\\1/g'\''`; templib=`echo $lib | $SED -e "s/\${tempext}\..*/.so/"`; $CC $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags --soname $soname -o \$templib ${wl}-retain-symbols-file,$export_symbols; mv \$templib $lib'
	    # Commands to make compiler produce verbose output that lists
	    # what "hidden" libraries, object files and flags are used when
	    # linking a shared library.
	    #
	    # There doesn't appear to be a way to prevent this compiler from
	    # explicitly linking system object files so we need to strip them
	    # from the output so that they don't get included in the library
	    # dependencies.
	    output_verbose_link_cmd='templist=`$CC $CFLAGS -v conftest.$objext -o libconftest$shared_ext 2>&1 | $GREP "ld"`; rm -f libconftest$shared_ext; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'

	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'

	    # Archives containing C++ object files must be created using
	    # "CC -Bstatic", where "CC" is the KAI C++ compiler.
	    _LT_TAGVAR(old_archive_cmds, $1)='$CC -Bstatic -o $oldlib $oldobjs'
	    ;;
	  icpc* | ecpc* )
	    # Intel C++
	    with_gnu_ld=yes
	    # version 8.0 and above of icpc choke on multiply defined symbols
	    # if we add $predep_objects and $postdep_objects, however 7.1 and
	    # earlier do not add the objects themselves.
	    case `$CC -V 2>&1` in
	      *"Version 7."*)
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
		_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
		;;
	      *)  # Version 8.0 or newer
	        tmp_idyn=
	        case $host_cpu in
		  ia64*) tmp_idyn=' -i_dynamic';;
		esac
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared'"$tmp_idyn"' $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
		_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared'"$tmp_idyn"' $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
		;;
	    esac
	    _LT_TAGVAR(archive_cmds_need_lc, $1)=no
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
	    _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive$convenience ${wl}--no-whole-archive'
	    ;;
          pgCC* | pgcpp*)
            # Portland Group C++ compiler
	    case `$CC -V` in
	    *pgCC\ [[1-5]]* | *pgcpp\ [[1-5]]*)
	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
		rm -rf $tpldir~
		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
		compile_command="$compile_command `find $tpldir -name \*.o | $NL2SP`"'
	      _LT_TAGVAR(old_archive_cmds, $1)='tpldir=Template.dir~
		rm -rf $tpldir~
		$CC --prelink_objects --instantiation_dir $tpldir $oldobjs$old_deplibs~
		$AR $AR_FLAGS $oldlib$oldobjs$old_deplibs `find $tpldir -name \*.o | $NL2SP`~
		$RANLIB $oldlib'
	      _LT_TAGVAR(archive_cmds, $1)='tpldir=Template.dir~
		rm -rf $tpldir~
		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
	      _LT_TAGVAR(archive_expsym_cmds, $1)='tpldir=Template.dir~
		rm -rf $tpldir~
		$CC --prelink_objects --instantiation_dir $tpldir $predep_objects $libobjs $deplibs $convenience $postdep_objects~
		$CC -shared $pic_flag $predep_objects $libobjs $deplibs `find $tpldir -name \*.o | $NL2SP` $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
	      ;;
	    *) # Version 6 will use weak symbols
	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
	      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname ${wl}-retain-symbols-file ${wl}$export_symbols -o $lib'
	      ;;
	    esac

	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}--rpath ${wl}$libdir'
	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
	    _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`for conv in $convenience\"\"; do test  -n \"$conv\" && new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
            ;;
	  cxx*)
	    # Compaq C++
	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname  -o $lib ${wl}-retain-symbols-file $wl$export_symbols'

	    runpath_var=LD_RUN_PATH
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-rpath $libdir'
	    _LT_TAGVAR(hardcode_libdir_separator, $1)=:

	    # Commands to make compiler produce verbose output that lists
	    # what "hidden" libraries, object files and flags are used when
	    # linking a shared library.
	    #
	    # There doesn't appear to be a way to prevent this compiler from
	    # explicitly linking system object files so we need to strip them
	    # from the output so that they don't get included in the library
	    # dependencies.
	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld"`; templist=`$ECHO "X$templist" | $Xsed -e "s/\(^.*ld.*\)\( .*ld .*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
	    ;;
	  xl*)
	    # IBM XL 8.0 on PPC, with GNU ld
	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
	    _LT_TAGVAR(archive_cmds, $1)='$CC -qmkshrobj $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
	    if test "x$supports_anon_versioning" = xyes; then
	      _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $output_objdir/$libname.ver~
		cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
		echo "local: *; };" >> $output_objdir/$libname.ver~
		$CC -qmkshrobj $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-version-script ${wl}$output_objdir/$libname.ver -o $lib'
	    fi
	    ;;
	  *)
	    case `$CC -V 2>&1 | sed 5q` in
	    *Sun\ C*)
	      # Sun C++ 5.9
	      _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
	      _LT_TAGVAR(archive_cmds, $1)='$CC -G${allow_undefined_flag} -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G${allow_undefined_flag} -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-retain-symbols-file ${wl}$export_symbols'
	      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
	      _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}--whole-archive`new_convenience=; for conv in $convenience\"\"; do test -z \"$conv\" || new_convenience=\"$new_convenience,$conv\"; done; $ECHO \"$new_convenience\"` ${wl}--no-whole-archive'
	      _LT_TAGVAR(compiler_needs_object, $1)=yes

	      # Not sure whether something based on
	      # $CC $CFLAGS -v conftest.$objext -o libconftest$shared_ext 2>&1
	      # would be better.
	      output_verbose_link_cmd='echo'

	      # Archives containing C++ object files must be created using
	      # "CC -xar", where "CC" is the Sun C++ compiler.  This is
	      # necessary to make sure instantiated templates are included
	      # in the archive.
	      _LT_TAGVAR(old_archive_cmds, $1)='$CC -xar -o $oldlib $oldobjs'
	      ;;
	    esac
	    ;;
	esac
	;;

      lynxos*)
        # FIXME: insert proper C++ library support
	_LT_TAGVAR(ld_shlibs, $1)=no
	;;

      m88k*)
        # FIXME: insert proper C++ library support
        _LT_TAGVAR(ld_shlibs, $1)=no
	;;

      mvs*)
        case $cc_basename in
          cxx*)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
	  *)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
	esac
	;;

      netbsd*)
        if echo __ELF__ | $CC -E - | $GREP __ELF__ >/dev/null; then
	  _LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable  -o $lib $predep_objects $libobjs $deplibs $postdep_objects $linker_flags'
	  wlarc=
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
	  _LT_TAGVAR(hardcode_direct, $1)=yes
	  _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	fi
	# Workaround some broken pre-1.5 toolchains
	output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP conftest.$objext | $SED -e "s:-lgcc -lc -lgcc::"'
	;;

      *nto* | *qnx*)
        _LT_TAGVAR(ld_shlibs, $1)=yes
	;;

      openbsd2*)
        # C++ shared libraries are fairly broken
	_LT_TAGVAR(ld_shlibs, $1)=no
	;;

      openbsd*)
	if test -f /usr/libexec/ld.so; then
	  _LT_TAGVAR(hardcode_direct, $1)=yes
	  _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	  _LT_TAGVAR(hardcode_direct_absolute, $1)=yes
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -o $lib'
	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	  if test -z "`echo __ELF__ | $CC -E - | grep __ELF__`" || test "$host_os-$host_cpu" = "openbsd2.8-powerpc"; then
	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-retain-symbols-file,$export_symbols -o $lib'
	    _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-E'
	    _LT_TAGVAR(whole_archive_flag_spec, $1)="$wlarc"'--whole-archive$convenience '"$wlarc"'--no-whole-archive'
	  fi
	  output_verbose_link_cmd=echo
	else
	  _LT_TAGVAR(ld_shlibs, $1)=no
	fi
	;;

      osf3* | osf4* | osf5*)
        case $cc_basename in
          KCC*)
	    # Kuck and Associates, Inc. (KAI) C++ Compiler

	    # KCC will only create a shared library if the output file
	    # ends with ".so" (or ".sl" for HP-UX), so rename the library
	    # to its proper name (with version) after linking.
	    _LT_TAGVAR(archive_cmds, $1)='tempext=`echo $shared_ext | $SED -e '\''s/\([[^()0-9A-Za-z{}]]\)/\\\\\1/g'\''`; templib=`echo "$lib" | $SED -e "s/\${tempext}\..*/.so/"`; $CC $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags --soname $soname -o \$templib; mv \$templib $lib'

	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath,$libdir'
	    _LT_TAGVAR(hardcode_libdir_separator, $1)=:

	    # Archives containing C++ object files must be created using
	    # the KAI C++ compiler.
	    case $host in
	      osf3*) _LT_TAGVAR(old_archive_cmds, $1)='$CC -Bstatic -o $oldlib $oldobjs' ;;
	      *) _LT_TAGVAR(old_archive_cmds, $1)='$CC -o $oldlib $oldobjs' ;;
	    esac
	    ;;
          RCC*)
	    # Rational C++ 2.4.1
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          cxx*)
	    case $host in
	      osf3*)
	        _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $soname `test -n "$verstring" && $ECHO "X${wl}-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
	        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
		;;
	      *)
	        _LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib'
	        _LT_TAGVAR(archive_expsym_cmds, $1)='for i in `cat $export_symbols`; do printf "%s %s\\n" -exported_symbol "\$i" >> $lib.exp; done~
	          echo "-hidden">> $lib.exp~
	          $CC -shared$allow_undefined_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags -msym -soname $soname ${wl}-input ${wl}$lib.exp  `test -n "$verstring" && $ECHO "X-set_version $verstring" | $Xsed` -update_registry ${output_objdir}/so_locations -o $lib~
	          $RM $lib.exp'
	        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-rpath $libdir'
		;;
	    esac

	    _LT_TAGVAR(hardcode_libdir_separator, $1)=:

	    # Commands to make compiler produce verbose output that lists
	    # what "hidden" libraries, object files and flags are used when
	    # linking a shared library.
	    #
	    # There doesn't appear to be a way to prevent this compiler from
	    # explicitly linking system object files so we need to strip them
	    # from the output so that they don't get included in the library
	    # dependencies.
	    output_verbose_link_cmd='templist=`$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "ld" | $GREP -v "ld:"`; templist=`$ECHO "X$templist" | $Xsed -e "s/\(^.*ld.*\)\( .*ld.*$\)/\1/"`; list=""; for z in $templist; do case $z in conftest.$objext) list="$list $z";; *.$objext);; *) list="$list $z";;esac; done; $ECHO "X$list" | $Xsed'
	    ;;
	  *)
	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
	      _LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
	      case $host in
	        osf3*)
	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "X${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
		  ;;
	        *)
	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && $ECHO "${wl}-set_version ${wl}$verstring" | $Xsed` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
		  ;;
	      esac

	      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
	      _LT_TAGVAR(hardcode_libdir_separator, $1)=:

	      # Commands to make compiler produce verbose output that lists
	      # what "hidden" libraries, object files and flags are used when
	      # linking a shared library.
	      output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'

	    else
	      # FIXME: insert proper C++ library support
	      _LT_TAGVAR(ld_shlibs, $1)=no
	    fi
	    ;;
        esac
        ;;

      psos*)
        # FIXME: insert proper C++ library support
        _LT_TAGVAR(ld_shlibs, $1)=no
        ;;

      sunos4*)
        case $cc_basename in
          CC*)
	    # Sun C++ 4.x
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          lcc*)
	    # Lucid
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          *)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
        esac
        ;;

      solaris*)
        case $cc_basename in
          CC*)
	    # Sun C++ 4.2, 5.x and Centerline C++
            _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
	    _LT_TAGVAR(archive_cmds, $1)='$CC -G${allow_undefined_flag}  -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
	      $CC -G${allow_undefined_flag} ${wl}-M ${wl}$lib.exp -h$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'

	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
	    _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	    case $host_os in
	      solaris2.[[0-5]] | solaris2.[[0-5]].*) ;;
	      *)
		# The compiler driver will combine and reorder linker options,
		# but understands `-z linker_flag'.
	        # Supported since Solaris 2.6 (maybe 2.5.1?)
		_LT_TAGVAR(whole_archive_flag_spec, $1)='-z allextract$convenience -z defaultextract'
	        ;;
	    esac
	    _LT_TAGVAR(link_all_deplibs, $1)=yes

	    output_verbose_link_cmd='echo'

	    # Archives containing C++ object files must be created using
	    # "CC -xar", where "CC" is the Sun C++ compiler.  This is
	    # necessary to make sure instantiated templates are included
	    # in the archive.
	    _LT_TAGVAR(old_archive_cmds, $1)='$CC -xar -o $oldlib $oldobjs'
	    ;;
          gcx*)
	    # Green Hills C++ Compiler
	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'

	    # The C++ compiler must be used to create the archive.
	    _LT_TAGVAR(old_archive_cmds, $1)='$CC $LDFLAGS -archive -o $oldlib $oldobjs'
	    ;;
          *)
	    # GNU C++ compiler with Solaris linker
	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
	        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
	        _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
		  $CC -shared -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'

	        # Commands to make compiler produce verbose output that lists
	        # what "hidden" libraries, object files and flags are used when
	        # linking a shared library.
	        output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
	      else
	        # g++ 2.7 appears to require `-G' NOT `-shared' on this
	        # platform.
	        _LT_TAGVAR(archive_cmds, $1)='$CC -G -nostdlib $LDFLAGS $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-h $wl$soname -o $lib'
	        _LT_TAGVAR(archive_expsym_cmds, $1)='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
		  $CC -G -nostdlib ${wl}-M $wl$lib.exp -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags~$RM $lib.exp'

	        # Commands to make compiler produce verbose output that lists
	        # what "hidden" libraries, object files and flags are used when
	        # linking a shared library.
	        output_verbose_link_cmd='$CC -G $CFLAGS -v conftest.$objext 2>&1 | $GREP "\-L"'
	      fi

	      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R $wl$libdir'
	      case $host_os in
		solaris2.[[0-5]] | solaris2.[[0-5]].*) ;;
		*)
		  _LT_TAGVAR(whole_archive_flag_spec, $1)='${wl}-z ${wl}allextract$convenience ${wl}-z ${wl}defaultextract'
		  ;;
	      esac
	    fi
	    ;;
        esac
        ;;

    sysv4*uw2* | sysv5OpenUNIX* | sysv5UnixWare7.[[01]].[[10]]* | unixware7* | sco3.2v5.0.[[024]]*)
      _LT_TAGVAR(no_undefined_flag, $1)='${wl}-z,text'
      _LT_TAGVAR(archive_cmds_need_lc, $1)=no
      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
      runpath_var='LD_RUN_PATH'

      case $cc_basename in
        CC*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	  _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
	*)
	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	  _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	  ;;
      esac
      ;;

      sysv5* | sco3.2v5* | sco5v6*)
	# Note: We can NOT use -z defs as we might desire, because we do not
	# link with -lc, and that would cause any symbols used from libc to
	# always be unresolved, which means just about no library would
	# ever link correctly.  If we're not using GNU ld we use -z text
	# though, which does catch some bad symbols but isn't as heavy-handed
	# as -z defs.
	_LT_TAGVAR(no_undefined_flag, $1)='${wl}-z,text'
	_LT_TAGVAR(allow_undefined_flag, $1)='${wl}-z,nodefs'
	_LT_TAGVAR(archive_cmds_need_lc, $1)=no
	_LT_TAGVAR(hardcode_shlibpath_var, $1)=no
	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-R,$libdir'
	_LT_TAGVAR(hardcode_libdir_separator, $1)=':'
	_LT_TAGVAR(link_all_deplibs, $1)=yes
	_LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}-Bexport'
	runpath_var='LD_RUN_PATH'

	case $cc_basename in
          CC*)
	    _LT_TAGVAR(archive_cmds, $1)='$CC -G ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -G ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	    ;;
	  *)
	    _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	    _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared ${wl}-Bexport:$export_symbols ${wl}-h,$soname -o $lib $libobjs $deplibs $compiler_flags'
	    ;;
	esac
      ;;

      tandem*)
        case $cc_basename in
          NCC*)
	    # NonStop-UX NCC 3.20
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
          *)
	    # FIXME: insert proper C++ library support
	    _LT_TAGVAR(ld_shlibs, $1)=no
	    ;;
        esac
        ;;

      vxworks*)
        # FIXME: insert proper C++ library support
        _LT_TAGVAR(ld_shlibs, $1)=no
        ;;

      *)
        # FIXME: insert proper C++ library support
        _LT_TAGVAR(ld_shlibs, $1)=no
        ;;
    esac

    AC_MSG_RESULT([$_LT_TAGVAR(ld_shlibs, $1)])
    test "$_LT_TAGVAR(ld_shlibs, $1)" = no && can_build_shared=no

    _LT_TAGVAR(GCC, $1)="$GXX"
    _LT_TAGVAR(LD, $1)="$LD"

    ## CAVEAT EMPTOR:
    ## There is no encapsulation within the following macros, do not change
    ## the running order or otherwise move them around unless you know exactly
    ## what you are doing...
    _LT_SYS_HIDDEN_LIBDEPS($1)
    _LT_COMPILER_PIC($1)
    _LT_COMPILER_C_O($1)
    _LT_COMPILER_FILE_LOCKS($1)
    _LT_LINKER_SHLIBS($1)
    _LT_SYS_DYNAMIC_LINKER($1)
    _LT_LINKER_HARDCODE_LIBPATH($1)

    _LT_CONFIG($1)
  fi # test -n "$compiler"

  CC=$lt_save_CC
  LDCXX=$LD
  LD=$lt_save_LD
  GCC=$lt_save_GCC
  with_gnu_ld=$lt_save_with_gnu_ld
  lt_cv_path_LDCXX=$lt_cv_path_LD
  lt_cv_path_LD=$lt_save_path_LD
  lt_cv_prog_gnu_ldcxx=$lt_cv_prog_gnu_ld
  lt_cv_prog_gnu_ld=$lt_save_with_gnu_ld
fi # test "$_lt_caught_CXX_error" != yes

AC_LANG_POP
])# _LT_LANG_CXX_CONFIG


# _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
# ---------------------------------
# Figure out "hidden" library dependencies from verbose
# compiler output when linking a shared library.
# Parse the compiler output and extract the necessary
# objects, libraries and library flags.
m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
[m4_require([_LT_FILEUTILS_DEFAULTS])dnl
# Dependencies to place before and after the object being linked:
_LT_TAGVAR(predep_objects, $1)=
_LT_TAGVAR(postdep_objects, $1)=
_LT_TAGVAR(predeps, $1)=
_LT_TAGVAR(postdeps, $1)=
_LT_TAGVAR(compiler_lib_search_path, $1)=

dnl we can't use the lt_simple_compile_test_code here,
dnl because it contains code intended for an executable,
dnl not a library.  It's possible we should let each
dnl tag define a new lt_????_link_test_code variable,
dnl but it's only used here...
m4_if([$1], [], [cat > conftest.$ac_ext <<_LT_EOF
int a;
void foo (void) { a = 0; }
_LT_EOF
], [$1], [CXX], [cat > conftest.$ac_ext <<_LT_EOF
class Foo
{
public:
  Foo (void) { a = 0; }
private:
  int a;
};
_LT_EOF
], [$1], [F77], [cat > conftest.$ac_ext <<_LT_EOF
      subroutine foo
      implicit none
      integer*4 a
      a=0
      return
      end
_LT_EOF
], [$1], [FC], [cat > conftest.$ac_ext <<_LT_EOF
      subroutine foo
      implicit none
      integer a
      a=0
      return
      end
_LT_EOF
], [$1], [GCJ], [cat > conftest.$ac_ext <<_LT_EOF
public class foo {
  private int a;
  public void bar (void) {
    a = 0;
  }
};
_LT_EOF
])
dnl Parse the compiler output and extract the necessary
dnl objects, libraries and library flags.
if AC_TRY_EVAL(ac_compile); then
  # Parse the compiler output and extract the necessary
  # objects, libraries and library flags.

  # Sentinel used to keep track of whether or not we are before
  # the conftest object file.
  pre_test_object_deps_done=no

  for p in `eval "$output_verbose_link_cmd"`; do
    case $p in

    -L* | -R* | -l*)
       # Some compilers place space between "-{L,R}" and the path.
       # Remove the space.
       if test $p = "-L" ||
          test $p = "-R"; then
	 prev=$p
	 continue
       else
	 prev=
       fi

       if test "$pre_test_object_deps_done" = no; then
	 case $p in
	 -L* | -R*)
	   # Internal compiler library paths should come after those
	   # provided the user.  The postdeps already come after the
	   # user supplied libs so there is no need to process them.
	   if test -z "$_LT_TAGVAR(compiler_lib_search_path, $1)"; then
	     _LT_TAGVAR(compiler_lib_search_path, $1)="${prev}${p}"
	   else
	     _LT_TAGVAR(compiler_lib_search_path, $1)="${_LT_TAGVAR(compiler_lib_search_path, $1)} ${prev}${p}"
	   fi
	   ;;
	 # The "-l" case would never come before the object being
	 # linked, so don't bother handling this case.
	 esac
       else
	 if test -z "$_LT_TAGVAR(postdeps, $1)"; then
	   _LT_TAGVAR(postdeps, $1)="${prev}${p}"
	 else
	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
	 fi
       fi
       ;;

    *.$objext)
       # This assumes that the test object file only shows up
       # once in the compiler output.
       if test "$p" = "conftest.$objext"; then
	 pre_test_object_deps_done=yes
	 continue
       fi

       if test "$pre_test_object_deps_done" = no; then
	 if test -z "$_LT_TAGVAR(predep_objects, $1)"; then
	   _LT_TAGVAR(predep_objects, $1)="$p"
	 else
	   _LT_TAGVAR(predep_objects, $1)="$_LT_TAGVAR(predep_objects, $1) $p"
	 fi
       else
	 if test -z "$_LT_TAGVAR(postdep_objects, $1)"; then
	   _LT_TAGVAR(postdep_objects, $1)="$p"
	 else
	   _LT_TAGVAR(postdep_objects, $1)="$_LT_TAGVAR(postdep_objects, $1) $p"
	 fi
       fi
       ;;

    *) ;; # Ignore the rest.

    esac
  done

  # Clean up.
  rm -f a.out a.exe
else
  echo "libtool.m4: error: problem compiling $1 test program"
fi

$RM -f confest.$objext

# PORTME: override above test on systems where it is broken
m4_if([$1], [CXX],
[case $host_os in
interix[[3-9]]*)
  # Interix 3.5 installs completely hosed .la files for C++, so rather than
  # hack all around it, let's just trust "g++" to DTRT.
  _LT_TAGVAR(predep_objects,$1)=
  _LT_TAGVAR(postdep_objects,$1)=
  _LT_TAGVAR(postdeps,$1)=
  ;;

linux*)
  case `$CC -V 2>&1 | sed 5q` in
  *Sun\ C*)
    # Sun C++ 5.9

    # The more standards-conforming stlport4 library is
    # incompatible with the Cstd library. Avoid specifying
    # it if it's in CXXFLAGS. Ignore libCrun as
    # -library=stlport4 depends on it.
    case " $CXX $CXXFLAGS " in
    *" -library=stlport4 "*)
      solaris_use_stlport4=yes
      ;;
    esac

    if test "$solaris_use_stlport4" != yes; then
      _LT_TAGVAR(postdeps,$1)='-library=Cstd -library=Crun'
    fi
    ;;
  esac
  ;;

solaris*)
  case $cc_basename in
  CC*)
    # The more standards-conforming stlport4 library is
    # incompatible with the Cstd library. Avoid specifying
    # it if it's in CXXFLAGS. Ignore libCrun as
    # -library=stlport4 depends on it.
    case " $CXX $CXXFLAGS " in
    *" -library=stlport4 "*)
      solaris_use_stlport4=yes
      ;;
    esac

    # Adding this requires a known-good setup of shared libraries for
    # Sun compiler versions before 5.6, else PIC objects from an old
    # archive will be linked into the output, leading to subtle bugs.
    if test "$solaris_use_stlport4" != yes; then
      _LT_TAGVAR(postdeps,$1)='-library=Cstd -library=Crun'
    fi
    ;;
  esac
  ;;
esac
])

case " $_LT_TAGVAR(postdeps, $1) " in
*" -lc "*) _LT_TAGVAR(archive_cmds_need_lc, $1)=no ;;
esac
 _LT_TAGVAR(compiler_lib_search_dirs, $1)=
if test -n "${_LT_TAGVAR(compiler_lib_search_path, $1)}"; then
 _LT_TAGVAR(compiler_lib_search_dirs, $1)=`echo " ${_LT_TAGVAR(compiler_lib_search_path, $1)}" | ${SED} -e 's! -L! !g' -e 's!^ !!'`
fi
_LT_TAGDECL([], [compiler_lib_search_dirs], [1],
    [The directories searched by this compiler when creating a shared library])
_LT_TAGDECL([], [predep_objects], [1],
    [Dependencies to place before and after the objects being linked to
    create a shared library])
_LT_TAGDECL([], [postdep_objects], [1])
_LT_TAGDECL([], [predeps], [1])
_LT_TAGDECL([], [postdeps], [1])
_LT_TAGDECL([], [compiler_lib_search_path], [1],
    [The library search path used internally by the compiler when linking
    a shared library])
])# _LT_SYS_HIDDEN_LIBDEPS


# _LT_PROG_F77
# ------------
# Since AC_PROG_F77 is broken, in that it returns the empty string
# if there is no fortran compiler, we have our own version here.
m4_defun([_LT_PROG_F77],
[
pushdef([AC_MSG_ERROR], [_lt_disable_F77=yes])
AC_PROG_F77
if test -z "$F77" || test "X$F77" = "Xno"; then
  _lt_disable_F77=yes
fi
popdef([AC_MSG_ERROR])
])# _LT_PROG_F77

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([_LT_PROG_F77], [])


# _LT_LANG_F77_CONFIG([TAG])
# --------------------------
# Ensure that the configuration variables for a Fortran 77 compiler are
# suitably defined.  These variables are subsequently used by _LT_CONFIG
# to write the compiler configuration to `libtool'.
m4_defun([_LT_LANG_F77_CONFIG],
[AC_REQUIRE([_LT_PROG_F77])dnl
AC_LANG_PUSH(Fortran 77)

_LT_TAGVAR(archive_cmds_need_lc, $1)=no
_LT_TAGVAR(allow_undefined_flag, $1)=
_LT_TAGVAR(always_export_symbols, $1)=no
_LT_TAGVAR(archive_expsym_cmds, $1)=
_LT_TAGVAR(export_dynamic_flag_spec, $1)=
_LT_TAGVAR(hardcode_direct, $1)=no
_LT_TAGVAR(hardcode_direct_absolute, $1)=no
_LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
_LT_TAGVAR(hardcode_libdir_separator, $1)=
_LT_TAGVAR(hardcode_minus_L, $1)=no
_LT_TAGVAR(hardcode_automatic, $1)=no
_LT_TAGVAR(inherit_rpath, $1)=no
_LT_TAGVAR(module_cmds, $1)=
_LT_TAGVAR(module_expsym_cmds, $1)=
_LT_TAGVAR(link_all_deplibs, $1)=unknown
_LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
_LT_TAGVAR(no_undefined_flag, $1)=
_LT_TAGVAR(whole_archive_flag_spec, $1)=
_LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no

# Source file extension for f77 test sources.
ac_ext=f

# Object file extension for compiled f77 test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# No sense in running all these tests if we already determined that
# the F77 compiler isn't working.  Some variables (like enable_shared)
# are currently assumed to apply to all compilers on this platform,
# and will be corrupted by setting them based on a non-working compiler.
if test "$_lt_disable_F77" != yes; then
  # Code to be used in simple compile tests
  lt_simple_compile_test_code="\
      subroutine t
      return
      end
"

  # Code to be used in simple link tests
  lt_simple_link_test_code="\
      program t
      end
"

  # ltmain only uses $CC for tagged configurations so make sure $CC is set.
  _LT_TAG_COMPILER

  # save warnings/boilerplate of simple test code
  _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE

  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
  lt_save_GCC=$GCC
  CC=${F77-"f77"}
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
  GCC=$G77
  if test -n "$compiler"; then
    AC_MSG_CHECKING([if libtool supports shared libraries])
    AC_MSG_RESULT([$can_build_shared])

    AC_MSG_CHECKING([whether to build shared libraries])
    test "$can_build_shared" = "no" && enable_shared=no

    # On AIX, shared libraries and static libraries use the same namespace, and
    # are all built from PIC.
    case $host_os in
      aix3*)
        test "$enable_shared" = yes && enable_static=no
        if test -n "$RANLIB"; then
          archive_cmds="$archive_cmds~\$RANLIB \$lib"
          postinstall_cmds='$RANLIB $lib'
        fi
        ;;
      aix[[4-9]]*)
	if test "$host_cpu" != ia64 && test "$aix_use_runtimelinking" = no ; then
	  test "$enable_shared" = yes && enable_static=no
	fi
        ;;
    esac
    AC_MSG_RESULT([$enable_shared])

    AC_MSG_CHECKING([whether to build static libraries])
    # Make sure either enable_shared or enable_static is yes.
    test "$enable_shared" = yes || enable_static=yes
    AC_MSG_RESULT([$enable_static])

    _LT_TAGVAR(GCC, $1)="$G77"
    _LT_TAGVAR(LD, $1)="$LD"

    ## CAVEAT EMPTOR:
    ## There is no encapsulation within the following macros, do not change
    ## the running order or otherwise move them around unless you know exactly
    ## what you are doing...
    _LT_COMPILER_PIC($1)
    _LT_COMPILER_C_O($1)
    _LT_COMPILER_FILE_LOCKS($1)
    _LT_LINKER_SHLIBS($1)
    _LT_SYS_DYNAMIC_LINKER($1)
    _LT_LINKER_HARDCODE_LIBPATH($1)

    _LT_CONFIG($1)
  fi # test -n "$compiler"

  GCC=$lt_save_GCC
  CC="$lt_save_CC"
fi # test "$_lt_disable_F77" != yes

AC_LANG_POP
])# _LT_LANG_F77_CONFIG


# _LT_PROG_FC
# -----------
# Since AC_PROG_FC is broken, in that it returns the empty string
# if there is no fortran compiler, we have our own version here.
m4_defun([_LT_PROG_FC],
[
pushdef([AC_MSG_ERROR], [_lt_disable_FC=yes])
AC_PROG_FC
if test -z "$FC" || test "X$FC" = "Xno"; then
  _lt_disable_FC=yes
fi
popdef([AC_MSG_ERROR])
])# _LT_PROG_FC

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([_LT_PROG_FC], [])


# _LT_LANG_FC_CONFIG([TAG])
# -------------------------
# Ensure that the configuration variables for a Fortran compiler are
# suitably defined.  These variables are subsequently used by _LT_CONFIG
# to write the compiler configuration to `libtool'.
m4_defun([_LT_LANG_FC_CONFIG],
[AC_REQUIRE([_LT_PROG_FC])dnl
AC_LANG_PUSH(Fortran)

_LT_TAGVAR(archive_cmds_need_lc, $1)=no
_LT_TAGVAR(allow_undefined_flag, $1)=
_LT_TAGVAR(always_export_symbols, $1)=no
_LT_TAGVAR(archive_expsym_cmds, $1)=
_LT_TAGVAR(export_dynamic_flag_spec, $1)=
_LT_TAGVAR(hardcode_direct, $1)=no
_LT_TAGVAR(hardcode_direct_absolute, $1)=no
_LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
_LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=
_LT_TAGVAR(hardcode_libdir_separator, $1)=
_LT_TAGVAR(hardcode_minus_L, $1)=no
_LT_TAGVAR(hardcode_automatic, $1)=no
_LT_TAGVAR(inherit_rpath, $1)=no
_LT_TAGVAR(module_cmds, $1)=
_LT_TAGVAR(module_expsym_cmds, $1)=
_LT_TAGVAR(link_all_deplibs, $1)=unknown
_LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds
_LT_TAGVAR(no_undefined_flag, $1)=
_LT_TAGVAR(whole_archive_flag_spec, $1)=
_LT_TAGVAR(enable_shared_with_static_runtimes, $1)=no

# Source file extension for fc test sources.
ac_ext=${ac_fc_srcext-f}

# Object file extension for compiled fc test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# No sense in running all these tests if we already determined that
# the FC compiler isn't working.  Some variables (like enable_shared)
# are currently assumed to apply to all compilers on this platform,
# and will be corrupted by setting them based on a non-working compiler.
if test "$_lt_disable_FC" != yes; then
  # Code to be used in simple compile tests
  lt_simple_compile_test_code="\
      subroutine t
      return
      end
"

  # Code to be used in simple link tests
  lt_simple_link_test_code="\
      program t
      end
"

  # ltmain only uses $CC for tagged configurations so make sure $CC is set.
  _LT_TAG_COMPILER

  # save warnings/boilerplate of simple test code
  _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE

  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
  lt_save_GCC=$GCC
  CC=${FC-"f95"}
  compiler=$CC
  GCC=$ac_cv_fc_compiler_gnu

  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])

  if test -n "$compiler"; then
    AC_MSG_CHECKING([if libtool supports shared libraries])
    AC_MSG_RESULT([$can_build_shared])

    AC_MSG_CHECKING([whether to build shared libraries])
    test "$can_build_shared" = "no" && enable_shared=no

    # On AIX, shared libraries and static libraries use the same namespace, and
    # are all built from PIC.
    case $host_os in
      aix3*)
        test "$enable_shared" = yes && enable_static=no
        if test -n "$RANLIB"; then
          archive_cmds="$archive_cmds~\$RANLIB \$lib"
          postinstall_cmds='$RANLIB $lib'
        fi
        ;;
      aix[[4-9]]*)
	if test "$host_cpu" != ia64 && test "$aix_use_runtimelinking" = no ; then
	  test "$enable_shared" = yes && enable_static=no
	fi
        ;;
    esac
    AC_MSG_RESULT([$enable_shared])

    AC_MSG_CHECKING([whether to build static libraries])
    # Make sure either enable_shared or enable_static is yes.
    test "$enable_shared" = yes || enable_static=yes
    AC_MSG_RESULT([$enable_static])

    _LT_TAGVAR(GCC, $1)="$ac_cv_fc_compiler_gnu"
    _LT_TAGVAR(LD, $1)="$LD"

    ## CAVEAT EMPTOR:
    ## There is no encapsulation within the following macros, do not change
    ## the running order or otherwise move them around unless you know exactly
    ## what you are doing...
    _LT_SYS_HIDDEN_LIBDEPS($1)
    _LT_COMPILER_PIC($1)
    _LT_COMPILER_C_O($1)
    _LT_COMPILER_FILE_LOCKS($1)
    _LT_LINKER_SHLIBS($1)
    _LT_SYS_DYNAMIC_LINKER($1)
    _LT_LINKER_HARDCODE_LIBPATH($1)

    _LT_CONFIG($1)
  fi # test -n "$compiler"

  GCC=$lt_save_GCC
  CC="$lt_save_CC"
fi # test "$_lt_disable_FC" != yes

AC_LANG_POP
])# _LT_LANG_FC_CONFIG


# _LT_LANG_GCJ_CONFIG([TAG])
# --------------------------
# Ensure that the configuration variables for the GNU Java Compiler compiler
# are suitably defined.  These variables are subsequently used by _LT_CONFIG
# to write the compiler configuration to `libtool'.
m4_defun([_LT_LANG_GCJ_CONFIG],
[AC_REQUIRE([LT_PROG_GCJ])dnl
AC_LANG_SAVE

# Source file extension for Java test sources.
ac_ext=java

# Object file extension for compiled Java test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# Code to be used in simple compile tests
lt_simple_compile_test_code="class foo {}"

# Code to be used in simple link tests
lt_simple_link_test_code='public class conftest { public static void main(String[[]] argv) {}; }'

# ltmain only uses $CC for tagged configurations so make sure $CC is set.
_LT_TAG_COMPILER

# save warnings/boilerplate of simple test code
_LT_COMPILER_BOILERPLATE
_LT_LINKER_BOILERPLATE

# Allow CC to be a program name with arguments.
lt_save_CC="$CC"
lt_save_GCC=$GCC
GCC=yes
CC=${GCJ-"gcj"}
compiler=$CC
_LT_TAGVAR(compiler, $1)=$CC
_LT_TAGVAR(LD, $1)="$LD"
_LT_CC_BASENAME([$compiler])

# GCJ did not exist at the time GCC didn't implicitly link libc in.
_LT_TAGVAR(archive_cmds_need_lc, $1)=no

_LT_TAGVAR(old_archive_cmds, $1)=$old_archive_cmds

if test -n "$compiler"; then
  _LT_COMPILER_NO_RTTI($1)
  _LT_COMPILER_PIC($1)
  _LT_COMPILER_C_O($1)
  _LT_COMPILER_FILE_LOCKS($1)
  _LT_LINKER_SHLIBS($1)
  _LT_LINKER_HARDCODE_LIBPATH($1)

  _LT_CONFIG($1)
fi

AC_LANG_RESTORE

GCC=$lt_save_GCC
CC="$lt_save_CC"
])# _LT_LANG_GCJ_CONFIG


# _LT_LANG_RC_CONFIG([TAG])
# -------------------------
# Ensure that the configuration variables for the Windows resource compiler
# are suitably defined.  These variables are subsequently used by _LT_CONFIG
# to write the compiler configuration to `libtool'.
m4_defun([_LT_LANG_RC_CONFIG],
[AC_REQUIRE([LT_PROG_RC])dnl
AC_LANG_SAVE

# Source file extension for RC test sources.
ac_ext=rc

# Object file extension for compiled RC test sources.
objext=o
_LT_TAGVAR(objext, $1)=$objext

# Code to be used in simple compile tests
lt_simple_compile_test_code='sample MENU { MENUITEM "&Soup", 100, CHECKED }'

# Code to be used in simple link tests
lt_simple_link_test_code="$lt_simple_compile_test_code"

# ltmain only uses $CC for tagged configurations so make sure $CC is set.
_LT_TAG_COMPILER

# save warnings/boilerplate of simple test code
_LT_COMPILER_BOILERPLATE
_LT_LINKER_BOILERPLATE

# Allow CC to be a program name with arguments.
lt_save_CC="$CC"
lt_save_GCC=$GCC
GCC=
CC=${RC-"windres"}
compiler=$CC
_LT_TAGVAR(compiler, $1)=$CC
_LT_CC_BASENAME([$compiler])
_LT_TAGVAR(lt_cv_prog_compiler_c_o, $1)=yes

if test -n "$compiler"; then
  :
  _LT_CONFIG($1)
fi

GCC=$lt_save_GCC
AC_LANG_RESTORE
CC="$lt_save_CC"
])# _LT_LANG_RC_CONFIG


# LT_PROG_GCJ
# -----------
AC_DEFUN([LT_PROG_GCJ],
[m4_ifdef([AC_PROG_GCJ], [AC_PROG_GCJ],
  [m4_ifdef([A][M_PROG_GCJ], [A][M_PROG_GCJ],
    [AC_CHECK_TOOL(GCJ, gcj,)
      test "x${GCJFLAGS+set}" = xset || GCJFLAGS="-g -O2"
      AC_SUBST(GCJFLAGS)])])[]dnl
])

# Old name:
AU_ALIAS([LT_AC_PROG_GCJ], [LT_PROG_GCJ])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([LT_AC_PROG_GCJ], [])


# LT_PROG_RC
# ----------
AC_DEFUN([LT_PROG_RC],
[AC_CHECK_TOOL(RC, windres,)
])

# Old name:
AU_ALIAS([LT_AC_PROG_RC], [LT_PROG_RC])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([LT_AC_PROG_RC], [])


# _LT_DECL_EGREP
# --------------
# If we don't have a new enough Autoconf to choose the best grep
# available, choose the one first in the user's PATH.
m4_defun([_LT_DECL_EGREP],
[AC_REQUIRE([AC_PROG_EGREP])dnl
AC_REQUIRE([AC_PROG_FGREP])dnl
test -z "$GREP" && GREP=grep
_LT_DECL([], [GREP], [1], [A grep program that handles long lines])
_LT_DECL([], [EGREP], [1], [An ERE matcher])
_LT_DECL([], [FGREP], [1], [A literal string matcher])
dnl Non-bleeding-edge autoconf doesn't subst GREP, so do it here too
AC_SUBST([GREP])
])


# _LT_DECL_SED
# ------------
# Check for a fully-functional sed program, that truncates
# as few characters as possible.  Prefer GNU sed if found.
m4_defun([_LT_DECL_SED],
[AC_PROG_SED
test -z "$SED" && SED=sed
Xsed="$SED -e 1s/^X//"
_LT_DECL([], [SED], [1], [A sed program that does not truncate output])
_LT_DECL([], [Xsed], ["\$SED -e 1s/^X//"],
    [Sed that helps us avoid accidentally triggering echo(1) options like -n])
])# _LT_DECL_SED

m4_ifndef([AC_PROG_SED], [
# NOTE: This macro has been submitted for inclusion into   #
#  GNU Autoconf as AC_PROG_SED.  When it is available in   #
#  a released version of Autoconf we should remove this    #
#  macro and use it instead.                               #

m4_defun([AC_PROG_SED],
[AC_MSG_CHECKING([for a sed that does not truncate output])
AC_CACHE_VAL(lt_cv_path_SED,
[# Loop through the user's path and test for sed and gsed.
# Then use that list of sed's as ones to test for truncation.
as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
for as_dir in $PATH
do
  IFS=$as_save_IFS
  test -z "$as_dir" && as_dir=.
  for lt_ac_prog in sed gsed; do
    for ac_exec_ext in '' $ac_executable_extensions; do
      if $as_executable_p "$as_dir/$lt_ac_prog$ac_exec_ext"; then
        lt_ac_sed_list="$lt_ac_sed_list $as_dir/$lt_ac_prog$ac_exec_ext"
      fi
    done
  done
done
IFS=$as_save_IFS
lt_ac_max=0
lt_ac_count=0
# Add /usr/xpg4/bin/sed as it is typically found on Solaris
# along with /bin/sed that truncates output.
for lt_ac_sed in $lt_ac_sed_list /usr/xpg4/bin/sed; do
  test ! -f $lt_ac_sed && continue
  cat /dev/null > conftest.in
  lt_ac_count=0
  echo $ECHO_N "0123456789$ECHO_C" >conftest.in
  # Check for GNU sed and select it if it is found.
  if "$lt_ac_sed" --version 2>&1 < /dev/null | grep 'GNU' > /dev/null; then
    lt_cv_path_SED=$lt_ac_sed
    break
  fi
  while true; do
    cat conftest.in conftest.in >conftest.tmp
    mv conftest.tmp conftest.in
    cp conftest.in conftest.nl
    echo >>conftest.nl
    $lt_ac_sed -e 's/a$//' < conftest.nl >conftest.out || break
    cmp -s conftest.out conftest.nl || break
    # 10000 chars as input seems more than enough
    test $lt_ac_count -gt 10 && break
    lt_ac_count=`expr $lt_ac_count + 1`
    if test $lt_ac_count -gt $lt_ac_max; then
      lt_ac_max=$lt_ac_count
      lt_cv_path_SED=$lt_ac_sed
    fi
  done
done
])
SED=$lt_cv_path_SED
AC_SUBST([SED])
AC_MSG_RESULT([$SED])
])#AC_PROG_SED
])#m4_ifndef

# Old name:
AU_ALIAS([LT_AC_PROG_SED], [AC_PROG_SED])
dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([LT_AC_PROG_SED], [])


# _LT_CHECK_SHELL_FEATURES
# ------------------------
# Find out whether the shell is Bourne or XSI compatible,
# or has some other useful features.
m4_defun([_LT_CHECK_SHELL_FEATURES],
[AC_MSG_CHECKING([whether the shell understands some XSI constructs])
# Try some XSI features
xsi_shell=no
( _lt_dummy="a/b/c"
  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
      = c,a/b,, \
    && eval 'test $(( 1 + 1 )) -eq 2 \
    && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
  && xsi_shell=yes
AC_MSG_RESULT([$xsi_shell])
_LT_CONFIG_LIBTOOL_INIT([xsi_shell='$xsi_shell'])

AC_MSG_CHECKING([whether the shell understands "+="])
lt_shell_append=no
( foo=bar; set foo baz; eval "$[1]+=\$[2]" && test "$foo" = barbaz ) \
    >/dev/null 2>&1 \
  && lt_shell_append=yes
AC_MSG_RESULT([$lt_shell_append])
_LT_CONFIG_LIBTOOL_INIT([lt_shell_append='$lt_shell_append'])

if ( (MAIL=60; unset MAIL) || exit) >/dev/null 2>&1; then
  lt_unset=unset
else
  lt_unset=false
fi
_LT_DECL([], [lt_unset], [0], [whether the shell understands "unset"])dnl

# test EBCDIC or ASCII
case `echo X|tr X '\101'` in
 A) # ASCII based system
    # \n is not interpreted correctly by Solaris 8 /usr/ucb/tr
  lt_SP2NL='tr \040 \012'
  lt_NL2SP='tr \015\012 \040\040'
  ;;
 *) # EBCDIC based system
  lt_SP2NL='tr \100 \n'
  lt_NL2SP='tr \r\n \100\100'
  ;;
esac
_LT_DECL([SP2NL], [lt_SP2NL], [1], [turn spaces into newlines])dnl
_LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
])# _LT_CHECK_SHELL_FEATURES


# _LT_PROG_XSI_SHELLFNS
# ---------------------
# Bourne and XSI compatible variants of some useful shell functions.
m4_defun([_LT_PROG_XSI_SHELLFNS],
[case $xsi_shell in
  yes)
    cat << \_LT_EOF >> "$cfgfile"

# func_dirname file append nondir_replacement
# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
# otherwise set result to NONDIR_REPLACEMENT.
func_dirname ()
{
  case ${1} in
    */*) func_dirname_result="${1%/*}${2}" ;;
    *  ) func_dirname_result="${3}" ;;
  esac
}

# func_basename file
func_basename ()
{
  func_basename_result="${1##*/}"
}

# func_dirname_and_basename file append nondir_replacement
# perform func_basename and func_dirname in a single function
# call:
#   dirname:  Compute the dirname of FILE.  If nonempty,
#             add APPEND to the result, otherwise set result
#             to NONDIR_REPLACEMENT.
#             value returned in "$func_dirname_result"
#   basename: Compute filename of FILE.
#             value retuned in "$func_basename_result"
# Implementation must be kept synchronized with func_dirname
# and func_basename. For efficiency, we do not delegate to
# those functions but instead duplicate the functionality here.
func_dirname_and_basename ()
{
  case ${1} in
    */*) func_dirname_result="${1%/*}${2}" ;;
    *  ) func_dirname_result="${3}" ;;
  esac
  func_basename_result="${1##*/}"
}

# func_stripname prefix suffix name
# strip PREFIX and SUFFIX off of NAME.
# PREFIX and SUFFIX must not contain globbing or regex special
# characters, hashes, percent signs, but SUFFIX may contain a leading
# dot (in which case that matches only a dot).
func_stripname ()
{
  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
  # positional parameters, so assign one to ordinary parameter first.
  func_stripname_result=${3}
  func_stripname_result=${func_stripname_result#"${1}"}
  func_stripname_result=${func_stripname_result%"${2}"}
}

# func_opt_split
func_opt_split ()
{
  func_opt_split_opt=${1%%=*}
  func_opt_split_arg=${1#*=}
}

# func_lo2o object
func_lo2o ()
{
  case ${1} in
    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
    *)    func_lo2o_result=${1} ;;
  esac
}

# func_xform libobj-or-source
func_xform ()
{
  func_xform_result=${1%.*}.lo
}

# func_arith arithmetic-term...
func_arith ()
{
  func_arith_result=$(( $[*] ))
}

# func_len string
# STRING may not start with a hyphen.
func_len ()
{
  func_len_result=${#1}
}

_LT_EOF
    ;;
  *) # Bourne compatible functions.
    cat << \_LT_EOF >> "$cfgfile"

# func_dirname file append nondir_replacement
# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
# otherwise set result to NONDIR_REPLACEMENT.
func_dirname ()
{
  # Extract subdirectory from the argument.
  func_dirname_result=`$ECHO "X${1}" | $Xsed -e "$dirname"`
  if test "X$func_dirname_result" = "X${1}"; then
    func_dirname_result="${3}"
  else
    func_dirname_result="$func_dirname_result${2}"
  fi
}

# func_basename file
func_basename ()
{
  func_basename_result=`$ECHO "X${1}" | $Xsed -e "$basename"`
}

dnl func_dirname_and_basename
dnl A portable version of this function is already defined in general.m4sh
dnl so there is no need for it here.

# func_stripname prefix suffix name
# strip PREFIX and SUFFIX off of NAME.
# PREFIX and SUFFIX must not contain globbing or regex special
# characters, hashes, percent signs, but SUFFIX may contain a leading
# dot (in which case that matches only a dot).
# func_strip_suffix prefix name
func_stripname ()
{
  case ${2} in
    .*) func_stripname_result=`$ECHO "X${3}" \
           | $Xsed -e "s%^${1}%%" -e "s%\\\\${2}\$%%"`;;
    *)  func_stripname_result=`$ECHO "X${3}" \
           | $Xsed -e "s%^${1}%%" -e "s%${2}\$%%"`;;
  esac
}

# sed scripts:
my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
my_sed_long_arg='1s/^-[[^=]]*=//'

# func_opt_split
func_opt_split ()
{
  func_opt_split_opt=`$ECHO "X${1}" | $Xsed -e "$my_sed_long_opt"`
  func_opt_split_arg=`$ECHO "X${1}" | $Xsed -e "$my_sed_long_arg"`
}

# func_lo2o object
func_lo2o ()
{
  func_lo2o_result=`$ECHO "X${1}" | $Xsed -e "$lo2o"`
}

# func_xform libobj-or-source
func_xform ()
{
  func_xform_result=`$ECHO "X${1}" | $Xsed -e 's/\.[[^.]]*$/.lo/'`
}

# func_arith arithmetic-term...
func_arith ()
{
  func_arith_result=`expr "$[@]"`
}

# func_len string
# STRING may not start with a hyphen.
func_len ()
{
  func_len_result=`expr "$[1]" : ".*" 2>/dev/null || echo $max_cmd_len`
}

_LT_EOF
esac

case $lt_shell_append in
  yes)
    cat << \_LT_EOF >> "$cfgfile"

# func_append var value
# Append VALUE to the end of shell variable VAR.
func_append ()
{
  eval "$[1]+=\$[2]"
}
_LT_EOF
    ;;
  *)
    cat << \_LT_EOF >> "$cfgfile"

# func_append var value
# Append VALUE to the end of shell variable VAR.
func_append ()
{
  eval "$[1]=\$$[1]\$[2]"
}

_LT_EOF
    ;;
  esac
])

# Helper functions for option handling.                    -*- Autoconf -*-
#
#   Copyright (C) 2004, 2005, 2007, 2008 Free Software Foundation, Inc.
#   Written by Gary V. Vaughan, 2004
#
# This file is free software; the Free Software Foundation gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.

# serial 6 ltoptions.m4

# This is to help aclocal find these macros, as it can't see m4_define.
AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])


# _LT_MANGLE_OPTION(MACRO-NAME, OPTION-NAME)
# ------------------------------------------
m4_define([_LT_MANGLE_OPTION],
[[_LT_OPTION_]m4_bpatsubst($1__$2, [[^a-zA-Z0-9_]], [_])])


# _LT_SET_OPTION(MACRO-NAME, OPTION-NAME)
# ---------------------------------------
# Set option OPTION-NAME for macro MACRO-NAME, and if there is a
# matching handler defined, dispatch to it.  Other OPTION-NAMEs are
# saved as a flag.
m4_define([_LT_SET_OPTION],
[m4_define(_LT_MANGLE_OPTION([$1], [$2]))dnl
m4_ifdef(_LT_MANGLE_DEFUN([$1], [$2]),
        _LT_MANGLE_DEFUN([$1], [$2]),
    [m4_warning([Unknown $1 option `$2'])])[]dnl
])


# _LT_IF_OPTION(MACRO-NAME, OPTION-NAME, IF-SET, [IF-NOT-SET])
# ------------------------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
m4_define([_LT_IF_OPTION],
[m4_ifdef(_LT_MANGLE_OPTION([$1], [$2]), [$3], [$4])])


# _LT_UNLESS_OPTIONS(MACRO-NAME, OPTION-LIST, IF-NOT-SET)
# -------------------------------------------------------
# Execute IF-NOT-SET unless all options in OPTION-LIST for MACRO-NAME
# are set.
m4_define([_LT_UNLESS_OPTIONS],
[m4_foreach([_LT_Option], m4_split(m4_normalize([$2])),
	    [m4_ifdef(_LT_MANGLE_OPTION([$1], _LT_Option),
		      [m4_define([$0_found])])])[]dnl
m4_ifdef([$0_found], [m4_undefine([$0_found])], [$3
])[]dnl
])


# _LT_SET_OPTIONS(MACRO-NAME, OPTION-LIST)
# ----------------------------------------
# OPTION-LIST is a space-separated list of Libtool options associated
# with MACRO-NAME.  If any OPTION has a matching handler declared with
# LT_OPTION_DEFINE, dispatch to that macro; otherwise complain about
# the unknown option and exit.
m4_defun([_LT_SET_OPTIONS],
[# Set options
m4_foreach([_LT_Option], m4_split(m4_normalize([$2])),
    [_LT_SET_OPTION([$1], _LT_Option)])

m4_if([$1],[LT_INIT],[
  dnl
  dnl Simply set some default values (i.e off) if boolean options were not
  dnl specified:
  _LT_UNLESS_OPTIONS([LT_INIT], [dlopen], [enable_dlopen=no
  ])
  _LT_UNLESS_OPTIONS([LT_INIT], [win32-dll], [enable_win32_dll=no
  ])
  dnl
  dnl If no reference was made to various pairs of opposing options, then
  dnl we run the default mode handler for the pair.  For example, if neither
  dnl `shared' nor `disable-shared' was passed, we enable building of shared
  dnl archives by default:
  _LT_UNLESS_OPTIONS([LT_INIT], [shared disable-shared], [_LT_ENABLE_SHARED])
  _LT_UNLESS_OPTIONS([LT_INIT], [static disable-static], [_LT_ENABLE_STATIC])
  _LT_UNLESS_OPTIONS([LT_INIT], [pic-only no-pic], [_LT_WITH_PIC])
  _LT_UNLESS_OPTIONS([LT_INIT], [fast-install disable-fast-install],
  		   [_LT_ENABLE_FAST_INSTALL])
  ])
])# _LT_SET_OPTIONS



# _LT_MANGLE_DEFUN(MACRO-NAME, OPTION-NAME)
# -----------------------------------------
m4_define([_LT_MANGLE_DEFUN],
[[_LT_OPTION_DEFUN_]m4_bpatsubst(m4_toupper([$1__$2]), [[^A-Z0-9_]], [_])])


# LT_OPTION_DEFINE(MACRO-NAME, OPTION-NAME, CODE)
# -----------------------------------------------
m4_define([LT_OPTION_DEFINE],
[m4_define(_LT_MANGLE_DEFUN([$1], [$2]), [$3])[]dnl
])# LT_OPTION_DEFINE


# dlopen
# ------
LT_OPTION_DEFINE([LT_INIT], [dlopen], [enable_dlopen=yes
])

AU_DEFUN([AC_LIBTOOL_DLOPEN],
[_LT_SET_OPTION([LT_INIT], [dlopen])
AC_DIAGNOSE([obsolete],
[$0: Remove this warning and the call to _LT_SET_OPTION when you
put the `dlopen' option into LT_INIT's first parameter.])
])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_DLOPEN], [])


# win32-dll
# ---------
# Declare package support for building win32 dll's.
LT_OPTION_DEFINE([LT_INIT], [win32-dll],
[enable_win32_dll=yes

case $host in
*-*-cygwin* | *-*-mingw* | *-*-pw32*)
  AC_CHECK_TOOL(AS, as, false)
  AC_CHECK_TOOL(DLLTOOL, dlltool, false)
  AC_CHECK_TOOL(OBJDUMP, objdump, false)
  ;;
esac

test -z "$AS" && AS=as
_LT_DECL([], [AS],      [0], [Assembler program])dnl

test -z "$DLLTOOL" && DLLTOOL=dlltool
_LT_DECL([], [DLLTOOL], [0], [DLL creation program])dnl

test -z "$OBJDUMP" && OBJDUMP=objdump
_LT_DECL([], [OBJDUMP], [0], [Object dumper program])dnl
])# win32-dll

AU_DEFUN([AC_LIBTOOL_WIN32_DLL],
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
_LT_SET_OPTION([LT_INIT], [win32-dll])
AC_DIAGNOSE([obsolete],
[$0: Remove this warning and the call to _LT_SET_OPTION when you
put the `win32-dll' option into LT_INIT's first parameter.])
])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_WIN32_DLL], [])


# _LT_ENABLE_SHARED([DEFAULT])
# ----------------------------
# implement the --enable-shared flag, and supports the `shared' and
# `disable-shared' LT_INIT options.
# DEFAULT is either `yes' or `no'.  If omitted, it defaults to `yes'.
m4_define([_LT_ENABLE_SHARED],
[m4_define([_LT_ENABLE_SHARED_DEFAULT], [m4_if($1, no, no, yes)])dnl
AC_ARG_ENABLE([shared],
    [AS_HELP_STRING([--enable-shared@<:@=PKGS@:>@],
	[build shared libraries @<:@default=]_LT_ENABLE_SHARED_DEFAULT[@:>@])],
    [p=${PACKAGE-default}
    case $enableval in
    yes) enable_shared=yes ;;
    no) enable_shared=no ;;
    *)
      enable_shared=no
      # Look at the argument we got.  We use all the common list separators.
      lt_save_ifs="$IFS"; IFS="${IFS}$PATH_SEPARATOR,"
      for pkg in $enableval; do
	IFS="$lt_save_ifs"
	if test "X$pkg" = "X$p"; then
	  enable_shared=yes
	fi
      done
      IFS="$lt_save_ifs"
      ;;
    esac],
    [enable_shared=]_LT_ENABLE_SHARED_DEFAULT)

    _LT_DECL([build_libtool_libs], [enable_shared], [0],
	[Whether or not to build shared libraries])
])# _LT_ENABLE_SHARED

LT_OPTION_DEFINE([LT_INIT], [shared], [_LT_ENABLE_SHARED([yes])])
LT_OPTION_DEFINE([LT_INIT], [disable-shared], [_LT_ENABLE_SHARED([no])])

# Old names:
AC_DEFUN([AC_ENABLE_SHARED],
[_LT_SET_OPTION([LT_INIT], m4_if([$1], [no], [disable-])[shared])
])

AC_DEFUN([AC_DISABLE_SHARED],
[_LT_SET_OPTION([LT_INIT], [disable-shared])
])

AU_DEFUN([AM_ENABLE_SHARED], [AC_ENABLE_SHARED($@)])
AU_DEFUN([AM_DISABLE_SHARED], [AC_DISABLE_SHARED($@)])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AM_ENABLE_SHARED], [])
dnl AC_DEFUN([AM_DISABLE_SHARED], [])



# _LT_ENABLE_STATIC([DEFAULT])
# ----------------------------
# implement the --enable-static flag, and support the `static' and
# `disable-static' LT_INIT options.
# DEFAULT is either `yes' or `no'.  If omitted, it defaults to `yes'.
m4_define([_LT_ENABLE_STATIC],
[m4_define([_LT_ENABLE_STATIC_DEFAULT], [m4_if($1, no, no, yes)])dnl
AC_ARG_ENABLE([static],
    [AS_HELP_STRING([--enable-static@<:@=PKGS@:>@],
	[build static libraries @<:@default=]_LT_ENABLE_STATIC_DEFAULT[@:>@])],
    [p=${PACKAGE-default}
    case $enableval in
    yes) enable_static=yes ;;
    no) enable_static=no ;;
    *)
     enable_static=no
      # Look at the argument we got.  We use all the common list separators.
      lt_save_ifs="$IFS"; IFS="${IFS}$PATH_SEPARATOR,"
      for pkg in $enableval; do
	IFS="$lt_save_ifs"
	if test "X$pkg" = "X$p"; then
	  enable_static=yes
	fi
      done
      IFS="$lt_save_ifs"
      ;;
    esac],
    [enable_static=]_LT_ENABLE_STATIC_DEFAULT)

    _LT_DECL([build_old_libs], [enable_static], [0],
	[Whether or not to build static libraries])
])# _LT_ENABLE_STATIC

LT_OPTION_DEFINE([LT_INIT], [static], [_LT_ENABLE_STATIC([yes])])
LT_OPTION_DEFINE([LT_INIT], [disable-static], [_LT_ENABLE_STATIC([no])])

# Old names:
AC_DEFUN([AC_ENABLE_STATIC],
[_LT_SET_OPTION([LT_INIT], m4_if([$1], [no], [disable-])[static])
])

AC_DEFUN([AC_DISABLE_STATIC],
[_LT_SET_OPTION([LT_INIT], [disable-static])
])

AU_DEFUN([AM_ENABLE_STATIC], [AC_ENABLE_STATIC($@)])
AU_DEFUN([AM_DISABLE_STATIC], [AC_DISABLE_STATIC($@)])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AM_ENABLE_STATIC], [])
dnl AC_DEFUN([AM_DISABLE_STATIC], [])



# _LT_ENABLE_FAST_INSTALL([DEFAULT])
# ----------------------------------
# implement the --enable-fast-install flag, and support the `fast-install'
# and `disable-fast-install' LT_INIT options.
# DEFAULT is either `yes' or `no'.  If omitted, it defaults to `yes'.
m4_define([_LT_ENABLE_FAST_INSTALL],
[m4_define([_LT_ENABLE_FAST_INSTALL_DEFAULT], [m4_if($1, no, no, yes)])dnl
AC_ARG_ENABLE([fast-install],
    [AS_HELP_STRING([--enable-fast-install@<:@=PKGS@:>@],
    [optimize for fast installation @<:@default=]_LT_ENABLE_FAST_INSTALL_DEFAULT[@:>@])],
    [p=${PACKAGE-default}
    case $enableval in
    yes) enable_fast_install=yes ;;
    no) enable_fast_install=no ;;
    *)
      enable_fast_install=no
      # Look at the argument we got.  We use all the common list separators.
      lt_save_ifs="$IFS"; IFS="${IFS}$PATH_SEPARATOR,"
      for pkg in $enableval; do
	IFS="$lt_save_ifs"
	if test "X$pkg" = "X$p"; then
	  enable_fast_install=yes
	fi
      done
      IFS="$lt_save_ifs"
      ;;
    esac],
    [enable_fast_install=]_LT_ENABLE_FAST_INSTALL_DEFAULT)

_LT_DECL([fast_install], [enable_fast_install], [0],
	 [Whether or not to optimize for fast installation])dnl
])# _LT_ENABLE_FAST_INSTALL

LT_OPTION_DEFINE([LT_INIT], [fast-install], [_LT_ENABLE_FAST_INSTALL([yes])])
LT_OPTION_DEFINE([LT_INIT], [disable-fast-install], [_LT_ENABLE_FAST_INSTALL([no])])

# Old names:
AU_DEFUN([AC_ENABLE_FAST_INSTALL],
[_LT_SET_OPTION([LT_INIT], m4_if([$1], [no], [disable-])[fast-install])
AC_DIAGNOSE([obsolete],
[$0: Remove this warning and the call to _LT_SET_OPTION when you put
the `fast-install' option into LT_INIT's first parameter.])
])

AU_DEFUN([AC_DISABLE_FAST_INSTALL],
[_LT_SET_OPTION([LT_INIT], [disable-fast-install])
AC_DIAGNOSE([obsolete],
[$0: Remove this warning and the call to _LT_SET_OPTION when you put
the `disable-fast-install' option into LT_INIT's first parameter.])
])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_ENABLE_FAST_INSTALL], [])
dnl AC_DEFUN([AM_DISABLE_FAST_INSTALL], [])


# _LT_WITH_PIC([MODE])
# --------------------
# implement the --with-pic flag, and support the `pic-only' and `no-pic'
# LT_INIT options.
# MODE is either `yes' or `no'.  If omitted, it defaults to `both'.
m4_define([_LT_WITH_PIC],
[AC_ARG_WITH([pic],
    [AS_HELP_STRING([--with-pic],
	[try to use only PIC/non-PIC objects @<:@default=use both@:>@])],
    [pic_mode="$withval"],
    [pic_mode=default])

test -z "$pic_mode" && pic_mode=m4_default([$1], [default])

_LT_DECL([], [pic_mode], [0], [What type of objects to build])dnl
])# _LT_WITH_PIC

LT_OPTION_DEFINE([LT_INIT], [pic-only], [_LT_WITH_PIC([yes])])
LT_OPTION_DEFINE([LT_INIT], [no-pic], [_LT_WITH_PIC([no])])

# Old name:
AU_DEFUN([AC_LIBTOOL_PICMODE],
[_LT_SET_OPTION([LT_INIT], [pic-only])
AC_DIAGNOSE([obsolete],
[$0: Remove this warning and the call to _LT_SET_OPTION when you
put the `pic-only' option into LT_INIT's first parameter.])
])

dnl aclocal-1.4 backwards compatibility:
dnl AC_DEFUN([AC_LIBTOOL_PICMODE], [])


m4_define([_LTDL_MODE], [])
LT_OPTION_DEFINE([LTDL_INIT], [nonrecursive],
		 [m4_define([_LTDL_MODE], [nonrecursive])])
LT_OPTION_DEFINE([LTDL_INIT], [recursive],
		 [m4_define([_LTDL_MODE], [recursive])])
LT_OPTION_DEFINE([LTDL_INIT], [subproject],
		 [m4_define([_LTDL_MODE], [subproject])])

m4_define([_LTDL_TYPE], [])
LT_OPTION_DEFINE([LTDL_INIT], [installable],
		 [m4_define([_LTDL_TYPE], [installable])])
LT_OPTION_DEFINE([LTDL_INIT], [convenience],
		 [m4_define([_LTDL_TYPE], [convenience])])

# ltsugar.m4 -- libtool m4 base layer.                         -*-Autoconf-*-
#
#   Copyright (C) 2004, 2005, 2007 Free Software Foundation, Inc.
#   Written by Gary V. Vaughan, 2004
#
# This file is free software; the Free Software Foundation gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.

# serial 5 ltsugar.m4

# This is to help aclocal find these macros, as it can't see m4_define.
AC_DEFUN([LTSUGAR_VERSION], [m4_if([0.1])])


# lt_join(SEP, ARG1, [ARG2...])
# -----------------------------
# Produce ARG1SEPARG2...SEPARGn, omitting [] arguments and their
# associated separator.
# Needed until we can rely on m4_join from Autoconf 2.62, since all earlier
# versions in m4sugar had bugs.
m4_define([lt_join],
[m4_if([$#], [1], [],
       [$#], [2], [[$2]],
       [m4_if([$2], [], [], [[$2]_])$0([$1], m4_shift(m4_shift($@)))])])
m4_define([_lt_join],
[m4_if([$#$2], [2], [],
       [m4_if([$2], [], [], [[$1$2]])$0([$1], m4_shift(m4_shift($@)))])])


# lt_car(LIST)
# lt_cdr(LIST)
# ------------
# Manipulate m4 lists.
# These macros are necessary as long as will still need to support
# Autoconf-2.59 which quotes differently.
m4_define([lt_car], [[$1]])
m4_define([lt_cdr],
[m4_if([$#], 0, [m4_fatal([$0: cannot be called without arguments])],
       [$#], 1, [],
       [m4_dquote(m4_shift($@))])])
m4_define([lt_unquote], $1)


# lt_append(MACRO-NAME, STRING, [SEPARATOR])
# ------------------------------------------
# Redefine MACRO-NAME to hold its former content plus `SEPARATOR'`STRING'.
# Note that neither SEPARATOR nor STRING are expanded; they are appended
# to MACRO-NAME as is (leaving the expansion for when MACRO-NAME is invoked).
# No SEPARATOR is output if MACRO-NAME was previously undefined (different
# than defined and empty).
#
# This macro is needed until we can rely on Autoconf 2.62, since earlier
# versions of m4sugar mistakenly expanded SEPARATOR but not STRING.
m4_define([lt_append],
[m4_define([$1],
	   m4_ifdef([$1], [m4_defn([$1])[$3]])[$2])])



# lt_combine(SEP, PREFIX-LIST, INFIX, SUFFIX1, [SUFFIX2...])
# ----------------------------------------------------------
# Produce a SEP delimited list of all paired combinations of elements of
# PREFIX-LIST with SUFFIX1 through SUFFIXn.  Each element of the list
# has the form PREFIXmINFIXSUFFIXn.
m4_define([lt_combine],
[m4_if([$2], [], [],
  [m4_if([$4], [], [],
    [lt_join(m4_quote(m4_default([$1], [[, ]])),
      lt_unquote(m4_split(m4_normalize(m4_foreach(_Lt_prefix, [$2],
		   [m4_foreach(_Lt_suffix, lt_car([m4_shiftn(3, $@)]),
			       [_Lt_prefix[]$3[]_Lt_suffix ])])))))])])dnl
])


# lt_if_append_uniq(MACRO-NAME, VARNAME, [SEPARATOR], [UNIQ], [NOT-UNIQ])
# -----------------------------------------------------------------------
# Iff MACRO-NAME does not yet contain VARNAME, then append it (delimited
# by SEPARATOR if supplied) and expand UNIQ, else NOT-UNIQ.
m4_define([lt_if_append_uniq],
[m4_ifdef([$1],
	  [m4_if(m4_index([$3]m4_defn([$1])[$3], [$3$2$3]), [-1],
		 [lt_append([$1], [$2], [$3])$4],
		 [$5])],
	  [lt_append([$1], [$2], [$3])$4])])


# lt_dict_add(DICT, KEY, VALUE)
# -----------------------------
m4_define([lt_dict_add],
[m4_define([$1($2)], [$3])])


# lt_dict_add_subkey(DICT, KEY, SUBKEY, VALUE)
# --------------------------------------------
m4_define([lt_dict_add_subkey],
[m4_define([$1($2:$3)], [$4])])


# lt_dict_fetch(DICT, KEY, [SUBKEY])
# ----------------------------------
m4_define([lt_dict_fetch],
[m4_ifval([$3],
	m4_ifdef([$1($2:$3)], [m4_defn([$1($2:$3)])]),
    m4_ifdef([$1($2)], [m4_defn([$1($2)])]))])


# lt_if_dict_fetch(DICT, KEY, [SUBKEY], VALUE, IF-TRUE, [IF-FALSE])
# -----------------------------------------------------------------
m4_define([lt_if_dict_fetch],
[m4_if(lt_dict_fetch([$1], [$2], [$3]), [$4],
	[$5],
    [$6])])


# lt_dict_filter(DICT, [SUBKEY], VALUE, [SEPARATOR], KEY, [...])
# --------------------------------------------------------------
m4_define([lt_dict_filter],
[m4_if([$5], [], [],
  [lt_join(m4_quote(m4_default([$4], [[, ]])),
           lt_unquote(m4_split(m4_normalize(m4_foreach(_Lt_key, lt_car([m4_shiftn(4, $@)]),
		      [lt_if_dict_fetch([$1], _Lt_key, [$2], [$3], [_Lt_key ])])))))])[]dnl
])

# ltversion.m4 -- version numbers			-*- Autoconf -*-
#
#   Copyright (C) 2004 Free Software Foundation, Inc.
#   Written by Scott James Remnant, 2004
#
# This file is free software; the Free Software Foundation gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.

# Generated from ltversion.in.

# serial 2976 ltversion.m4
# This file is part of GNU Libtool

m4_define([LT_PACKAGE_VERSION], [2.2.4])
m4_define([LT_PACKAGE_REVISION], [1.2976])

AC_DEFUN([LTVERSION_VERSION],
[macro_version='2.2.4'
macro_revision='1.2976'
_LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
_LT_DECL(, macro_revision, 0)
])

# lt~obsolete.m4 -- aclocal satisfying obsolete definitions.    -*-Autoconf-*-
#
#   Copyright (C) 2004, 2005, 2007 Free Software Foundation, Inc.
#   Written by Scott James Remnant, 2004.
#
# This file is free software; the Free Software Foundation gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.

# serial 4 lt~obsolete.m4

# These exist entirely to fool aclocal when bootstrapping libtool.
#
# In the past libtool.m4 has provided macros via AC_DEFUN (or AU_DEFUN)
# which have later been changed to m4_define as they aren't part of the
# exported API, or moved to Autoconf or Automake where they belong.
#
# The trouble is, aclocal is a bit thick.  It'll see the old AC_DEFUN
# in /usr/share/aclocal/libtool.m4 and remember it, then when it sees us
# using a macro with the same name in our local m4/libtool.m4 it'll
# pull the old libtool.m4 in (it doesn't see our shiny new m4_define
# and doesn't know about Autoconf macros at all.)
#
# So we provide this file, which has a silly filename so it's always
# included after everything else.  This provides aclocal with the
# AC_DEFUNs it wants, but when m4 processes it, it doesn't do anything
# because those macros already exist, or will be overwritten later.
# We use AC_DEFUN over AU_DEFUN for compatibility with aclocal-1.6. 
#
# Anytime we withdraw an AC_DEFUN or AU_DEFUN, remember to add it here.
# Yes, that means every name once taken will need to remain here until
# we give up compatibility with versions before 1.7, at which point
# we need to keep only those names which we still refer to.

# This is to help aclocal find these macros, as it can't see m4_define.
AC_DEFUN([LTOBSOLETE_VERSION], [m4_if([1])])

m4_ifndef([AC_LIBTOOL_LINKER_OPTION],	[AC_DEFUN([AC_LIBTOOL_LINKER_OPTION])])
m4_ifndef([AC_PROG_EGREP],		[AC_DEFUN([AC_PROG_EGREP])])
m4_ifndef([_LT_AC_PROG_ECHO_BACKSLASH],	[AC_DEFUN([_LT_AC_PROG_ECHO_BACKSLASH])])
m4_ifndef([_LT_AC_SHELL_INIT],		[AC_DEFUN([_LT_AC_SHELL_INIT])])
m4_ifndef([_LT_AC_SYS_LIBPATH_AIX],	[AC_DEFUN([_LT_AC_SYS_LIBPATH_AIX])])
m4_ifndef([_LT_PROG_LTMAIN],		[AC_DEFUN([_LT_PROG_LTMAIN])])
m4_ifndef([_LT_AC_TAGVAR],		[AC_DEFUN([_LT_AC_TAGVAR])])
m4_ifndef([AC_LTDL_ENABLE_INSTALL],	[AC_DEFUN([AC_LTDL_ENABLE_INSTALL])])
m4_ifndef([AC_LTDL_PREOPEN],		[AC_DEFUN([AC_LTDL_PREOPEN])])
m4_ifndef([_LT_AC_SYS_COMPILER],	[AC_DEFUN([_LT_AC_SYS_COMPILER])])
m4_ifndef([_LT_AC_LOCK],		[AC_DEFUN([_LT_AC_LOCK])])
m4_ifndef([AC_LIBTOOL_SYS_OLD_ARCHIVE],	[AC_DEFUN([AC_LIBTOOL_SYS_OLD_ARCHIVE])])
m4_ifndef([_LT_AC_TRY_DLOPEN_SELF],	[AC_DEFUN([_LT_AC_TRY_DLOPEN_SELF])])
m4_ifndef([AC_LIBTOOL_PROG_CC_C_O],	[AC_DEFUN([AC_LIBTOOL_PROG_CC_C_O])])
m4_ifndef([AC_LIBTOOL_SYS_HARD_LINK_LOCKS], [AC_DEFUN([AC_LIBTOOL_SYS_HARD_LINK_LOCKS])])
m4_ifndef([AC_LIBTOOL_OBJDIR],		[AC_DEFUN([AC_LIBTOOL_OBJDIR])])
m4_ifndef([AC_LTDL_OBJDIR],		[AC_DEFUN([AC_LTDL_OBJDIR])])
m4_ifndef([AC_LIBTOOL_PROG_LD_HARDCODE_LIBPATH], [AC_DEFUN([AC_LIBTOOL_PROG_LD_HARDCODE_LIBPATH])])
m4_ifndef([AC_LIBTOOL_SYS_LIB_STRIP],	[AC_DEFUN([AC_LIBTOOL_SYS_LIB_STRIP])])
m4_ifndef([AC_PATH_MAGIC],		[AC_DEFUN([AC_PATH_MAGIC])])
m4_ifndef([AC_PROG_LD_GNU],		[AC_DEFUN([AC_PROG_LD_GNU])])
m4_ifndef([AC_PROG_LD_RELOAD_FLAG],	[AC_DEFUN([AC_PROG_LD_RELOAD_FLAG])])
m4_ifndef([AC_DEPLIBS_CHECK_METHOD],	[AC_DEFUN([AC_DEPLIBS_CHECK_METHOD])])
m4_ifndef([AC_LIBTOOL_PROG_COMPILER_NO_RTTI], [AC_DEFUN([AC_LIBTOOL_PROG_COMPILER_NO_RTTI])])
m4_ifndef([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE], [AC_DEFUN([AC_LIBTOOL_SYS_GLOBAL_SYMBOL_PIPE])])
m4_ifndef([AC_LIBTOOL_PROG_COMPILER_PIC], [AC_DEFUN([AC_LIBTOOL_PROG_COMPILER_PIC])])
m4_ifndef([AC_LIBTOOL_PROG_LD_SHLIBS],	[AC_DEFUN([AC_LIBTOOL_PROG_LD_SHLIBS])])
m4_ifndef([AC_LIBTOOL_POSTDEP_PREDEP],	[AC_DEFUN([AC_LIBTOOL_POSTDEP_PREDEP])])
m4_ifndef([LT_AC_PROG_EGREP],		[AC_DEFUN([LT_AC_PROG_EGREP])])
m4_ifndef([LT_AC_PROG_SED],		[AC_DEFUN([LT_AC_PROG_SED])])
m4_ifndef([_LT_CC_BASENAME],		[AC_DEFUN([_LT_CC_BASENAME])])
m4_ifndef([_LT_COMPILER_BOILERPLATE],	[AC_DEFUN([_LT_COMPILER_BOILERPLATE])])
m4_ifndef([_LT_LINKER_BOILERPLATE],	[AC_DEFUN([_LT_LINKER_BOILERPLATE])])
m4_ifndef([_AC_PROG_LIBTOOL],		[AC_DEFUN([_AC_PROG_LIBTOOL])])
m4_ifndef([AC_LIBTOOL_SETUP],		[AC_DEFUN([AC_LIBTOOL_SETUP])])
m4_ifndef([_LT_AC_CHECK_DLFCN],		[AC_DEFUN([_LT_AC_CHECK_DLFCN])])
m4_ifndef([AC_LIBTOOL_SYS_DYNAMIC_LINKER],	[AC_DEFUN([AC_LIBTOOL_SYS_DYNAMIC_LINKER])])
m4_ifndef([_LT_AC_TAGCONFIG],		[AC_DEFUN([_LT_AC_TAGCONFIG])])
m4_ifndef([AC_DISABLE_FAST_INSTALL],	[AC_DEFUN([AC_DISABLE_FAST_INSTALL])])
m4_ifndef([_LT_AC_LANG_CXX],		[AC_DEFUN([_LT_AC_LANG_CXX])])
m4_ifndef([_LT_AC_LANG_F77],		[AC_DEFUN([_LT_AC_LANG_F77])])
m4_ifndef([_LT_AC_LANG_GCJ],		[AC_DEFUN([_LT_AC_LANG_GCJ])])
m4_ifndef([AC_LIBTOOL_RC],		[AC_DEFUN([AC_LIBTOOL_RC])])
m4_ifndef([AC_LIBTOOL_LANG_C_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_C_CONFIG])])
m4_ifndef([_LT_AC_LANG_C_CONFIG],	[AC_DEFUN([_LT_AC_LANG_C_CONFIG])])
m4_ifndef([AC_LIBTOOL_LANG_CXX_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_CXX_CONFIG])])
m4_ifndef([_LT_AC_LANG_CXX_CONFIG],	[AC_DEFUN([_LT_AC_LANG_CXX_CONFIG])])
m4_ifndef([AC_LIBTOOL_LANG_F77_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_F77_CONFIG])])
m4_ifndef([_LT_AC_LANG_F77_CONFIG],	[AC_DEFUN([_LT_AC_LANG_F77_CONFIG])])
m4_ifndef([AC_LIBTOOL_LANG_GCJ_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_GCJ_CONFIG])])
m4_ifndef([_LT_AC_LANG_GCJ_CONFIG],	[AC_DEFUN([_LT_AC_LANG_GCJ_CONFIG])])
m4_ifndef([AC_LIBTOOL_LANG_RC_CONFIG],	[AC_DEFUN([AC_LIBTOOL_LANG_RC_CONFIG])])
m4_ifndef([_LT_AC_LANG_RC_CONFIG],	[AC_DEFUN([_LT_AC_LANG_RC_CONFIG])])
m4_ifndef([AC_LIBTOOL_CONFIG],		[AC_DEFUN([AC_LIBTOOL_CONFIG])])
m4_ifndef([_LT_AC_FILE_LTDLL_C],	[AC_DEFUN([_LT_AC_FILE_LTDLL_C])])

# Copyright (C) 2002, 2003, 2005, 2006, 2007, 2008  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_AUTOMAKE_VERSION(VERSION)
# ----------------------------
# Automake X.Y traces this macro to ensure aclocal.m4 has been
# generated from the m4 files accompanying Automake X.Y.
# (This private macro should not be called outside this file.)
AC_DEFUN([AM_AUTOMAKE_VERSION],
[am__api_version='1.11'
dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
dnl require some minimum version.  Point them to the right macro.
m4_if([$1], [1.11.1], [],
      [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
])

# _AM_AUTOCONF_VERSION(VERSION)
# -----------------------------
# aclocal traces this macro to find the Autoconf version.
# This is a private macro too.  Using m4_define simplifies
# the logic in aclocal, which can simply ignore this definition.
m4_define([_AM_AUTOCONF_VERSION], [])

# AM_SET_CURRENT_AUTOMAKE_VERSION
# -------------------------------
# Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
# This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
[AM_AUTOMAKE_VERSION([1.11.1])dnl
m4_ifndef([AC_AUTOCONF_VERSION],
  [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
_AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])

# AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-

# Copyright (C) 2001, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# For projects using AC_CONFIG_AUX_DIR([foo]), Autoconf sets
# $ac_aux_dir to `$srcdir/foo'.  In other projects, it is set to
# `$srcdir', `$srcdir/..', or `$srcdir/../..'.
#
# Of course, Automake must honor this variable whenever it calls a
# tool from the auxiliary directory.  The problem is that $srcdir (and
# therefore $ac_aux_dir as well) can be either absolute or relative,
# depending on how configure is run.  This is pretty annoying, since
# it makes $ac_aux_dir quite unusable in subdirectories: in the top
# source directory, any form will work fine, but in subdirectories a
# relative path needs to be adjusted first.
#
# $ac_aux_dir/missing
#    fails when called from a subdirectory if $ac_aux_dir is relative
# $top_srcdir/$ac_aux_dir/missing
#    fails if $ac_aux_dir is absolute,
#    fails when called from a subdirectory in a VPATH build with
#          a relative $ac_aux_dir
#
# The reason of the latter failure is that $top_srcdir and $ac_aux_dir
# are both prefixed by $srcdir.  In an in-source build this is usually
# harmless because $srcdir is `.', but things will broke when you
# start a VPATH build or use an absolute $srcdir.
#
# So we could use something similar to $top_srcdir/$ac_aux_dir/missing,
# iff we strip the leading $srcdir from $ac_aux_dir.  That would be:
#   am_aux_dir='\$(top_srcdir)/'`expr "$ac_aux_dir" : "$srcdir//*\(.*\)"`
# and then we would define $MISSING as
#   MISSING="\${SHELL} $am_aux_dir/missing"
# This will work as long as MISSING is not called from configure, because
# unfortunately $(top_srcdir) has no meaning in configure.
# However there are other variables, like CC, which are often used in
# configure, and could therefore not use this "fixed" $ac_aux_dir.
#
# Another solution, used here, is to always expand $ac_aux_dir to an
# absolute PATH.  The drawback is that using absolute paths prevent a
# configured tree to be moved without reconfiguration.

AC_DEFUN([AM_AUX_DIR_EXPAND],
[dnl Rely on autoconf to set up CDPATH properly.
AC_PREREQ([2.50])dnl
# expand $ac_aux_dir to an absolute path
am_aux_dir=`cd $ac_aux_dir && pwd`
])

# AM_CONDITIONAL                                            -*- Autoconf -*-

# Copyright (C) 1997, 2000, 2001, 2003, 2004, 2005, 2006, 2008
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 9

# AM_CONDITIONAL(NAME, SHELL-CONDITION)
# -------------------------------------
# Define a conditional.
AC_DEFUN([AM_CONDITIONAL],
[AC_PREREQ(2.52)dnl
 ifelse([$1], [TRUE],  [AC_FATAL([$0: invalid condition: $1])],
	[$1], [FALSE], [AC_FATAL([$0: invalid condition: $1])])dnl
AC_SUBST([$1_TRUE])dnl
AC_SUBST([$1_FALSE])dnl
_AM_SUBST_NOTMAKE([$1_TRUE])dnl
_AM_SUBST_NOTMAKE([$1_FALSE])dnl
m4_define([_AM_COND_VALUE_$1], [$2])dnl
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi
AC_CONFIG_COMMANDS_PRE(
[if test -z "${$1_TRUE}" && test -z "${$1_FALSE}"; then
  AC_MSG_ERROR([[conditional "$1" was never defined.
Usually this means the macro was only invoked conditionally.]])
fi])])

# Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2009
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 10

# There are a few dirty hacks below to avoid letting `AC_PROG_CC' be
# written in clear, in which case automake, when reading aclocal.m4,
# will think it sees a *use*, and therefore will trigger all it's
# C support machinery.  Also note that it means that autoscan, seeing
# CC etc. in the Makefile, will ask for an AC_PROG_CC use...


# _AM_DEPENDENCIES(NAME)
# ----------------------
# See how the compiler implements dependency checking.
# NAME is "CC", "CXX", "GCJ", or "OBJC".
# We try a few techniques and use that to set a single cache variable.
#
# We don't AC_REQUIRE the corresponding AC_PROG_CC since the latter was
# modified to invoke _AM_DEPENDENCIES(CC); we would have a circular
# dependency, and given that the user is not expected to run this macro,
# just rely on AC_PROG_CC.
AC_DEFUN([_AM_DEPENDENCIES],
[AC_REQUIRE([AM_SET_DEPDIR])dnl
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])dnl
AC_REQUIRE([AM_MAKE_INCLUDE])dnl
AC_REQUIRE([AM_DEP_TRACK])dnl

ifelse([$1], CC,   [depcc="$CC"   am_compiler_list=],
       [$1], CXX,  [depcc="$CXX"  am_compiler_list=],
       [$1], OBJC, [depcc="$OBJC" am_compiler_list='gcc3 gcc'],
       [$1], UPC,  [depcc="$UPC"  am_compiler_list=],
       [$1], GCJ,  [depcc="$GCJ"  am_compiler_list='gcc3 gcc'],
                   [depcc="$$1"   am_compiler_list=])

AC_CACHE_CHECK([dependency style of $depcc],
               [am_cv_$1_dependencies_compiler_type],
[if test -z "$AMDEP_TRUE" && test -f "$am_depcomp"; then
  # We make a subdir and do the tests there.  Otherwise we can end up
  # making bogus files that we don't know about and never remove.  For
  # instance it was reported that on HP-UX the gcc test will end up
  # making a dummy file named `D' -- because `-MD' means `put the output
  # in D'.
  mkdir conftest.dir
  # Copy depcomp to subdir because otherwise we won't find it if we're
  # using a relative directory.
  cp "$am_depcomp" conftest.dir
  cd conftest.dir
  # We will build objects and dependencies in a subdirectory because
  # it helps to detect inapplicable dependency modes.  For instance
  # both Tru64's cc and ICC support -MD to output dependencies as a
  # side effect of compilation, but ICC will put the dependencies in
  # the current directory while Tru64 will put them in the object
  # directory.
  mkdir sub

  am_cv_$1_dependencies_compiler_type=none
  if test "$am_compiler_list" = ""; then
     am_compiler_list=`sed -n ['s/^#*\([a-zA-Z0-9]*\))$/\1/p'] < ./depcomp`
  fi
  am__universal=false
  m4_case([$1], [CC],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac],
    [CXX],
    [case " $depcc " in #(
     *\ -arch\ *\ -arch\ *) am__universal=true ;;
     esac])

  for depmode in $am_compiler_list; do
    # Setup a source with many dependencies, because some compilers
    # like to wrap large dependency lists on column 80 (with \), and
    # we should not choose a depcomp mode which is confused by this.
    #
    # We need to recreate these files for each test, as the compiler may
    # overwrite some of them when testing with obscure command lines.
    # This happens at least with the AIX C compiler.
    : > sub/conftest.c
    for i in 1 2 3 4 5 6; do
      echo '#include "conftst'$i'.h"' >> sub/conftest.c
      # Using `: > sub/conftst$i.h' creates only sub/conftst1.h with
      # Solaris 8's {/usr,}/bin/sh.
      touch sub/conftst$i.h
    done
    echo "${am__include} ${am__quote}sub/conftest.Po${am__quote}" > confmf

    # We check with `-c' and `-o' for the sake of the "dashmstdout"
    # mode.  It turns out that the SunPro C++ compiler does not properly
    # handle `-M -o', and we need to detect this.  Also, some Intel
    # versions had trouble with output in subdirs
    am__obj=sub/conftest.${OBJEXT-o}
    am__minus_obj="-o $am__obj"
    case $depmode in
    gcc)
      # This depmode causes a compiler race in universal mode.
      test "$am__universal" = false || continue
      ;;
    nosideeffect)
      # after this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    msvisualcpp | msvcmsys)
      # This compiler won't grok `-c -o', but also, the minuso test has
      # not run yet.  These depmodes are late enough in the game, and
      # so weak that their functioning should not be impacted.
      am__obj=conftest.${OBJEXT-o}
      am__minus_obj=
      ;;
    none) break ;;
    esac
    if depmode=$depmode \
       source=sub/conftest.c object=$am__obj \
       depfile=sub/conftest.Po tmpdepfile=sub/conftest.TPo \
       $SHELL ./depcomp $depcc -c $am__minus_obj sub/conftest.c \
         >/dev/null 2>conftest.err &&
       grep sub/conftst1.h sub/conftest.Po > /dev/null 2>&1 &&
       grep sub/conftst6.h sub/conftest.Po > /dev/null 2>&1 &&
       grep $am__obj sub/conftest.Po > /dev/null 2>&1 &&
       ${MAKE-make} -s -f confmf > /dev/null 2>&1; then
      # icc doesn't choke on unknown options, it will just issue warnings
      # or remarks (even with -Werror).  So we grep stderr for any message
      # that says an option was ignored or not supported.
      # When given -MP, icc 7.0 and 7.1 complain thusly:
      #   icc: Command line warning: ignoring option '-M'; no argument required
      # The diagnosis changed in icc 8.0:
      #   icc: Command line remark: option '-MP' not supported
      if (grep 'ignoring option' conftest.err ||
          grep 'not supported' conftest.err) >/dev/null 2>&1; then :; else
        am_cv_$1_dependencies_compiler_type=$depmode
        break
      fi
    fi
  done

  cd ..
  rm -rf conftest.dir
else
  am_cv_$1_dependencies_compiler_type=none
fi
])
AC_SUBST([$1DEPMODE], [depmode=$am_cv_$1_dependencies_compiler_type])
AM_CONDITIONAL([am__fastdep$1], [
  test "x$enable_dependency_tracking" != xno \
  && test "$am_cv_$1_dependencies_compiler_type" = gcc3])
])


# AM_SET_DEPDIR
# -------------
# Choose a directory name for dependency files.
# This macro is AC_REQUIREd in _AM_DEPENDENCIES
AC_DEFUN([AM_SET_DEPDIR],
[AC_REQUIRE([AM_SET_LEADING_DOT])dnl
AC_SUBST([DEPDIR], ["${am__leading_dot}deps"])dnl
])


# AM_DEP_TRACK
# ------------
AC_DEFUN([AM_DEP_TRACK],
[AC_ARG_ENABLE(dependency-tracking,
[  --disable-dependency-tracking  speeds up one-time build
  --enable-dependency-tracking   do not reject slow dependency extractors])
if test "x$enable_dependency_tracking" != xno; then
  am_depcomp="$ac_aux_dir/depcomp"
  AMDEPBACKSLASH='\'
fi
AM_CONDITIONAL([AMDEP], [test "x$enable_dependency_tracking" != xno])
AC_SUBST([AMDEPBACKSLASH])dnl
_AM_SUBST_NOTMAKE([AMDEPBACKSLASH])dnl
])

# Generate code to set up dependency tracking.              -*- Autoconf -*-

# Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2008
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

#serial 5

# _AM_OUTPUT_DEPENDENCY_COMMANDS
# ------------------------------
AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
[{
  # Autoconf 2.62 quotes --file arguments for eval, but not when files
  # are listed without --file.  Let's play safe and only enable the eval
  # if we detect the quoting.
  case $CONFIG_FILES in
  *\'*) eval set x "$CONFIG_FILES" ;;
  *)   set x $CONFIG_FILES ;;
  esac
  shift
  for mf
  do
    # Strip MF so we end up with the name of the file.
    mf=`echo "$mf" | sed -e 's/:.*$//'`
    # Check whether this is an Automake generated Makefile or not.
    # We used to match only the files named `Makefile.in', but
    # some people rename them; so instead we look at the file content.
    # Grep'ing the first line is not enough: some people post-process
    # each Makefile.in and add a new line on top of each file to say so.
    # Grep'ing the whole file is not good either: AIX grep has a line
    # limit of 2048, but all sed's we know have understand at least 4000.
    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
      dirpart=`AS_DIRNAME("$mf")`
    else
      continue
    fi
    # Extract the definition of DEPDIR, am__include, and am__quote
    # from the Makefile without running `make'.
    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
    test -z "$DEPDIR" && continue
    am__include=`sed -n 's/^am__include = //p' < "$mf"`
    test -z "am__include" && continue
    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
    # When using ansi2knr, U may be empty or an underscore; expand it
    U=`sed -n 's/^U = //p' < "$mf"`
    # Find all dependency output files, they are included files with
    # $(DEPDIR) in their names.  We invoke sed twice because it is the
    # simplest approach to changing $(DEPDIR) to its actual value in the
    # expansion.
    for file in `sed -n "
      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g' -e 's/\$U/'"$U"'/g'`; do
      # Make sure the directory exists.
      test -f "$dirpart/$file" && continue
      fdir=`AS_DIRNAME(["$file"])`
      AS_MKDIR_P([$dirpart/$fdir])
      # echo "creating $dirpart/$file"
      echo '# dummy' > "$dirpart/$file"
    done
  done
}
])# _AM_OUTPUT_DEPENDENCY_COMMANDS


# AM_OUTPUT_DEPENDENCY_COMMANDS
# -----------------------------
# This macro should only be invoked once -- use via AC_REQUIRE.
#
# This code is only required when automatic dependency tracking
# is enabled.  FIXME.  This creates each `.P' file that we will
# need in order to bootstrap the dependency handling code.
AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
[AC_CONFIG_COMMANDS([depfiles],
     [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
])

# Copyright (C) 1996, 1997, 2000, 2001, 2003, 2005
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 8

# AM_CONFIG_HEADER is obsolete.  It has been replaced by AC_CONFIG_HEADERS.
AU_DEFUN([AM_CONFIG_HEADER], [AC_CONFIG_HEADERS($@)])

# Do all the work for Automake.                             -*- Autoconf -*-

# Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004,
# 2005, 2006, 2008, 2009 Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 16

# This macro actually does too much.  Some checks are only needed if
# your package does certain things.  But this isn't really a big deal.

# AM_INIT_AUTOMAKE(PACKAGE, VERSION, [NO-DEFINE])
# AM_INIT_AUTOMAKE([OPTIONS])
# -----------------------------------------------
# The call with PACKAGE and VERSION arguments is the old style
# call (pre autoconf-2.50), which is being phased out.  PACKAGE
# and VERSION should now be passed to AC_INIT and removed from
# the call to AM_INIT_AUTOMAKE.
# We support both call styles for the transition.  After
# the next Automake release, Autoconf can make the AC_INIT
# arguments mandatory, and then we can depend on a new Autoconf
# release and drop the old call support.
AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_PREREQ([2.62])dnl
dnl Autoconf wants to disallow AM_ names.  We explicitly allow
dnl the ones we care about.
m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
AC_REQUIRE([AM_SET_CURRENT_AUTOMAKE_VERSION])dnl
AC_REQUIRE([AC_PROG_INSTALL])dnl
if test "`cd $srcdir && pwd`" != "`pwd`"; then
  # Use -I$(srcdir) only when $(srcdir) != ., so that make's output
  # is not polluted with repeated "-I."
  AC_SUBST([am__isrc], [' -I$(srcdir)'])_AM_SUBST_NOTMAKE([am__isrc])dnl
  # test to see if srcdir already configured
  if test -f $srcdir/config.status; then
    AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
  fi
fi

# test whether we have cygpath
if test -z "$CYGPATH_W"; then
  if (cygpath --version) >/dev/null 2>/dev/null; then
    CYGPATH_W='cygpath -w'
  else
    CYGPATH_W=echo
  fi
fi
AC_SUBST([CYGPATH_W])

# Define the identity of the package.
dnl Distinguish between old-style and new-style calls.
m4_ifval([$2],
[m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
 AC_SUBST([PACKAGE], [$1])dnl
 AC_SUBST([VERSION], [$2])],
[_AM_SET_OPTIONS([$1])dnl
dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
m4_if(m4_ifdef([AC_PACKAGE_NAME], 1)m4_ifdef([AC_PACKAGE_VERSION], 1), 11,,
  [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
 AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
 AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])])dnl

_AM_IF_OPTION([no-define],,
[AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
 AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package])])dnl

# Some tools Automake needs.
AC_REQUIRE([AM_SANITY_CHECK])dnl
AC_REQUIRE([AC_ARG_PROGRAM])dnl
AM_MISSING_PROG(ACLOCAL, aclocal-${am__api_version})
AM_MISSING_PROG(AUTOCONF, autoconf)
AM_MISSING_PROG(AUTOMAKE, automake-${am__api_version})
AM_MISSING_PROG(AUTOHEADER, autoheader)
AM_MISSING_PROG(MAKEINFO, makeinfo)
AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
AC_REQUIRE([AM_PROG_MKDIR_P])dnl
# We need awk for the "check" target.  The system "awk" is bad on
# some platforms.
AC_REQUIRE([AC_PROG_AWK])dnl
AC_REQUIRE([AC_PROG_MAKE_SET])dnl
AC_REQUIRE([AM_SET_LEADING_DOT])dnl
_AM_IF_OPTION([tar-ustar], [_AM_PROG_TAR([ustar])],
	      [_AM_IF_OPTION([tar-pax], [_AM_PROG_TAR([pax])],
			     [_AM_PROG_TAR([v7])])])
_AM_IF_OPTION([no-dependencies],,
[AC_PROVIDE_IFELSE([AC_PROG_CC],
		  [_AM_DEPENDENCIES(CC)],
		  [define([AC_PROG_CC],
			  defn([AC_PROG_CC])[_AM_DEPENDENCIES(CC)])])dnl
AC_PROVIDE_IFELSE([AC_PROG_CXX],
		  [_AM_DEPENDENCIES(CXX)],
		  [define([AC_PROG_CXX],
			  defn([AC_PROG_CXX])[_AM_DEPENDENCIES(CXX)])])dnl
AC_PROVIDE_IFELSE([AC_PROG_OBJC],
		  [_AM_DEPENDENCIES(OBJC)],
		  [define([AC_PROG_OBJC],
			  defn([AC_PROG_OBJC])[_AM_DEPENDENCIES(OBJC)])])dnl
])
_AM_IF_OPTION([silent-rules], [AC_REQUIRE([AM_SILENT_RULES])])dnl
dnl The `parallel-tests' driver may need to know about EXEEXT, so add the
dnl `am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This macro
dnl is hooked onto _AC_COMPILER_EXEEXT early, see below.
AC_CONFIG_COMMANDS_PRE(dnl
[m4_provide_if([_AM_COMPILER_EXEEXT],
  [AM_CONDITIONAL([am__EXEEXT], [test -n "$EXEEXT"])])])dnl
])

dnl Hook into `_AC_COMPILER_EXEEXT' early to learn its expansion.  Do not
dnl add the conditional right here, as _AC_COMPILER_EXEEXT may be further
dnl mangled by Autoconf and run in a shell conditional statement.
m4_define([_AC_COMPILER_EXEEXT],
m4_defn([_AC_COMPILER_EXEEXT])[m4_provide([_AM_COMPILER_EXEEXT])])


# When config.status generates a header, we must update the stamp-h file.
# This file resides in the same directory as the config header
# that is generated.  The stamp files are numbered to have different names.

# Autoconf calls _AC_AM_CONFIG_HEADER_HOOK (when defined) in the
# loop where config.status creates the headers, so we can generate
# our stamp files there.
AC_DEFUN([_AC_AM_CONFIG_HEADER_HOOK],
[# Compute $1's index in $config_headers.
_am_arg=$1
_am_stamp_count=1
for _am_header in $config_headers :; do
  case $_am_header in
    $_am_arg | $_am_arg:* )
      break ;;
    * )
      _am_stamp_count=`expr $_am_stamp_count + 1` ;;
  esac
done
echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_am_stamp_count])

# Copyright (C) 2001, 2003, 2005, 2008  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_SH
# ------------------
# Define $install_sh.
AC_DEFUN([AM_PROG_INSTALL_SH],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
if test x"${install_sh}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    install_sh="\${SHELL} '$am_aux_dir/install-sh'" ;;
  *)
    install_sh="\${SHELL} $am_aux_dir/install-sh"
  esac
fi
AC_SUBST(install_sh)])

# Copyright (C) 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 2

# Check whether the underlying file-system supports filenames
# with a leading dot.  For instance MS-DOS doesn't.
AC_DEFUN([AM_SET_LEADING_DOT],
[rm -rf .tst 2>/dev/null
mkdir .tst 2>/dev/null
if test -d .tst; then
  am__leading_dot=.
else
  am__leading_dot=_
fi
rmdir .tst 2>/dev/null
AC_SUBST([am__leading_dot])])

# Add --enable-maintainer-mode option to configure.         -*- Autoconf -*-
# From Jim Meyering

# Copyright (C) 1996, 1998, 2000, 2001, 2002, 2003, 2004, 2005, 2008
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 5

# AM_MAINTAINER_MODE([DEFAULT-MODE])
# ----------------------------------
# Control maintainer-specific portions of Makefiles.
# Default is to disable them, unless `enable' is passed literally.
# For symmetry, `disable' may be passed as well.  Anyway, the user
# can override the default with the --enable/--disable switch.
AC_DEFUN([AM_MAINTAINER_MODE],
[m4_case(m4_default([$1], [disable]),
       [enable], [m4_define([am_maintainer_other], [disable])],
       [disable], [m4_define([am_maintainer_other], [enable])],
       [m4_define([am_maintainer_other], [enable])
        m4_warn([syntax], [unexpected argument to AM@&t@_MAINTAINER_MODE: $1])])
AC_MSG_CHECKING([whether to am_maintainer_other maintainer-specific portions of Makefiles])
  dnl maintainer-mode's default is 'disable' unless 'enable' is passed
  AC_ARG_ENABLE([maintainer-mode],
[  --][am_maintainer_other][-maintainer-mode  am_maintainer_other make rules and dependencies not useful
			  (and sometimes confusing) to the casual installer],
      [USE_MAINTAINER_MODE=$enableval],
      [USE_MAINTAINER_MODE=]m4_if(am_maintainer_other, [enable], [no], [yes]))
  AC_MSG_RESULT([$USE_MAINTAINER_MODE])
  AM_CONDITIONAL([MAINTAINER_MODE], [test $USE_MAINTAINER_MODE = yes])
  MAINT=$MAINTAINER_MODE_TRUE
  AC_SUBST([MAINT])dnl
]
)

AU_DEFUN([jm_MAINTAINER_MODE], [AM_MAINTAINER_MODE])

# Check to see how 'make' treats includes.	            -*- Autoconf -*-

# Copyright (C) 2001, 2002, 2003, 2005, 2009  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 4

# AM_MAKE_INCLUDE()
# -----------------
# Check to see how make treats includes.
AC_DEFUN([AM_MAKE_INCLUDE],
[am_make=${MAKE-make}
cat > confinc << 'END'
am__doit:
	@echo this is the am__doit target
.PHONY: am__doit
END
# If we don't find an include directive, just comment out the code.
AC_MSG_CHECKING([for style of include used by $am_make])
am__include="#"
am__quote=
_am_result=none
# First try GNU make style include.
echo "include confinc" > confmf
# Ignore all kinds of additional output from `make'.
case `$am_make -s -f confmf 2> /dev/null` in #(
*the\ am__doit\ target*)
  am__include=include
  am__quote=
  _am_result=GNU
  ;;
esac
# Now try BSD make style include.
if test "$am__include" = "#"; then
   echo '.include "confinc"' > confmf
   case `$am_make -s -f confmf 2> /dev/null` in #(
   *the\ am__doit\ target*)
     am__include=.include
     am__quote="\""
     _am_result=BSD
     ;;
   esac
fi
AC_SUBST([am__include])
AC_SUBST([am__quote])
AC_MSG_RESULT([$_am_result])
rm -f confinc confmf
])

# Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-

# Copyright (C) 1997, 1999, 2000, 2001, 2003, 2004, 2005, 2008
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 6

# AM_MISSING_PROG(NAME, PROGRAM)
# ------------------------------
AC_DEFUN([AM_MISSING_PROG],
[AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])


# AM_MISSING_HAS_RUN
# ------------------
# Define MISSING if not defined so far and test if it supports --run.
# If it does, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN],
[AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
AC_REQUIRE_AUX_FILE([missing])dnl
if test x"${MISSING+set}" != xset; then
  case $am_aux_dir in
  *\ * | *\	*)
    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
  *)
    MISSING="\${SHELL} $am_aux_dir/missing" ;;
  esac
fi
# Use eval to expand $SHELL
if eval "$MISSING --run true"; then
  am_missing_run="$MISSING --run "
else
  am_missing_run=
  AC_MSG_WARN([`missing' script is too old or missing])
fi
])

# Copyright (C) 2003, 2004, 2005, 2006  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_MKDIR_P
# ---------------
# Check for `mkdir -p'.
AC_DEFUN([AM_PROG_MKDIR_P],
[AC_PREREQ([2.60])dnl
AC_REQUIRE([AC_PROG_MKDIR_P])dnl
dnl Automake 1.8 to 1.9.6 used to define mkdir_p.  We now use MKDIR_P,
dnl while keeping a definition of mkdir_p for backward compatibility.
dnl @MKDIR_P@ is magic: AC_OUTPUT adjusts its value for each Makefile.
dnl However we cannot define mkdir_p as $(MKDIR_P) for the sake of
dnl Makefile.ins that do not define MKDIR_P, so we do our own
dnl adjustment using top_builddir (which is defined more often than
dnl MKDIR_P).
AC_SUBST([mkdir_p], ["$MKDIR_P"])dnl
case $mkdir_p in
  [[\\/$]]* | ?:[[\\/]]*) ;;
  */*) mkdir_p="\$(top_builddir)/$mkdir_p" ;;
esac
])

# Helper functions for option handling.                     -*- Autoconf -*-

# Copyright (C) 2001, 2002, 2003, 2005, 2008  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 4

# _AM_MANGLE_OPTION(NAME)
# -----------------------
AC_DEFUN([_AM_MANGLE_OPTION],
[[_AM_OPTION_]m4_bpatsubst($1, [[^a-zA-Z0-9_]], [_])])

# _AM_SET_OPTION(NAME)
# ------------------------------
# Set option NAME.  Presently that only means defining a flag for this option.
AC_DEFUN([_AM_SET_OPTION],
[m4_define(_AM_MANGLE_OPTION([$1]), 1)])

# _AM_SET_OPTIONS(OPTIONS)
# ----------------------------------
# OPTIONS is a space-separated list of Automake options.
AC_DEFUN([_AM_SET_OPTIONS],
[m4_foreach_w([_AM_Option], [$1], [_AM_SET_OPTION(_AM_Option)])])

# _AM_IF_OPTION(OPTION, IF-SET, [IF-NOT-SET])
# -------------------------------------------
# Execute IF-SET if OPTION is set, IF-NOT-SET otherwise.
AC_DEFUN([_AM_IF_OPTION],
[m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])

# Check to make sure that the build environment is sane.    -*- Autoconf -*-

# Copyright (C) 1996, 1997, 2000, 2001, 2003, 2005, 2008
# Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 5

# AM_SANITY_CHECK
# ---------------
AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftest.file
# Reject unsafe characters in $srcdir or the absolute working directory
# name.  Accept space and tab only in the latter.
am_lf='
'
case `pwd` in
  *[[\\\"\#\$\&\'\`$am_lf]]*)
    AC_MSG_ERROR([unsafe absolute working directory name]);;
esac
case $srcdir in
  *[[\\\"\#\$\&\'\`$am_lf\ \	]]*)
    AC_MSG_ERROR([unsafe srcdir value: `$srcdir']);;
esac

# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
   if test "$[*]" = "X"; then
      # -L didn't work.
      set X `ls -t "$srcdir/configure" conftest.file`
   fi
   rm -f conftest.file
   if test "$[*]" != "X $srcdir/configure conftest.file" \
      && test "$[*]" != "X conftest.file $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "$[2]" = conftest.file
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
AC_MSG_RESULT(yes)])

# Copyright (C) 2001, 2003, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# AM_PROG_INSTALL_STRIP
# ---------------------
# One issue with vendor `install' (even GNU) is that you can't
# specify the program used to strip binaries.  This is especially
# annoying in cross-compiling environments, where the build's strip
# is unlikely to handle the host's binaries.
# Fortunately install-sh will honor a STRIPPROG variable, so we
# always use install-sh in `make install-strip', and initialize
# STRIPPROG with the value of the STRIP variable (set by the user).
AC_DEFUN([AM_PROG_INSTALL_STRIP],
[AC_REQUIRE([AM_PROG_INSTALL_SH])dnl
# Installed binaries are usually stripped using `strip' when the user
# run `make install-strip'.  However `strip' might not be the right
# tool to use in cross-compilation environments, therefore Automake
# will honor the `STRIP' environment variable to overrule this program.
dnl Don't test for $cross_compiling = yes, because it might be `maybe'.
if test "$cross_compiling" != no; then
  AC_CHECK_TOOL([STRIP], [strip], :)
fi
INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
AC_SUBST([INSTALL_STRIP_PROGRAM])])

# Copyright (C) 2006, 2008  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 2

# _AM_SUBST_NOTMAKE(VARIABLE)
# ---------------------------
# Prevent Automake from outputting VARIABLE = @VARIABLE@ in Makefile.in.
# This macro is traced by Automake.
AC_DEFUN([_AM_SUBST_NOTMAKE])

# AM_SUBST_NOTMAKE(VARIABLE)
# ---------------------------
# Public sister of _AM_SUBST_NOTMAKE.
AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])

# Check how to create a tarball.                            -*- Autoconf -*-

# Copyright (C) 2004, 2005  Free Software Foundation, Inc.
#
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# serial 2

# _AM_PROG_TAR(FORMAT)
# --------------------
# Check how to create a tarball in format FORMAT.
# FORMAT should be one of `v7', `ustar', or `pax'.
#
# Substitute a variable $(am__tar) that is a command
# writing to stdout a FORMAT-tarball containing the directory
# $tardir.
#     tardir=directory && $(am__tar) > result.tar
#
# Substitute a variable $(am__untar) that extract such
# a tarball read from stdin.
#     $(am__untar) < result.tar
AC_DEFUN([_AM_PROG_TAR],
[# Always define AMTAR for backward compatibility.
AM_MISSING_PROG([AMTAR], [tar])
m4_if([$1], [v7],
     [am__tar='${AMTAR} chof - "$$tardir"'; am__untar='${AMTAR} xf -'],
     [m4_case([$1], [ustar],, [pax],,
              [m4_fatal([Unknown tar format])])
AC_MSG_CHECKING([how to create a $1 tar archive])
# Loop over all known methods to create a tar archive until one works.
_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
_am_tools=${am_cv_prog_tar_$1-$_am_tools}
# Do not fold the above two line into one, because Tru64 sh and
# Solaris sh will not grok spaces in the rhs of `-'.
for _am_tool in $_am_tools
do
  case $_am_tool in
  gnutar)
    for _am_tar in tar gnutar gtar;
    do
      AM_RUN_LOG([$_am_tar --version]) && break
    done
    am__tar="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$$tardir"'
    am__tar_="$_am_tar --format=m4_if([$1], [pax], [posix], [$1]) -chf - "'"$tardir"'
    am__untar="$_am_tar -xf -"
    ;;
  plaintar)
    # Must skip GNU tar: if it does not support --format= it doesn't create
    # ustar tarball either.
    (tar --version) >/dev/null 2>&1 && continue
    am__tar='tar chf - "$$tardir"'
    am__tar_='tar chf - "$tardir"'
    am__untar='tar xf -'
    ;;
  pax)
    am__tar='pax -L -x $1 -w "$$tardir"'
    am__tar_='pax -L -x $1 -w "$tardir"'
    am__untar='pax -r'
    ;;
  cpio)
    am__tar='find "$$tardir" -print | cpio -o -H $1 -L'
    am__tar_='find "$tardir" -print | cpio -o -H $1 -L'
    am__untar='cpio -i -H $1 -d'
    ;;
  none)
    am__tar=false
    am__tar_=false
    am__untar=false
    ;;
  esac

  # If the value was cached, stop now.  We just wanted to have am__tar
  # and am__untar set.
  test -n "${am_cv_prog_tar_$1}" && break

  # tar/untar a dummy directory, and stop if the command works
  rm -rf conftest.dir
  mkdir conftest.dir
  echo GrepMe > conftest.dir/file
  AM_RUN_LOG([tardir=conftest.dir && eval $am__tar_ >conftest.tar])
  rm -rf conftest.dir
  if test -s conftest.tar; then
    AM_RUN_LOG([$am__untar <conftest.tar])
    grep GrepMe conftest.dir/file >/dev/null 2>&1 && break
  fi
done
rm -rf conftest.dir

AC_CACHE_VAL([am_cv_prog_tar_$1], [am_cv_prog_tar_$1=$_am_tool])
AC_MSG_RESULT([$am_cv_prog_tar_$1])])
AC_SUBST([am__tar])
AC_SUBST([am__untar])
]) # _AM_PROG_TAR

# Usage:
#   SIM_AC_HAVE_COIN_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Description:
#   This macro locates the Coin development system.  If it is found,
#   the set of variables listed below are set up as described and made
#   available to the configure script.
#
#   The $sim_ac_coin_desired variable can be set to false externally to
#   make Coin default to be excluded.
#
# Autoconf Variables:
# > $sim_ac_coin_desired     true | false (defaults to true)
# < $sim_ac_coin_avail       true | false
# < $sim_ac_coin_cppflags    (extra flags the preprocessor needs)
# < $sim_ac_coin_cflags      (extra flags the C compiler needs)
# < $sim_ac_coin_cxxflags    (extra flags the C++ compiler needs)
# < $sim_ac_coin_ldflags     (extra flags the linker needs)
# < $sim_ac_coin_libs        (link library flags the linker needs)
# < $sim_ac_coin_datadir     (location of Coin data files)
# < $sim_ac_coin_includedir  (location of Coin headers)
# < $sim_ac_coin_version     (the libCoin version)
# < $sim_ac_coin_msvcrt      (the MSVC++ C library Coin was built with)
# < $sim_ac_coin_configcmd   (the path to coin-config or "false")
#
# Authors:
#   Lars J. Aas, <larsa@sim.no>
#   Morten Eriksen, <mortene@sim.no>
#
# TODO:
#

AC_DEFUN([SIM_AC_HAVE_COIN_IFELSE], [
AC_PREREQ([2.14a])

# official variables
sim_ac_coin_avail=false
sim_ac_coin_cppflags=
sim_ac_coin_cflags=
sim_ac_coin_cxxflags=
sim_ac_coin_ldflags=
sim_ac_coin_libs=
sim_ac_coin_datadir=
sim_ac_coin_includedir=
sim_ac_coin_version=

# internal variables
: ${sim_ac_coin_desired=true}
sim_ac_coin_extrapath=

AC_ARG_WITH([coin],
AC_HELP_STRING([--with-coin], [enable use of Coin [[default=yes]]])
AC_HELP_STRING([--with-coin=DIR], [give prefix location of Coin]),
  [ case $withval in
    no)  sim_ac_coin_desired=false ;;
    yes) sim_ac_coin_desired=true ;;
    *)   sim_ac_coin_desired=true
         sim_ac_coin_extrapath=$withval ;;
    esac],
  [])

case $build in
*-mks ) sim_ac_pathsep=";" ;;
* )     sim_ac_pathsep="${PATH_SEPARATOR}" ;;
esac

if $sim_ac_coin_desired; then
  sim_ac_path=$PATH
  test -z "$sim_ac_coin_extrapath" || ## search in --with-coin path
    sim_ac_path="$sim_ac_coin_extrapath/bin${sim_ac_pathsep}$sim_ac_path"
  test x"$prefix" = xNONE ||          ## search in --prefix path
    sim_ac_path="$sim_ac_path${sim_ac_pathsep}$prefix/bin"

  AC_PATH_PROG(sim_ac_coin_configcmd, coin-config, false, $sim_ac_path)

  if test "X$sim_ac_coin_configcmd" != "Xfalse"; then
    test -n "$CONFIG" &&
      $sim_ac_coin_configcmd --alternate=$CONFIG >/dev/null 2>/dev/null &&
      sim_ac_coin_configcmd="$sim_ac_coin_configcmd --alternate=$CONFIG"
  fi

  if $sim_ac_coin_configcmd; then
    sim_ac_coin_version=`$sim_ac_coin_configcmd --version`
    sim_ac_coin_cppflags=`$sim_ac_coin_configcmd --cppflags`
    sim_ac_coin_cflags=`$sim_ac_coin_configcmd --cflags 2>/dev/null`
    sim_ac_coin_cxxflags=`$sim_ac_coin_configcmd --cxxflags`
    sim_ac_coin_ldflags=`$sim_ac_coin_configcmd --ldflags`
    sim_ac_coin_libs=`$sim_ac_coin_configcmd --libs`
    sim_ac_coin_datadir=`$sim_ac_coin_configcmd --datadir`
    # Hide stderr on the following, as ``--includedir'', ``--msvcrt''
    # and ``--cflags'' options were added late to coin-config.
    sim_ac_coin_includedir=`$sim_ac_coin_configcmd --includedir 2>/dev/null`
    sim_ac_coin_msvcrt=`$sim_ac_coin_configcmd --msvcrt 2>/dev/null`
    sim_ac_coin_cflags=`$sim_ac_coin_configcmd --cflags 2>/dev/null`
    AC_CACHE_CHECK(
      [if we can compile and link with the Coin library],
      sim_cv_coin_avail,
      [sim_ac_save_cppflags=$CPPFLAGS
      sim_ac_save_cxxflags=$CXXFLAGS
      sim_ac_save_ldflags=$LDFLAGS
      sim_ac_save_libs=$LIBS
      CPPFLAGS="$CPPFLAGS $sim_ac_coin_cppflags"
      CXXFLAGS="$CXXFLAGS $sim_ac_coin_cxxflags"
      LDFLAGS="$LDFLAGS $sim_ac_coin_ldflags"
      LIBS="$sim_ac_coin_libs $LIBS"
      AC_LANG_PUSH(C++)

      AC_TRY_LINK(
        [#include <Inventor/SoDB.h>],
        [SoDB::init();],
        [sim_cv_coin_avail=true],
        [sim_cv_coin_avail=false])

      AC_LANG_POP
      CPPFLAGS=$sim_ac_save_cppflags
      CXXFLAGS=$sim_ac_save_cxxflags
      LDFLAGS=$sim_ac_save_ldflags
      LIBS=$sim_ac_save_libs
    ])
    sim_ac_coin_avail=$sim_cv_coin_avail

    if $sim_ac_coin_avail; then :; else
      AC_MSG_WARN([
Compilation and/or linking with the Coin main library SDK failed, for
unknown reason. If you are familiar with configure-based configuration
and building, investigate the 'config.log' file for clues.

If you can not figure out what went wrong, please forward the 'config.log'
file to the email address <coin-support@coin3d.org> and ask for help by
describing the situation where this failed.
])
    fi
  else # no 'coin-config' found

# FIXME: test for Coin without coin-config script here
    if test x"$COINDIR" != x""; then
      sim_ac_coindir=`cygpath -u "$COINDIR" 2>/dev/null || echo "$COINDIR"`
      if test -d $sim_ac_coindir/bin && test -d $sim_ac_coindir/lib && test -d $sim_ac_coindir/include/Inventor; then
        # using newest version (last alphabetically) in case of multiple libs
        sim_ac_coin_lib_file=`echo $sim_ac_coindir/lib/coin*.lib | sed -e 's,.* ,,g'`
        if test -f $sim_ac_coin_lib_file; then
          sim_ac_coin_lib_name=`echo $sim_ac_coin_lib_file | sed -e 's,.*/,,g' -e 's,.lib,,'`
          sim_ac_save_cppflags=$CPPFLAGS
          sim_ac_save_libs=$LIBS
          sim_ac_save_ldflags=$LDFLAGS
          CPPFLAGS="$CPPFLAGS -I$sim_ac_coindir/include"
          if test -f $sim_ac_coindir/bin/$sim_ac_coin_lib_name.dll; then
            CPPFLAGS="$CPPFLAGS -DCOIN_DLL"
          fi
          LDFLAGS="$LDFLAGS -L$sim_ac_coindir/lib"
          LIBS="-l$sim_ac_coin_lib_name -lopengl32 $LIBS"

          AC_LANG_PUSH(C++)

          AC_TRY_LINK(
            [#include <Inventor/SoDB.h>],
            [SoDB::init();],
            [sim_cv_coin_avail=true],
            [sim_cv_coin_avail=false])

          AC_LANG_POP
          CPPFLAGS=$sim_ac_save_cppflags
          LDFLAGS=$sim_ac_save_ldflags
          LIBS=$sim_ac_save_libs
          sim_ac_coin_avail=$sim_cv_coin_avail
        fi
      fi
    fi

    if $sim_ac_coin_avail; then
      sim_ac_coin_cppflags=-I$sim_ac_coindir/include
      if test -f $sim_ac_coindir/bin/$sim_ac_coin_lib_name.dll; then
        sim_ac_coin_cppflags="$sim_ac_coin_cppflags -DCOIN_DLL"
      fi
      sim_ac_coin_ldflags=-L$sim_ac_coindir/lib
      sim_ac_coin_libs="-l$sim_ac_coin_lib_name -lopengl32"
      sim_ac_coin_datadir=$sim_ac_coindir/data
    else
      locations=`IFS="${sim_ac_pathsep}"; for p in $sim_ac_path; do echo " -> $p/coin-config"; done`
      AC_MSG_WARN([cannot find 'coin-config' at any of these locations:
$locations])
      AC_MSG_WARN([
Need to be able to run 'coin-config' to figure out how to build and link
against the Coin library. To rectify this problem, you most likely need
to a) install Coin if it has not been installed, b) add the Coin install
bin/ directory to your PATH environment variable.
])
    fi
  fi
fi

if $sim_ac_coin_avail; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_COIN_IFELSE()


# Usage:
#   SIM_AC_COMPILE_DEBUG([ACTION-IF-DEBUG[, ACTION-IF-NOT-DEBUG]])
#
# Description:
#   Let the user decide if compilation should be done in "debug mode".
#   If compilation is not done in debug mode, all assert()'s in the code
#   will be disabled.
#
#   Also sets enable_debug variable to either "yes" or "no", so the
#   configure.in writer can add package-specific actions. Default is "yes".
#   This was also extended to enable the developer to set up the two first
#   macro arguments following the well-known ACTION-IF / ACTION-IF-NOT
#   concept.
#
# Authors:
#   Morten Eriksen, <mortene@sim.no>
#   Lars J. Aas, <larsa@sim.no>
#

AC_DEFUN([SIM_AC_COMPILE_DEBUG], [
AC_REQUIRE([SIM_AC_CHECK_SIMIAN_IFELSE])

AC_ARG_ENABLE(
  [debug],
  AC_HELP_STRING([--enable-debug], [compile in debug mode [[default=yes]]]),
  [case "${enableval}" in
    yes) enable_debug=true ;;
    no)  enable_debug=false ;;
    true | false) enable_debug=${enableval} ;;
    *) AC_MSG_ERROR(bad value "${enableval}" for --enable-debug) ;;
  esac],
  [enable_debug=true])

if $enable_debug; then
  DSUFFIX=d
  if $sim_ac_simian; then
    case $CXX in
    *wrapmsvc* )
      # uninitialized checks
      if test ${sim_ac_msc_major_version-0} -gt 6; then
        SIM_AC_CC_COMPILER_OPTION([/RTCu], [sim_ac_compiler_CFLAGS="$sim_ac_compiler_CFLAGS /RTCu"])
        SIM_AC_CXX_COMPILER_OPTION([/RTCu], [sim_ac_compiler_CXXFLAGS="$sim_ac_compiler_CXXFLAGS /RTCu"])
        # stack frame checks
        SIM_AC_CC_COMPILER_OPTION([/RTCs], [sim_ac_compiler_CFLAGS="$sim_ac_compiler_CFLAGS /RTCs"])
        SIM_AC_CXX_COMPILER_OPTION([/RTCs], [sim_ac_compiler_CXXFLAGS="$sim_ac_compiler_CXXFLAGS /RTCs"])
      fi
      ;;
    esac
  fi

  ifelse([$1], , :, [$1])
else
  DSUFFIX=
  CPPFLAGS="$CPPFLAGS -DNDEBUG"
  ifelse([$2], , :, [$2])
fi
AC_SUBST(DSUFFIX)
])

# Usage:
#   SIM_AC_COMPILER_OPTIMIZATION
#
# Description:
#   Let the user decide if optimization should be attempted turned off
#   by stripping off an "-O[0-9]" option.
#
#   Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
#   in the configure.in script.
#
# FIXME: this is pretty much just a dirty hack. Unfortunately, this
# seems to be the best we can do without fixing Autoconf to behave
# properly wrt setting optimization options. 20011021 mortene.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#

AC_DEFUN([SIM_AC_COMPILER_OPTIMIZATION], [
AC_ARG_ENABLE(
  [optimization],
  AC_HELP_STRING([--enable-optimization],
                 [allow compilers to make optimized code [[default=yes]]]),
  [case "${enableval}" in
    yes) sim_ac_enable_optimization=true ;;
    no)  sim_ac_enable_optimization=false ;;
    *) AC_MSG_ERROR(bad value "${enableval}" for --enable-optimization) ;;
  esac],
  [sim_ac_enable_optimization=true])

if $sim_ac_enable_optimization; then
  case $CXX in
  *wrapmsvc* )
    CFLAGS="/Ox $CFLAGS"
    CXXFLAGS="/Ox $CXXFLAGS"
    ;;
  esac
  :
else
  CFLAGS="`echo $CFLAGS | sed 's/-O[[0-9]]*[[ ]]*//'`"
  CXXFLAGS="`echo $CXXFLAGS | sed 's/-O[[0-9]]*[[ ]]*//'`"
fi
])

# Usage:
#   SIM_AC_DEBUGSYMBOLS
#
# Description:
#   Let the user decide if debug symbol information should be compiled
#   in. The compiled libraries/executables will use a lot less space
#   if stripped for their symbol information.
#
#   Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
#   in the configure.in script.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#

AC_DEFUN([SIM_AC_DEBUGSYMBOLS], [
AC_ARG_ENABLE(
  [symbols],
  AC_HELP_STRING([--enable-symbols],
                 [include symbol debug information [[default=yes]]]),
  [case "${enableval}" in
    yes) enable_symbols=yes ;;
    no)  enable_symbols=no ;;
    *) AC_MSG_ERROR(bad value "${enableval}" for --enable-symbols) ;;
  esac],
  [enable_symbols=yes])

# weird seds to don't mangle options like -fno-gnu-linker and -fvolatile-global
if test x"$enable_symbols" = x"no"; then
  CFLAGS="`echo $CFLAGS | sed 's/ -g / /g' | sed 's/^-g / /g' | sed 's/ -g$/ /g' | sed 's/^-g$/ /'`"
  CXXFLAGS="`echo $CXXFLAGS | sed 's/ -g / /g' | sed 's/^-g / /g' | sed 's/ -g$/ /g' | sed 's/^-g$/ /'`"
fi
]) # SIM_AC_DEBUGSYMBOLS


# **************************************************************************
# configuration_summary.m4
#
# This file contains some utility macros for making it easy to have a short
# summary of the important configuration settings printed at the end of the
# configure run.
#
# Authors:
#   Lars J. Aas <larsa@sim.no>
#

# **************************************************************************
# SIM_AC_CONFIGURATION_SETTING( DESCRIPTION, SETTING )
#
# This macro registers a configuration setting to be dumped by the
# SIM_AC_CONFIGURATION_SUMMARY macro.

AC_DEFUN([SIM_AC_CONFIGURATION_SETTING],
[ifelse($#, 2, [], [m4_fatal([SIM_AC_CONFIGURATION_SETTING: takes two arguments])])
if test x"${sim_ac_configuration_settings+set}" = x"set"; then
  sim_ac_configuration_settings="$sim_ac_configuration_settings|$1:$2"
else
  sim_ac_configuration_settings="$1:$2"
fi
]) # SIM_AC_CONFIGURATION_SETTING

# **************************************************************************
# SIM_AC_CONFIGURATION_WARNING( WARNING )
#
# This macro registers a configuration warning to be dumped by the
# SIM_AC_CONFIGURATION_SUMMARY macro.

AC_DEFUN([SIM_AC_CONFIGURATION_WARNING],
[ifelse($#, 1, [], [m4_fatal([SIM_AC_CONFIGURATION_WARNING: takes one argument])])
if test x"${sim_ac_configuration_warnings+set}" = x"set"; then
  sim_ac_configuration_warnings="$sim_ac_configuration_warnings|$1"
else
  sim_ac_configuration_warnings="$1"
fi
]) # SIM_AC_CONFIGURATION_WARNING

# **************************************************************************
# SIM_AC_CONFIGURATION_SUMMARY
#
# This macro dumps the settings and warnings summary.

AC_DEFUN([SIM_AC_CONFIGURATION_SUMMARY],
[ifelse($#, 0, [], [m4_fatal([SIM_AC_CONFIGURATION_SUMMARY: takes no arguments])])
sim_ac_settings="$sim_ac_configuration_settings"
sim_ac_num_settings=`echo "$sim_ac_settings" | tr -d -c "|" | wc -c`
sim_ac_maxlength=0
while test $sim_ac_num_settings -ge 0; do
  sim_ac_description=`echo "$sim_ac_settings" | cut -d: -f1`
  sim_ac_length=`echo "$sim_ac_description" | wc -c`
  if test $sim_ac_length -gt $sim_ac_maxlength; then
    sim_ac_maxlength=`expr $sim_ac_length + 0`
  fi
  sim_ac_settings=`echo $sim_ac_settings | cut -d"|" -f2-`
  sim_ac_num_settings=`expr $sim_ac_num_settings - 1`
done

sim_ac_maxlength=`expr $sim_ac_maxlength + 3`
sim_ac_padding=`echo "                                             " |
  cut -c1-$sim_ac_maxlength`

sim_ac_num_settings=`echo "$sim_ac_configuration_settings" | tr -d -c "|" | wc -c`
echo ""
echo "$PACKAGE configuration settings:"
while test $sim_ac_num_settings -ge 0; do
  sim_ac_setting=`echo $sim_ac_configuration_settings | cut -d"|" -f1`
  sim_ac_description=`echo "$sim_ac_setting" | cut -d: -f1`
  sim_ac_status=`echo "$sim_ac_setting" | cut -d: -f2-`
  # hopefully not too many terminals are too dumb for this
  printf "$sim_ac_padding $sim_ac_status\r  $sim_ac_description:\n"
  sim_ac_configuration_settings=`echo $sim_ac_configuration_settings | cut -d"|" -f2-`
  sim_ac_num_settings=`expr $sim_ac_num_settings - 1`
done

if test x${sim_ac_configuration_warnings+set} = xset; then
sim_ac_num_warnings=`echo "$sim_ac_configuration_warnings" | tr -d -c "|" | wc -c`
echo ""
echo "$PACKAGE configuration warnings:"
while test $sim_ac_num_warnings -ge 0; do
  sim_ac_warning=`echo "$sim_ac_configuration_warnings" | cut -d"|" -f1`
  echo "  * $sim_ac_warning"
  sim_ac_configuration_warnings=`echo $sim_ac_configuration_warnings | cut -d"|" -f2-`
  sim_ac_num_warnings=`expr $sim_ac_num_warnings - 1`
done
fi
]) # SIM_AC_CONFIGURATION_SUMMARY


# Usage:
#  SIM_AC_DOXYGEN_TOOL([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
# Description:
#   This macro locates the doxygen executable. If it is found, the
#   variable $sim_ac_doxygen_exe is set to the full path- and
#   executable name (if not found, it is set to "false") and
#   $sim_ac_doxygen_avail is set to the version number (if not
#   found, it is set to "no").
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_DOXYGEN_TOOL], [
AC_ARG_WITH(
  [doxygen],
  AC_HELP_STRING([--with-doxygen=DIR],
                 [DIR is the directory where the doxygen executable resides]),
  [],
  [with_doxygen=yes])

sim_ac_doxygen_avail=no

if test x"$with_doxygen" != xno; then
  sim_ac_path=$PATH
  if test x"$with_doxygen" != xyes; then
    sim_ac_path=${with_doxygen}:$PATH
  fi

  AC_PATH_PROG([sim_ac_doxygen_exe], [doxygen], [false], [$sim_ac_path])
  if test x"$sim_ac_doxygen_exe" = xfalse; then
    ifelse([$2], , :, [$2])
  else
    sim_ac_doxygen_avail=`$sim_ac_doxygen_exe -help 2> /dev/null | head -1 | sed 's%[[^ ]]\+ [[^ ]]\+ %%'`
    $1
  fi
fi
])


# **************************************************************************
# SIM_AC_ERROR_MESSAGE_FILE( FILENAME )
#   Sets the error message file.  Default is $ac_aux_dir/m4/errors.txt.
#
# SIM_AC_ERROR( ERROR [, ERROR ...] )
#   Fetches the error messages from the error message file and displays
#   them on stderr. The configure process will subsequently exit.
#
# SIM_AC_WARN( ERROR [, ERROR ...] )
#   As SIM_AC_ERROR, but will not exit after displaying the message(s).
#
# SIM_AC_WITH_ERROR( WITHARG )
#   Invokes AC_MSG_ERROR in a consistent way for problems with the --with-*
#   $withval argument.
#
# SIM_AC_ENABLE_ERROR( ENABLEARG )
#   Invokes AC_MSG_ERROR in a consistent way for problems with the --enable-*
#   $enableval argument.
#
# Authors:
#   Lars J. Aas <larsa@sim.no>

AC_DEFUN([SIM_AC_ERROR_MESSAGE_FILE], [
sim_ac_message_file=$1
]) # SIM_AC_ERROR_MESSAGE_FILE

AC_DEFUN([SIM_AC_ONE_MESSAGE], [
: ${sim_ac_message_file=$ac_aux_dir/errors.txt}
if test -f $sim_ac_message_file; then
  sim_ac_message="`sed -n -e '/^!$1$/,/^!/ { /^!/ d; p; }' <$sim_ac_message_file`"
  if test x"$sim_ac_message" = x""; then
    AC_MSG_ERROR([no message named '$1' in '$sim_ac_message_file' - notify the $PACKAGE_NAME maintainer(s)])
  else
    eval "echo >&2 \"$sim_ac_message\""
  fi
else
  AC_MSG_ERROR([file '$sim_ac_message_file' not found - notify the $PACKAGE_NAME maintainer(s)])
fi
]) # SIM_AC_ONE_MESSAGE

AC_DEFUN([_SIM_AC_ERROR], [
SIM_AC_ONE_MESSAGE([$1])
ifelse([$2], , , [
echo >&2 ""
_SIM_AC_ERROR(m4_shift($@))])
]) # _SIM_AC_ERROR

AC_DEFUN([SIM_AC_ERROR], [
echo >&2 ""
_SIM_AC_ERROR($@)
echo >&2 ""
AC_MSG_ERROR([aborting])
]) # SIM_AC_ERROR

AC_DEFUN([SIM_AC_WARN], [
echo >&2 ""
_SIM_AC_ERROR($@)
echo >&2 ""
]) # SIM_AC_WARN

AC_DEFUN([SIM_AC_WITH_ERROR], [
AC_MSG_ERROR([invalid value "${withval}" for "$1" configure argument])
]) # SIM_AC_WITH_ERROR

AC_DEFUN([SIM_AC_ENABLE_ERROR], [
AC_MSG_ERROR([invalid value "${enableval}" for "$1" configure argument])
]) # SIM_AC_ENABLE_ERROR


# SIM_AC_STRIP_EXIT_DECLARATION
#
# Autoconf adds a declaration of exit() to confdefs.h, which causes
# configure tests to fail later on when configuring for Visual C++
# compilers.  This macro edits out the exit-declaration (which we
# really don't need anyway) from the confdefs.h file.
#
# Typically, it should be inserted as early as possible, but after
# AC_PROG_CXX / AC_PROG_CXXCPP.
#
# 2007-05-30 larsa

AC_DEFUN([SIM_AC_STRIP_EXIT_DECLARATION], [
mv confdefs.h confdefs.old
egrep -v "void.*exit" confdefs.old >confdefs.h
rm -f confdefs.old
])


 **************************************************************************
# gendsp.m4
#
# macros:
#   SIM_AC_MSVC_DSP_ENABLE_OPTION
#   SIM_AC_MSVC_DSP_SETUP(PROJECT, Project, project, extra-args)
#
# authors:
#   Lars J. Aas <larsa@coin3d.org>

# **************************************************************************
AC_DEFUN([SIM_AC_MSVC_DSP_ENABLE_OPTION], [
AC_ARG_ENABLE([msvcdsp],
  [AC_HELP_STRING([--enable-msvcdsp], [build .dsp, not library])],
  [case $enableval in
  no | false) sim_ac_make_dsp=false ;;
  *)          sim_ac_make_dsp=true ;;
  esac],
  [sim_ac_make_dsp=false])

if $sim_ac_make_dsp; then
  enable_dependency_tracking=no
  enable_libtool_lock=no
fi
]) # SIM_AC_MSVC_DSP_ENABLE_OPTION

# **************************************************************************
AC_DEFUN([SIM_AC_MSVC_DSP_SETUP], [
AC_REQUIRE([SIM_AC_MSVC_DSP_ENABLE_OPTION])
$1_DSP_LIBDIRS=
$1_DSP_LIBS=
$1_DSP_INCS=
$1_LIB_DSP_DEFS=
$1_DSP_DEFS=

if $sim_ac_make_dsp; then
  SIM_AC_CONFIGURATION_SETTING([$2 build type], [msvc .dsp])

  # -DHAVE_CONFIG_H is set up in $DEFS too late for us to use, and some
  # include directives are usually set up in the Makefile.am files
  for arg in -DHAVE_CONFIG_H $4 $CPPFLAGS $LDFLAGS $LIBS; do
    case $arg in
    -L* )
      libdir=`echo $arg | cut -c3-`
      $1_DSP_LIBDIRS="[$]$1_DSP_LIBDIRS $libdir"
      ;;
    -l* )
      libname=`echo $arg | cut -c3-`
      for libdir in [$]$1_DSP_LIBDIRS; do
        if test -f $libdir/$libname.lib; then
          # lib is not in any standard location - use full path
          libname=`cygpath -w "$libdir/$libname" 2>/dev/null || echo "$libdir/$libname"`
          break
        fi
      done
      if test x"[$]$1_DSP_LIBS" = x""; then
        $1_DSP_LIBS="$libname.lib"
      else
        $1_DSP_LIBS="[$]$1_DSP_LIBS $libname.lib"
      fi
      ;;
    -I* )
      incdir=`echo $arg | cut -c3-`
      incdir=`cygpath -w "$incdir" 2>/dev/null || echo "$incdir"`
      if test x"[$]$1_DSP_INCS" = x""; then
        $1_DSP_INCS="/I \"$incdir\""
      else
        $1_DSP_INCS="[$]$1_DSP_INCS /I \"$incdir\""
      fi
      ;;
    -D$1_DEBUG* | -DNDEBUG )
      # Defines that vary between release/debug configurations can't be
      # set up dynamically in <lib>_DSP_DEFS - they must be static in the
      # gendsp.pl script.  We therefore catch them here so we can ignore
      # checking for them below.
      ;;
    -D*=* | -D* )
      define=`echo $arg | cut -c3-`
      if test x"[$]$1_DSP_DEFS" = x""; then
        $1_DSP_DEFS="/D \"$define\""
      else
        $1_DSP_DEFS="[$]$1_DSP_DEFS /D \"$define\""
      fi
      if (echo $define | grep _MAKE_DLL) >/dev/null 2>&1; then
        :
      else
        if test x"[$]$1_DSP_DEFS" = x""; then
          $1_LIB_DSP_DEFS="/D \"$define\""
        else
          $1_LIB_DSP_DEFS="[$]$1_LIB_DSP_DEFS /D \"$define\""
        fi
      fi
      ;;
    esac
  done

  CC=[$]$3_build_dir/cfg/gendsp.pl
  CXX=[$]$3_build_dir/cfg/gendsp.pl
  CXXLD=[$]$3_build_dir/cfg/gendsp.pl
  # Yes, this is totally bogus stuff, but don't worry about it.  As long
  # as gendsp.pl recognizes it...  20030219 larsa
  CPPFLAGS="$CPPFLAGS -Ddspfile=[$]$3_build_dir/$3[$]$1_MAJOR_VERSION.dsp"
  LDFLAGS="$LDFLAGS -Wl,-Ddspfile=[$]$3_build_dir/$3[$]$1_MAJOR_VERSION.dsp"
  LIBFLAGS="$LIBFLAGS -o $3[$]$1_MAJOR_VERSION.so.0"

  # this can't be set up at the point the libtool script is generated
  mv libtool libtool.bak
  sed -e "s%^CC=\"gcc\"%CC=\"[$]$3_build_dir/cfg/gendsp.pl\"%" \
      -e "s%^CC=\".*/wrapmsvc.exe\"%CC=\"[$]$3_build_dir/cfg/gendsp.pl\"%" \
      <libtool.bak >libtool
  rm -f libtool.bak
  chmod 755 libtool
fi

AC_SUBST([$1_DSP_LIBS])
AC_SUBST([$1_DSP_INCS])
AC_SUBST([$1_DSP_DEFS])
AC_SUBST([$1_LIB_DSP_DEFS])
])


#   Use this file to store miscellaneous macros related to checking
#   compiler features.

# Usage:
#   SIM_AC_CC_COMPILER_OPTION(OPTION-TO-TEST, ACTION-IF-TRUE [, ACTION-IF-FALSE])
#   SIM_AC_CXX_COMPILER_OPTION(OPTION-TO-TEST, ACTION-IF-TRUE [, ACTION-IF-FALSE])
#
# Description:
#
#   Check whether the current C or C++ compiler can handle a
#   particular command-line option.
#
#
# Author: Morten Eriksen, <mortene@sim.no>.
#
#   * [mortene:19991218] improve macros by catching and analyzing
#     stderr (at least to see if there was any output there)?
#

AC_DEFUN([SIM_AC_COMPILER_OPTION], [
sim_ac_save_cppflags=$CPPFLAGS
CPPFLAGS="$CPPFLAGS $1"
AC_TRY_COMPILE([], [], [sim_ac_accept_result=yes], [sim_ac_accept_result=no])
AC_MSG_RESULT([$sim_ac_accept_result])
CPPFLAGS=$sim_ac_save_cppflags
# This need to go last, in case CPPFLAGS is modified in arg 2 or arg 3.
if test $sim_ac_accept_result = yes; then
  ifelse([$2], , :, [$2])
else
  ifelse([$3], , :, [$3])
fi
])

AC_DEFUN([SIM_AC_COMPILER_BEHAVIOR_OPTION_QUIET], [
sim_ac_save_cppflags=$CPPFLAGS
CPPFLAGS="$CPPFLAGS $1"
AC_TRY_COMPILE([], [$2], [sim_ac_accept_result=yes], [sim_ac_accept_result=no])
CPPFLAGS=$sim_ac_save_cppflags
# This need to go last, in case CPPFLAGS is modified in arg 3 or arg 4.
if test $sim_ac_accept_result = yes; then
  ifelse([$3], , :, [$3])
else
  ifelse([$4], , :, [$4])
fi
])


AC_DEFUN([SIM_AC_CC_COMPILER_OPTION], [
AC_LANG_SAVE
AC_LANG(C)
AC_MSG_CHECKING([whether $CC accepts $1])
SIM_AC_COMPILER_OPTION([$1], [$2], [$3])
AC_LANG_RESTORE
])

AC_DEFUN([SIM_AC_CC_COMPILER_BEHAVIOR_OPTION_QUIET], [
AC_LANG_SAVE
AC_LANG(C)
SIM_AC_COMPILER_BEHAVIOR_OPTION_QUIET([$1], [$2], [$3], [$4])
AC_LANG_RESTORE
])

AC_DEFUN([SIM_AC_CXX_COMPILER_OPTION], [
AC_LANG_SAVE
AC_LANG(C++)
AC_MSG_CHECKING([whether $CXX accepts $1])
SIM_AC_COMPILER_OPTION([$1], [$2], [$3])
AC_LANG_RESTORE
])

AC_DEFUN([SIM_AC_CXX_COMPILER_BEHAVIOR_OPTION_QUIET], [
AC_LANG_SAVE
AC_LANG(C++)
SIM_AC_COMPILER_BEHAVIOR_OPTION_QUIET([$1], [$2], [$3], [$4])
AC_LANG_RESTORE
])

# **************************************************************************
# SIM_AC_CHECK_HEADER_SILENT([header], [if-found], [if-not-found], [includes])
#
# This macro will not output any header checking information, nor will it
# cache the result, so it can be used multiple times on the same header,
# trying out different compiler options.

AC_DEFUN([SIM_AC_CHECK_HEADER_SILENT],
[AS_VAR_PUSHDEF([ac_Header], [ac_cv_header_$1])
m4_ifval([$4],
         [AC_COMPILE_IFELSE([AC_LANG_SOURCE([$4
@%:@include <$1>])],
                            [AS_VAR_SET(ac_Header, yes)],
                            [AS_VAR_SET(ac_Header, no)])],
         [AC_PREPROC_IFELSE([AC_LANG_SOURCE([@%:@include <$1>])],
                            [AS_VAR_SET(ac_Header, yes)],
                            [AS_VAR_SET(ac_Header, no)])])
AS_IF([test AS_VAR_GET(ac_Header) = yes], [$2], [$3])
AS_VAR_POPDEF([ac_Header])
])# SIM_AC_CHECK_HEADER_SILENT

# **************************************************************************
# SIM_AC_CHECK_HEADER_GL([IF-FOUND], [IF-NOT-FOUND])
#
# This macro detects how to include the GL header file, and gives you the
# necessary CPPFLAGS in $sim_ac_gl_cppflags, and also sets the config.h
# defines HAVE_GL_GL_H or HAVE_OPENGL_GL_H if one of them is found.

AC_DEFUN([SIM_AC_CHECK_HEADER_GL],
[sim_ac_gl_header_avail=false
AC_MSG_CHECKING([how to include gl.h])
if test x"$with_opengl" != x"no"; then
  sim_ac_gl_save_CPPFLAGS=$CPPFLAGS
  sim_ac_gl_cppflags=

  if test x"$with_opengl" != xyes && test x"$with_opengl" != x""; then
    sim_ac_gl_cppflags="-I${with_opengl}/include"
  else
    # On HP-UX platforms, OpenGL headers and libraries are usually installed
    # at this location.
    sim_ac_gl_hpux=/opt/graphics/OpenGL
    if test -d $sim_ac_gl_hpux; then
      sim_ac_gl_cppflags=-I$sim_ac_gl_hpux/include
    fi
  fi

  # On Mac OS X, GL is part of the optional X11 fraemwork
  case $host_os in
  darwin*)
    AC_REQUIRE([SIM_AC_CHECK_X11])
    if $sim_ac_enable_darwin_x11; then
      sim_ac_gl_darwin_x11=/usr/X11R6
      if test -d $sim_ac_gl_darwin_x11; then
        sim_ac_gl_cppflags=-I$sim_ac_gl_darwin_x11/include
      fi
    fi
    ;;
  esac

  CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags"

  # Mac OS X framework (no X11, -framework OpenGL)
  if $sim_ac_enable_darwin_x11; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([OpenGL/gl.h], [
      sim_ac_gl_header_avail=true
      sim_ac_gl_header=OpenGL/gl.h
      AC_DEFINE([HAVE_OPENGL_GL_H], 1, [define if the GL header should be included as OpenGL/gl.h])
    ])
  fi

  if $sim_ac_gl_header_avail; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([GL/gl.h], [
      sim_ac_gl_header_avail=true
      sim_ac_gl_header=GL/gl.h
      AC_DEFINE([HAVE_GL_GL_H], 1, [define if the GL header should be included as GL/gl.h])
    ])
  fi

  CPPFLAGS="$sim_ac_gl_save_CPPFLAGS"
  if $sim_ac_gl_header_avail; then
    if test x"$sim_ac_gl_cppflags" = x""; then
      AC_MSG_RESULT([@%:@include <$sim_ac_gl_header>])
    else
      AC_MSG_RESULT([$sim_ac_gl_cppflags, @%:@include <$sim_ac_gl_header>])
    fi
    $1
  else
    AC_MSG_RESULT([not found])
    $2
  fi
else
  AC_MSG_RESULT([disabled])
  $2
fi
])# SIM_AC_CHECK_HEADER_GL

# **************************************************************************
# SIM_AC_CHECK_HEADER_GLU([IF-FOUND], [IF-NOT-FOUND])
#
# This macro detects how to include the GLU header file, and gives you the
# necessary CPPFLAGS in $sim_ac_glu_cppflags, and also sets the config.h
# defines HAVE_GL_GLU_H or HAVE_OPENGL_GLU_H if one of them is found.

AC_DEFUN([SIM_AC_CHECK_HEADER_GLU],
[sim_ac_glu_header_avail=false
AC_MSG_CHECKING([how to include glu.h])
if test x"$with_opengl" != x"no"; then
  sim_ac_glu_save_CPPFLAGS=$CPPFLAGS
  sim_ac_glu_cppflags=

  if test x"$with_opengl" != xyes && test x"$with_opengl" != x""; then
    sim_ac_glu_cppflags="-I${with_opengl}/include"
  else
    # On HP-UX platforms, OpenGL headers and libraries are usually installed
    # at this location.
    sim_ac_gl_hpux=/opt/graphics/OpenGL
    if test -d $sim_ac_gl_hpux; then
      sim_ac_glu_cppflags=-I$sim_ac_gl_hpux/include
    fi
  fi

  # On Mac OS X, GL is part of the optional X11 fraemwork
  case $host_os in
  darwin*)
    AC_REQUIRE([SIM_AC_CHECK_X11])
    if $sim_ac_enable_darwin_x11; then
      sim_ac_gl_darwin_x11=/usr/X11R6
      if test -d $sim_ac_gl_darwin_x11; then
        sim_ac_gl_cppflags=-I$sim_ac_gl_darwin_x11/include
      fi
    fi
    ;;
  esac

  CPPFLAGS="$CPPFLAGS $sim_ac_glu_cppflags"

  # Mac OS X framework (no X11, -framework OpenGL)
  if $sim_ac_enable_darwin_x11; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([OpenGL/glu.h], [
      sim_ac_glu_header_avail=true
      sim_ac_glu_header=OpenGL/glu.h
      AC_DEFINE([HAVE_OPENGL_GLU_H], 1, [define if the GLU header should be included as OpenGL/glu.h])
    ])
  fi

  if $sim_ac_glu_header_avail; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([GL/glu.h], [
      sim_ac_glu_header_avail=true
      sim_ac_glu_header=GL/glu.h
      AC_DEFINE([HAVE_GL_GLU_H], 1, [define if the GLU header should be included as GL/glu.h])
    ])
  fi

  CPPFLAGS="$sim_ac_glu_save_CPPFLAGS"
  if $sim_ac_glu_header_avail; then
    if test x"$sim_ac_glu_cppflags" = x""; then
      AC_MSG_RESULT([@%:@include <$sim_ac_glu_header>])
    else
      AC_MSG_RESULT([$sim_ac_glu_cppflags, @%:@include <$sim_ac_glu_header>])
    fi
    $1
  else
    AC_MSG_RESULT([not found])
    $2
  fi
else
  AC_MSG_RESULT([disabled])
  $2
fi
])# SIM_AC_CHECK_HEADER_GLU

# **************************************************************************
# SIM_AC_CHECK_HEADER_GLEXT([IF-FOUND], [IF-NOT-FOUND])
#
# This macro detects how to include the GLEXT header file, and gives you the
# necessary CPPFLAGS in $sim_ac_glext_cppflags, and also sets the config.h
# defines HAVE_GL_GLEXT_H or HAVE_OPENGL_GLEXT_H if one of them is found.

AC_DEFUN([SIM_AC_CHECK_HEADER_GLEXT],
[sim_ac_glext_header_avail=false
AC_MSG_CHECKING([how to include glext.h])
if test x"$with_opengl" != x"no"; then
  sim_ac_glext_save_CPPFLAGS=$CPPFLAGS
  sim_ac_glext_cppflags=

  if test x"$with_opengl" != xyes && test x"$with_opengl" != x""; then
    sim_ac_glext_cppflags="-I${with_opengl}/include"
  else
    # On HP-UX platforms, OpenGL headers and libraries are usually installed
    # at this location.
    sim_ac_gl_hpux=/opt/graphics/OpenGL
    if test -d $sim_ac_gl_hpux; then
      sim_ac_glext_cppflags=-I$sim_ac_gl_hpux/include
    fi
  fi

  # On Mac OS X, GL is part of the optional X11 fraemwork
  case $host_os in
  darwin*)
    AC_REQUIRE([SIM_AC_CHECK_X11])
    if $sim_ac_enable_darwin_x11; then
      sim_ac_gl_darwin_x11=/usr/X11R6
      if test -d $sim_ac_gl_darwin_x11; then
        sim_ac_gl_cppflags=-I$sim_ac_gl_darwin_x11/include
      fi
    fi
    ;;
  esac

  CPPFLAGS="$CPPFLAGS $sim_ac_glext_cppflags"

  # Mac OS X framework (no X11, -framework OpenGL)
  if $sim_ac_enable_darwin_x11; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([OpenGL/glext.h], [
      sim_ac_glext_header_avail=true
      sim_ac_glext_header=OpenGL/glext.h
      AC_DEFINE([HAVE_OPENGL_GLEXT_H], 1, [define if the GLEXT header should be included as OpenGL/glext.h])
    ])
  fi

  if $sim_ac_glext_header_avail; then :
  else
    SIM_AC_CHECK_HEADER_SILENT([GL/glext.h], [
      sim_ac_glext_header_avail=true
      sim_ac_glext_header=GL/glext.h
      AC_DEFINE([HAVE_GL_GLEXT_H], 1, [define if the GLEXT header should be included as GL/glext.h])
    ])
  fi

  CPPFLAGS="$sim_ac_glext_save_CPPFLAGS"
  if $sim_ac_glext_header_avail; then
    if test x"$sim_ac_glext_cppflags" = x""; then
      AC_MSG_RESULT([@%:@include <$sim_ac_glext_header>])
    else
      AC_MSG_RESULT([$sim_ac_glext_cppflags, @%:@include <$sim_ac_glext_header>])
    fi
    $1
  else
    AC_MSG_RESULT([not found])
    $2
  fi
else
  AC_MSG_RESULT([disabled])
  $2
fi
])# SIM_AC_CHECK_HEADER_GLEXT


# **************************************************************************
# SIM_AC_CHECK_OPENGL([IF-FOUND], [IF-NOT-FOUND])
#
# This macro detects whether or not it's possible to link against OpenGL
# (or Mesa), and gives you the necessary modifications to the
# pre-processor, compiler and linker environment in the envvars
#
#                $sim_ac_ogl_cppflags
#                $sim_ac_ogl_ldflags
#                $sim_ac_ogl_libs (OpenGL library and all dependencies)
#                $sim_ac_ogl_lib (basename of OpenGL library)
#
# The necessary extra options are also automatically added to CPPFLAGS,
# LDFLAGS and LIBS.
#
# Authors: <larsa@sim.no>, <mortene@sim.no>.

AC_DEFUN([SIM_AC_CHECK_OPENGL], [

sim_ac_ogl_cppflags=
sim_ac_ogl_ldflags=
sim_ac_ogl_lib=
sim_ac_ogl_libs=

AC_ARG_WITH(
  [mesa],
  AC_HELP_STRING([--with-mesa],
                 [prefer MesaGL (if found) over OpenGL [[default=no]]]),
  [],
  [with_mesa=no])


sim_ac_ogl_glnames="GL opengl32"
sim_ac_ogl_mesaglnames=MesaGL

if test "x$with_mesa" = "xyes"; then
  sim_ac_ogl_first=$sim_ac_ogl_mesaglnames
  sim_ac_ogl_second=$sim_ac_ogl_glnames
else
  sim_ac_ogl_first=$sim_ac_ogl_glnames
  sim_ac_ogl_second=$sim_ac_ogl_mesaglnames
fi

AC_ARG_WITH(
  [opengl],
  AC_HELP_STRING([--with-opengl=DIR],
                 [OpenGL/Mesa installation directory]),
  [],
  [with_opengl=yes])

if test x"$with_opengl" != xno; then

  if test x"$with_opengl" != xyes && test x"$with_opengl" != x""; then
    sim_ac_ogl_ldflags=-L$with_opengl/lib
    # $sim_ac_ogl_cppflags is set up in the SIM_AC_CHECK_HEADER_GL
    # invocation further below.
  else
    # On HP-UX platforms, OpenGL headers and libraries are usually installed
    # at this location.
    sim_ac_gl_hpux=/opt/graphics/OpenGL
    if test -d $sim_ac_gl_hpux; then
      sim_ac_ogl_ldflags=-L$sim_ac_gl_hpux/lib
    fi
  fi

  sim_ac_use_framework_option=false;
  case $host_os in
  darwin*)
    AC_REQUIRE([SIM_AC_CHECK_X11])
    if $sim_ac_enable_darwin_x11; then
      # Use X11-based GL instead of OpenGL.framework when building against X11
      sim_ac_gl_darwin_x11=/usr/X11R6
      if test -d $sim_ac_gl_darwin_x11; then
        sim_ac_ogl_cppflags=-I$sim_ac_gl_darwin_x11/include
        sim_ac_ogl_ldflags=-L$sim_ac_gl_darwin_x11/lib
      fi
    else
      SIM_AC_CC_COMPILER_OPTION([-framework OpenGL], [sim_ac_use_framework_option=true])
    fi
    ;;
  esac

  if $sim_ac_use_framework_option; then
    sim_ac_ogl_ldflags="-Wl,-framework,OpenGL"
    sim_ac_ogl_lib=OpenGL
  fi

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_ogl_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_ogl_ldflags"

  SIM_AC_CHECK_HEADER_GL([CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags"],
                         [AC_MSG_WARN([could not find gl.h])])

  sim_ac_glchk_hit=false
  for sim_ac_tmp_outerloop in barebones withpthreads; do
    if $sim_ac_glchk_hit; then :; else

      sim_ac_oglchk_pthreadslib=""
      if test "$sim_ac_tmp_outerloop" = "withpthreads"; then
        AC_MSG_WARN([couldn't compile or link with OpenGL library -- trying with pthread library in place...])
        LIBS="$sim_ac_save_libs"
        SIM_AC_CHECK_PTHREAD([
          sim_ac_ogl_cppflags="$sim_ac_ogl_cppflags $sim_ac_pthread_cppflags"
          sim_ac_ogl_ldflags="$sim_ac_ogl_ldflags $sim_ac_pthread_ldflags"
          sim_ac_oglchk_pthreadslib="$sim_ac_pthread_libs"
          ],
          [AC_MSG_WARN([couldn't compile or link with pthread library])
          ])
      fi

      AC_MSG_CHECKING([for OpenGL library dev-kit])
      # Mac OS X uses nada (only LDFLAGS), which is why "" was set first
      for sim_ac_ogl_libcheck in "" $sim_ac_ogl_first $sim_ac_ogl_second; do
        if $sim_ac_glchk_hit; then :; else
          if test -n "${sim_ac_ogl_libcheck}"; then
            LIBS="-l${sim_ac_ogl_libcheck} $sim_ac_oglchk_pthreadslib $sim_ac_save_libs"
          else
            LIBS="$sim_ac_oglchk_pthreadslib $sim_ac_save_libs"
          fi
          AC_TRY_LINK(
            [#ifdef HAVE_WINDOWS_H
             #include <windows.h>
             #endif /* HAVE_WINDOWS_H */
             #ifdef HAVE_GL_GL_H
             #include <GL/gl.h>
             #else /* ! HAVE_GL_GL_H */
             #ifdef HAVE_OPENGL_GL_H
             /* Mac OS X */
             #include <OpenGL/gl.h>
             #endif /* HAVE_OPENGL_GL_H */
             #endif /* ! HAVE_GL_GL_H */
            ],
            [glPointSize(1.0f);],
            [
             sim_ac_glchk_hit=true
             sim_ac_ogl_libs=$sim_ac_oglchk_pthreadslib
             if test -n "${sim_ac_ogl_libcheck}"; then
               sim_ac_ogl_lib=$sim_ac_ogl_libcheck
               sim_ac_ogl_libs="-l${sim_ac_ogl_libcheck} $sim_ac_oglchk_pthreadslib"
             fi
            ]
          )
        fi
      done
      if $sim_ac_glchk_hit; then
        AC_MSG_RESULT($sim_ac_ogl_cppflags $sim_ac_ogl_ldflags $sim_ac_ogl_libs)
      else
        AC_MSG_RESULT([unresolved])
      fi
    fi
  done

  if $sim_ac_glchk_hit; then
    LIBS="$sim_ac_ogl_libs $sim_ac_save_libs"
    $1
  else
    CPPFLAGS="$sim_ac_save_cppflags"
    LDFLAGS="$sim_ac_save_ldflags"
    LIBS="$sim_ac_save_libs"
    $2
  fi
fi
])


# **************************************************************************
# SIM_AC_GLU_READY_IFELSE( [ACTION-IF-TRUE], [ACTION-IF-FALSE] )

AC_DEFUN([SIM_AC_GLU_READY_IFELSE], [
sim_ac_glu_save_CPPFLAGS=$CPPFLAGS
SIM_AC_CHECK_HEADER_GLU(, [AC_MSG_WARN([could not find glu.h])])
if test x"$sim_ac_gl_cppflags" != x"$sim_ac_glu_cppflags"; then
  CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags $sim_ac_glu_cppflags"
fi
AC_CACHE_CHECK(
  [if GLU is available as part of GL library],
  [sim_cv_glu_ready],
  [AC_TRY_LINK(
    [
#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif /* HAVE_WINDOWS_H */
#ifdef HAVE_GL_GL_H
#include <GL/gl.h>
#else
#ifdef HAVE_OPENGL_GL_H
#include <OpenGL/gl.h>
#endif
#endif
#ifdef HAVE_GL_GLU_H
#include <GL/glu.h>
#else
#ifdef HAVE_OPENGL_GLU_H
#include <OpenGL/glu.h>
#endif
#endif
],
    [
gluSphere(0L, 1.0, 1, 1);
/* Defect JAGad01283 of HP's aCC compiler causes a link failure unless
   there is at least one "pure" OpenGL call along with GLU calls. */
glEnd();
],
    [sim_cv_glu_ready=true],
    [sim_cv_glu_ready=false])])

if $sim_cv_glu_ready; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_GLU_READY_IFELSE()

# Usage:
#  SIM_AC_CHECK_GLU([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to use the OpenGL utility library; GLU. If it is found,
#  these shell variables are set:
#
#    $sim_ac_glu_cppflags (extra flags the compiler needs for GLU)
#    $sim_ac_glu_ldflags  (extra flags the linker needs for GLU)
#    $sim_ac_glu_libs     (link libraries the linker needs for GLU)
#
#  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
#  In addition, the variable $sim_ac_glu_avail is set to "yes" if GLU
#  is found.
#
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_CHECK_GLU], [
sim_ac_glu_save_CPPFLAGS=$CPPFLAGS
SIM_AC_CHECK_HEADER_GLU(, [AC_MSG_WARN([could not find glu.h])])
if test x"$sim_ac_gl_cppflags" != x"$sim_ac_glu_cppflags"; then
  CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags $sim_ac_glu_cppflags"
fi
sim_ac_glu_avail=no

# It's usually libGLU.so on UNIX systems and glu32.lib on MSWindows.
sim_ac_glu_names="-lGLU -lglu32"
sim_ac_glu_mesanames=-lMesaGLU

# with_mesa is set from the SIM_AC_CHECK_OPENGL macro.
if test "x$with_mesa" = "xyes"; then
  sim_ac_glu_first=$sim_ac_glu_mesanames
  sim_ac_glu_second=$sim_ac_glu_names
else
  sim_ac_glu_first=$sim_ac_glu_names
  sim_ac_glu_second=$sim_ac_glu_mesanames
fi

AC_ARG_WITH(
  [glu],
  AC_HELP_STRING([--with-glu=DIR],
                 [use the OpenGL utility library [[default=yes]]]),
  [],
  [with_glu=yes])

if test x"$with_glu" != xno; then
  if test x"$with_glu" != xyes; then
    # sim_ac_glu_cppflags="-I${with_glu}/include"
    sim_ac_glu_ldflags="-L${with_glu}/lib"
  fi

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_glu_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_glu_ldflags"

  AC_CACHE_CHECK(
    [whether GLU is available],
    sim_cv_lib_glu,
    [sim_cv_lib_glu=UNRESOLVED

    # Some platforms (like BeOS) have the GLU functionality in the GL
    # library (and no GLU library present).
    for sim_ac_glu_libcheck in "" $sim_ac_glu_first $sim_ac_glu_second; do
      if test "x$sim_cv_lib_glu" = "xUNRESOLVED"; then
        LIBS="$sim_ac_glu_libcheck $sim_ac_save_libs"
        AC_TRY_LINK([
#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif /* HAVE_WINDOWS_H */
#ifdef HAVE_GL_GL_H
#include <GL/gl.h>
#else
#ifdef HAVE_OPENGL_GL_H
#include <OpenGL/gl.h>
#endif
#endif
#ifdef HAVE_GL_GLU_H
#include <GL/glu.h>
#else
#ifdef HAVE_OPENGL_GLU_H
#include <OpenGL/glu.h>
#endif
#endif
],
                    [
gluSphere(0L, 1.0, 1, 1);
/* Defect JAGad01283 of HP's aCC compiler causes a link failure unless
   there is at least one "pure" OpenGL call along with GLU calls. */
glEnd();
],
                    [sim_cv_lib_glu="$sim_ac_glu_libcheck"])
      fi
    done
    if test x"$sim_cv_lib_glu" = x"" &&
       test x`echo $LDFLAGS | grep -c -- "-Wl,-framework,OpenGL"` = x1; then
      # just for the visual representation on Mac OS X
      sim_cv_lib_glu="-Wl,-framework,OpenGL"
    fi
  ])

  LIBS="$sim_ac_save_libs"

  CPPFLAGS=$sim_ac_glu_save_CPPFLAGS
  if test "x$sim_cv_lib_glu" != "xUNRESOLVED"; then
    if test x"$sim_cv_lib_glu" = x"-Wl,-framework,OpenGL"; then
      sim_ac_glu_libs=""
    else
      sim_ac_glu_libs="$sim_cv_lib_glu"
    fi
    LIBS="$sim_ac_glu_libs $sim_ac_save_libs"
    sim_ac_glu_avail=yes
    $1
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    $2
  fi
fi
])


# Usage:
#  SIM_AC_GLU_NURBSOBJECT([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find out whether the interface struct against the GLU
#  library NURBS functions is called "GLUnurbs" or "GLUnurbsObj".
#  (This seems to have changed somewhere between release 1.1 and
#  release 1.3 of GLU).
#
#  The variable $sim_ac_glu_nurbsobject is set to the correct name
#  if the nurbs structure is found.
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_GLU_NURBSOBJECT], [
AC_CACHE_CHECK(
  [what structure to use in the GLU NURBS interface],
  sim_cv_func_glu_nurbsobject,
  [sim_cv_func_glu_nurbsobject=NONE
   for sim_ac_glu_structname in GLUnurbs GLUnurbsObj; do
    if test "$sim_cv_func_glu_nurbsobject" = NONE; then
      AC_TRY_LINK([
#ifdef HAVE_WINDOWS_H
#include <windows.h>
#endif /* HAVE_WINDOWS_H */
#ifdef HAVE_GL_GL_H
#include <GL/gl.h>
#else
#ifdef HAVE_OPENGL_GL_H
#include <OpenGL/gl.h>
#endif
#endif
#ifdef HAVE_GL_GLU_H
#include <GL/glu.h>
#else
#ifdef HAVE_OPENGL_GLU_H
#include <OpenGL/glu.h>
#endif
#endif
],
                  [
$sim_ac_glu_structname * hepp = gluNewNurbsRenderer();
gluDeleteNurbsRenderer(hepp);
/* Defect JAGad01283 of HP's aCC compiler causes a link failure unless
   there is at least one "pure" OpenGL call along with GLU calls. */
glEnd();
],
                  [sim_cv_func_glu_nurbsobject=$sim_ac_glu_structname])
    fi
  done
])

if test $sim_cv_func_glu_nurbsobject = NONE; then
  sim_ac_glu_nurbsobject=
  $2
else
  sim_ac_glu_nurbsobject=$sim_cv_func_glu_nurbsobject
  $1
fi
])

# **************************************************************************
# SIM_AC_HAVE_GLXGETCURRENTDISPLAY_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check whether the OpenGL implementation includes the method
# glXGetCurrentDisplay().

AC_DEFUN([SIM_AC_HAVE_GLXGETCURRENTDISPLAY_IFELSE], [
AC_CACHE_CHECK(
  [whether glXGetCurrentDisplay() is available],
  sim_cv_have_glxgetcurrentdisplay,
  AC_TRY_LINK([
#include <GL/gl.h>
#include <GL/glx.h>
],
[(void)glXGetCurrentDisplay();],
[sim_cv_have_glxgetcurrentdisplay=true],
[sim_cv_have_glxgetcurrentdisplay=false]))

if ${sim_cv_have_glxgetcurrentdisplay}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_GLXGETCURRENTDISPLAY_IFELSE()

# **************************************************************************
# SIM_AC_HAVE_GLX_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check whether GLX is on the system.

AC_DEFUN([SIM_AC_HAVE_GLX_IFELSE], [
AC_CACHE_CHECK(
  [whether GLX is on the system],
  sim_cv_have_glx,
  AC_TRY_LINK(
    [
#include <GL/glx.h>
#include <GL/gl.h>
],
    [
(void)glXChooseVisual(0L, 0, 0L);
/* Defect JAGad01283 of HP's aCC compiler causes a link failure unless
   there is at least one "pure" OpenGL call along with GLU calls. */
glEnd();
],
    [sim_cv_have_glx=true],
    [sim_cv_have_glx=false]))

if ${sim_cv_have_glx=false}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_GLX_IFELSE()

# **************************************************************************
# SIM_AC_HAVE_GLXGETPROCADDRESSARB_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check for glXGetProcAddressARB() function.

AC_DEFUN([SIM_AC_HAVE_GLXGETPROCADDRESSARB_IFELSE], [
AC_CACHE_CHECK(
  [for glXGetProcAddressARB() function],
  sim_cv_have_glxgetprocaddressarb,
  AC_TRY_LINK(
    [
#include <GL/glx.h>
#include <GL/gl.h>
],
    [
      glXGetProcAddressARB((const GLubyte *)"glClearColor");
/* Defect JAGad01283 of HP's aCC compiler causes a link failure unless
   there is at least one "pure" OpenGL call along with GLU calls. */
      glEnd();
],
    [sim_cv_have_glxgetprocaddressarb=true],
    [sim_cv_have_glxgetprocaddressarb=false]))

if ${sim_cv_have_glxgetprocaddressarb=false}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_GLXGETPROCADDRESSARB_IFELSE()


# **************************************************************************
# SIM_AC_HAVE_WGL_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check whether WGL is on the system.
#
# This macro has one important side-effect: the variable
# sim_ac_wgl_libs will be set to the list of libraries
# needed to link with wgl*() functions.

AC_DEFUN([SIM_AC_HAVE_WGL_IFELSE], [
sim_ac_save_libs=$LIBS
sim_ac_wgl_libs="-lgdi32"
LIBS="$LIBS $sim_ac_wgl_libs"

AC_CACHE_CHECK(
  [whether WGL is on the system],
  sim_cv_have_wgl,
  AC_TRY_LINK(
    [
#include <windows.h>
#include <GL/gl.h>
],
    [(void)wglCreateContext(0L);],
    [sim_cv_have_wgl=true],
    [sim_cv_have_wgl=false]))

LIBS=$sim_ac_save_libs
if ${sim_cv_have_wgl=false}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_WGL_IFELSE()

# **************************************************************************
# SIM_AC_HAVE_AGL_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check whether AGL is on the system.

AC_DEFUN([SIM_AC_HAVE_AGL_IFELSE], [
sim_ac_save_ldflags=$LDFLAGS
sim_ac_agl_ldflags="-Wl,-framework,ApplicationServices -Wl,-framework,AGL -Wl,-framework,Carbon"

LDFLAGS="$LDFLAGS $sim_ac_agl_ldflags"

# see comment in Coin/src/glue/gl_agl.c: regarding __CARBONSOUND__ define

AC_CACHE_CHECK(
  [whether AGL is on the system],
  sim_cv_have_agl,
  AC_TRY_LINK(
    [#include <AGL/agl.h>
     #define __CARBONSOUND__
     #include <Carbon/Carbon.h>],
    [AGLContext ctx = NULL;WindowRef wref = aglGetWindowRef(ctx);HIViewRef href = HIViewGetRoot(wref);],
    [sim_cv_have_agl=true],
    [sim_cv_have_agl=false]))

LDFLAGS=$sim_ac_save_ldflags
if ${sim_cv_have_agl=false}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_AGL_IFELSE()


AC_DEFUN([SIM_AC_HAVE_AGL_PBUFFER], [
  AC_CACHE_CHECK([whether we can use AGL pBuffers],
    sim_cv_agl_pbuffer_avail,
    [AC_TRY_LINK([ #include <AGL/agl.h> ],
                 [AGLPbuffer pbuffer;],
                 [sim_cv_agl_pbuffer_avail=yes],
                 [sim_cv_agl_pbuffer_avail=no])])

  if test x"$sim_cv_agl_pbuffer_avail" = xyes; then
    ifelse([$1], , :, [$1])
  else
    ifelse([$2], , :, [$2])
  fi
])

# **************************************************************************
# SIM_AC_HAVE_CGL_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# Check whether CGL is on the system.

AC_DEFUN([SIM_AC_HAVE_CGL_IFELSE], [
sim_ac_save_ldflags=$LDFLAGS
sim_ac_cgl_ldflags="-Wl,-framework,OpenGL"

LDFLAGS="$LDFLAGS $sim_ac_cgl_ldflags"

AC_CACHE_CHECK(
  [whether CGL is on the system],
  sim_cv_have_cgl,
  AC_TRY_LINK(
    [#include <OpenGL/OpenGL.h>],
    [CGLGetCurrentContext();],
    [sim_cv_have_cgl=true],
    [sim_cv_have_cgl=false]))

LDFLAGS=$sim_ac_save_ldflags
if ${sim_cv_have_cgl=false}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_HAVE_CGL_IFELSE()

# pkg.m4 - Macros to locate and utilise pkg-config.            -*- Autoconf -*-
#
# Copyright © 2004 Scott James Remnant <scott@netsplit.com>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# As a special exception to the GNU General Public License, if you
# distribute this file as part of a program that contains a
# configuration script generated by Autoconf, you may include it under
# the same distribution terms that you use for the rest of that program.

# PKG_PROG_PKG_CONFIG([MIN-VERSION])
# ----------------------------------
AC_DEFUN([PKG_PROG_PKG_CONFIG],
[m4_pattern_forbid([^_?PKG_[A-Z_]+$])
m4_pattern_allow([^PKG_CONFIG(_PATH)?$])
AC_ARG_VAR([PKG_CONFIG], [path to pkg-config utility])dnl
if test "x$ac_cv_env_PKG_CONFIG_set" != "xset"; then
	AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
fi
if test -n "$PKG_CONFIG"; then
	_pkg_min_version=m4_default([$1], [0.9.0])
	AC_MSG_CHECKING([pkg-config is at least version $_pkg_min_version])
	if $PKG_CONFIG --atleast-pkgconfig-version $_pkg_min_version; then
		AC_MSG_RESULT([yes])
	else
		AC_MSG_RESULT([no])
		PKG_CONFIG=""
	fi

fi[]dnl
])# PKG_PROG_PKG_CONFIG

# PKG_CHECK_EXISTS(MODULES, [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
#
# Check to see whether a particular set of modules exists.  Similar
# to PKG_CHECK_MODULES(), but does not set variables or print errors.
#
#
# Similar to PKG_CHECK_MODULES, make sure that the first instance of
# this or PKG_CHECK_MODULES is called, or make sure to call
# PKG_CHECK_EXISTS manually
# --------------------------------------------------------------
AC_DEFUN([PKG_CHECK_EXISTS],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
if test -n "$PKG_CONFIG" && \
    AC_RUN_LOG([$PKG_CONFIG --exists --print-errors "$1"]); then
  m4_ifval([$2], [$2], [:])
m4_ifvaln([$3], [else
  $3])dnl
fi])


# _PKG_CONFIG([VARIABLE], [COMMAND], [MODULES])
# ---------------------------------------------
m4_define([_PKG_CONFIG],
[if test -n "$PKG_CONFIG"; then
    if test -n "$$1"; then
        pkg_cv_[]$1="$$1"
    else
        PKG_CHECK_EXISTS([$3],
                         [pkg_cv_[]$1=`$PKG_CONFIG --[]$2 "$3" 2>/dev/null`],
			 [pkg_failed=yes])
    fi
else
	pkg_failed=untried
fi[]dnl
])# _PKG_CONFIG

# _PKG_SHORT_ERRORS_SUPPORTED
# -----------------------------
AC_DEFUN([_PKG_SHORT_ERRORS_SUPPORTED],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])
if $PKG_CONFIG --atleast-pkgconfig-version 0.20; then
        _pkg_short_errors_supported=yes
else
        _pkg_short_errors_supported=no
fi[]dnl
])# _PKG_SHORT_ERRORS_SUPPORTED


# PKG_CHECK_MODULES(VARIABLE-PREFIX, MODULES, [ACTION-IF-FOUND],
# [ACTION-IF-NOT-FOUND])
#
#
# Note that if there is a possibility the first call to
# PKG_CHECK_MODULES might not happen, you should be sure to include an
# explicit call to PKG_PROG_PKG_CONFIG in your configure.ac
#
#
# --------------------------------------------------------------
AC_DEFUN([PKG_CHECK_MODULES],
[AC_REQUIRE([PKG_PROG_PKG_CONFIG])dnl
AC_ARG_VAR([$1][_CFLAGS], [C compiler flags for $1, overriding pkg-config])dnl
AC_ARG_VAR([$1][_LIBS], [linker flags for $1, overriding pkg-config])dnl

pkg_failed=no
AC_MSG_CHECKING([for $1])

_PKG_CONFIG([$1][_CFLAGS], [cflags], [$2])
_PKG_CONFIG([$1][_LIBS], [libs], [$2])

m4_define([_PKG_TEXT], [Alternatively, you may set the environment variables $1[]_CFLAGS
and $1[]_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.])

if test $pkg_failed = yes; then
        _PKG_SHORT_ERRORS_SUPPORTED
        if test $_pkg_short_errors_supported = yes; then
	        $1[]_PKG_ERRORS=`$PKG_CONFIG --short-errors --errors-to-stdout --print-errors "$2"`
        else
	        $1[]_PKG_ERRORS=`$PKG_CONFIG --errors-to-stdout --print-errors "$2"`
        fi
	# Put the nasty error message in config.log where it belongs
	echo "$$1[]_PKG_ERRORS" >&AS_MESSAGE_LOG_FD

	ifelse([$4], , [AC_MSG_ERROR(dnl
[Package requirements ($2) were not met:

$$1_PKG_ERRORS

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

_PKG_TEXT
])],
		[$4])
elif test $pkg_failed = untried; then
	ifelse([$4], , [AC_MSG_FAILURE(dnl
[The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

_PKG_TEXT

To get pkg-config, see <http://www.freedesktop.org/software/pkgconfig>.])],
		[$4])
else
	$1[]_CFLAGS=$pkg_cv_[]$1[]_CFLAGS
	$1[]_LIBS=$pkg_cv_[]$1[]_LIBS
        AC_MSG_RESULT([yes])
	ifelse([$3], , :, [$3])
fi[]dnl
])# PKG_CHECK_MODULES

# Helper macros for the SIM_AC_CHECK_QT macro below.

# SIM_AC_WITH_QT
#
# Sets sim_ac_with_qt (from --with-qt=[true|false]) and
# sim_ac_qtdir (from either --with-qt=DIR or $QTDIR).

AC_DEFUN([SIM_AC_WITH_QT], [
sim_ac_qtdir=
AC_ARG_WITH(
  [qt],
  AC_HELP_STRING([--with-qt=[true|false|DIR]],
                 [specify if Qt should be used, and optionally the location of the Qt library [default=true]]),
  [case $withval in
  no | false ) sim_ac_with_qt=false ;;
  yes | true ) sim_ac_with_qt=true ;;
  *)
    sim_ac_with_qt=true
    sim_ac_qtdir=$withval
    ;;
  esac],
  [sim_ac_with_qt=true])

if $sim_ac_with_qt; then
  # The Cygwin environment needs to invoke moc with a POSIX-style path.
  AC_PATH_PROG(sim_ac_qt_cygpath, cygpath, false)

  if test -n "$sim_ac_qtdir"; then
    if test $sim_ac_qt_cygpath != "false"; then
      # Quote $sim_ac_qtdir in case it contains whitespace characters.
      sim_ac_qtdir=`$sim_ac_qt_cygpath -u "$sim_ac_qtdir"`
    fi
  else
    if test $sim_ac_qt_cygpath = "false"; then
      sim_ac_qtdir=$QTDIR
    else
      # Quote $QTDIR in case it's empty.
      sim_ac_qtdir=`$sim_ac_qt_cygpath -u "$QTDIR"`
    fi

    AC_MSG_CHECKING([value of the QTDIR environment variable])
    if test x"$sim_ac_qtdir" = x""; then
      AC_MSG_RESULT([empty])
    else
      AC_MSG_RESULT([$sim_ac_qtdir])

      # list contents of what's in the qt dev environment into config.log
      for i in "" bin lib; do
        echo "Listing contents of $sim_ac_qtdir/$i:" >&5
        ls -l $sim_ac_qtdir/$i >&5 2>&1
      done
    fi
  fi
fi
])

# SIM_AC_QT_PROG(VARIABLE, PROG-TO-CHECK-FOR)
#
# Substs VARIABLE to the path of the PROG-TO-CHECK-FOR, if found
# in either $PATH, $QTDIR/bin or the --with-qt=DIR directories.
#
# If not found, VARIABLE will be set to false.

AC_DEFUN([SIM_AC_QT_PROG], [
AC_REQUIRE([SIM_AC_WITH_QT])

if $sim_ac_with_qt; then

  sim_ac_path=$PATH
  if test -n "$sim_ac_qtdir"; then
    sim_ac_path=$sim_ac_qtdir/bin:$PATH
  fi

  AC_PATH_PROG([$1], $2, false, $sim_ac_path)
  if test x"$$1" = x"false"; then
    if test -z "$QTDIR"; then
      AC_MSG_WARN([QTDIR environment variable not set -- this might be an indication of a problem])
    fi
    AC_MSG_WARN([the ``$2'' Qt pre-processor tool not found])
  fi
else
  AC_SUBST([$1], [false])
fi
])

# Usage:
#  SIM_AC_QT_VERSION
#
# Find version number of the Qt library. sim_ac_qt_version will contain
# the full version number string, and sim_ac_qt_major_version will contain
# only the major version number.

AC_DEFUN([SIM_AC_QT_VERSION], [

AC_MSG_CHECKING([version of Qt library])

cat > conftest.c << EOF
#include <qglobal.h>
int VerQt = QT_VERSION;
EOF

# The " *"-parts of the last sed-expression on the next line are necessary
# because at least the Solaris/CC preprocessor adds extra spaces before and
# after the trailing semicolon.
sim_ac_qt_version=`$CXXCPP $CPPFLAGS conftest.c 2>/dev/null | grep '^int VerQt' | sed 's%^int VerQt = %%' | sed 's% *;.*$%%'`

case $sim_ac_qt_version in
0x* )
  sim_ac_qt_version=`echo $sim_ac_qt_version | sed -e 's/^0x.\(.\).\(.\).\(.\)/\1\2\3/;'`
  ;;
* )
  # nada
  ;;
esac
sim_ac_qt_major_version=`echo $sim_ac_qt_version | cut -c1`

rm -f conftest.c
AC_MSG_RESULT($sim_ac_qt_version)
])

# Usage:
#  SIM_AC_CHECK_QT([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the Qt development system. If it is found, these
#  shell variables are set:
#
#    $sim_ac_qt_cppflags (extra flags the compiler needs for Qt lib)
#    $sim_ac_qt_ldflags  (extra flags the linker needs for Qt lib)
#    $sim_ac_qt_libs     (link libraries the linker needs for Qt lib)
#
#  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
#  In addition, the variable $sim_ac_qt_avail is set to "yes" if
#  the Qt development system is found.
#
# Authors:
#   Morten Eriksen <mortene@sim.no>.
#   Lars J. Aas <larsa@sim.no>.

AC_DEFUN([SIM_AC_CHECK_QT], [

AC_REQUIRE([SIM_AC_WITH_QT])

AC_ARG_ENABLE(
  [qt-debug],
  AC_HELP_STRING([--enable-qt-debug], [win32: link with debug versions of Qt libraries]),
  [case $enableval in
  yes | true ) sim_ac_qt_debug=true ;;
  *) sim_ac_qt_debug=false ;;
  esac],
  [sim_ac_qt_debug=false])

sim_ac_qt_avail=no

if $sim_ac_with_qt; then

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  sim_ac_qt_libs=UNRESOLVED

  # Check for Mac OS framework installation
  if test -z "$QTDIR"; then
    sim_ac_qt_framework_dir=/Library/Frameworks
    # FIXME: Should we also look for the Qt framework in other
    # default framework locations (such as ~/Library/Frameworks)?
    # Or require the user to specify this explicitly, e.g. by
    # passing --with-qt-framework=xxx? 20050802 kyrah.
  else
    sim_ac_qt_framework_dir=$sim_ac_qtdir/lib
  fi

  SIM_AC_HAVE_QT_FRAMEWORK

  if $sim_cv_have_qt_framework; then
    sim_ac_qt_cppflags="-I$sim_ac_qt_framework_dir/QtCore.framework/Headers -I$sim_ac_qt_framework_dir/QtOpenGL.framework/Headers -I$sim_ac_qt_framework_dir/QtGui.framework/Headers -F$sim_ac_qt_framework_dir"
    sim_ac_qt_libs="-Wl,-F$sim_ac_qt_framework_dir -Wl,-framework,QtGui -Wl,-framework,QtOpenGL -Wl,-framework,QtCore -Wl,-framework,QtXml -Wl,-framework,QtNetwork -Wl,-framework,QtSql"
  else

    sim_ac_qglobal_unresolved=true

    sim_ac_QTDIR_cppflags=
    sim_ac_QTDIR_ldflags=
    if test -n "$sim_ac_qtdir"; then
      sim_ac_QTDIR_cppflags="-I$sim_ac_qtdir/include"
      sim_ac_QTDIR_ldflags="-L$sim_ac_qtdir/lib"
      CPPFLAGS="$sim_ac_QTDIR_cppflags $CPPFLAGS"
      LDFLAGS="$LDFLAGS $sim_ac_QTDIR_ldflags"
    fi

    # This should take care of detecting qglobal.h for Qt 3 if QTDIR was set,
    # or if Qt is in default locations, or if it is in any additional "-I..."
    # set up by the user with CPPFLAGS:
    sim_ac_temp="$CPPFLAGS"
    SIM_AC_CHECK_HEADER_SILENT([qglobal.h], [sim_ac_qglobal_unresolved=false])

    # If we're to use Qt 4 and QTDIR is set, this should be able to find it:
    if $sim_ac_qglobal_unresolved; then
      SIM_AC_CHECK_HEADER_SILENT([Qt/qglobal.h],
                                 [sim_ac_qglobal_unresolved=false])
      if $sim_ac_qglobal_unresolved; then
        :
      else
        if test -z "$sim_ac_QTDIR_cppflags"; then
          AC_MSG_ERROR([Qt/qglobal.h detected, but no QTDIR environment variable set. Do not know where the Qt include files are.])
        else
          sim_ac_QTDIR_cppflags="$sim_ac_QTDIR_cppflags $sim_ac_QTDIR_cppflags/Qt"
        fi
      fi
    fi
    CPPFLAGS="$sim_ac_temp"

    # Check for known default locations of Qt installation on various
    # systems:
    if $sim_ac_qglobal_unresolved; then
      sim_ac_temp="$CPPFLAGS"
      # /usr/include/qt: Debian-installations with Qt 3
      # /usr/include/qt4: Debian-installations with Qt 4
      # /sw/include/qt: Mac OS X Fink
      for i in "/usr/include/qt" "/usr/include/qt4" "/sw/include/qt"; do
        if $sim_ac_qglobal_unresolved; then
          CPPFLAGS="-I$i $sim_ac_temp"
          SIM_AC_CHECK_HEADER_SILENT([qglobal.h],
                                     [sim_ac_qglobal_unresolved=false
                                      sim_ac_QTDIR_cppflags="-I$i"
                                     ])
          if $sim_ac_qglobal_unresolved; then
            SIM_AC_CHECK_HEADER_SILENT([Qt/qglobal.h],
                                       [sim_ac_qglobal_unresolved=false
                                        sim_ac_QTDIR_cppflags="-I$i -I$i/Qt"
                                       ])
          fi
        fi
      done
      CPPFLAGS="$sim_ac_temp"
    fi

    # Mac OS X Darwin ports
    if $sim_ac_qglobal_unresolved; then
      sim_ac_temp="$CPPFLAGS"
      sim_ac_i="-I/opt/local/include/qt3"
      CPPFLAGS="$sim_ac_i $CPPFLAGS"
      SIM_AC_CHECK_HEADER_SILENT([qglobal.h],
                                 [sim_ac_qglobal_unresolved=false
                                  sim_ac_QTDIR_cppflags="$sim_ac_i"
                                  sim_ac_QTDIR_ldflags="-L/opt/local/lib"
                                 ])
      CPPFLAGS="$sim_ac_temp"
    fi

    if $sim_ac_qglobal_unresolved; then
      AC_MSG_WARN([header file qglobal.h not found, can not compile Qt code])
    else
      CPPFLAGS="$sim_ac_QTDIR_cppflags $CPPFLAGS"
      LDFLAGS="$LDFLAGS $sim_ac_QTDIR_ldflags"

      SIM_AC_QT_VERSION

      if test $sim_ac_qt_version -lt 200; then
        SIM_AC_ERROR([too-old-qt])
      fi

      # Too hard to feature-check for the Qt-on-Mac problems, as they involve
      # obscure behavior of the QGLWidget -- so we just resort to do platform
      # and version checking instead.
      case $host_os in
      darwin*)
        if test $sim_ac_qt_version -lt 302; then
          SIM_AC_CONFIGURATION_WARNING([The version of Qt you are using is known to contain some serious bugs on MacOS X. We strongly recommend you to upgrade. (See $srcdir/README.MAC for details.)])
        fi

        if $sim_ac_enable_darwin_x11; then
          # --enable-darwin-x11 specified but attempting Qt/Mac linkage
          AC_TRY_COMPILE([#include <qapplication.h>],
                      [#if defined(__APPLE__) && defined(Q_WS_MAC)
                       #error blah!
                       #endif],[],
                      [SIM_AC_ERROR([mac-qt-but-x11-requested])])
        else
          # Using Qt/X11 but option --enable-darwin-x11 not given
          AC_TRY_COMPILE([#include <qapplication.h>],
                    [#if defined(__APPLE__) && defined(Q_WS_X11)
                     #error blah!
                     #endif],[],
                    [SIM_AC_ERROR([x11-qt-but-no-x11-requested])])
        fi
        ;;
      esac

      # Known problems:
      #
      #   * Qt v3.0.1 has a bug where SHIFT-PRESS + CTRL-PRESS + CTRL-RELEASE
      #     results in the last key-event coming out completely wrong under X11.
      #     Known to be fixed in 3.0.3, unknown status in 3.0.2.  <mortene@sim.no>.
      #
      if test $sim_ac_qt_version -lt 303; then
        SIM_AC_CONFIGURATION_WARNING([The version of Qt you are compiling against is known to contain bugs which influences functionality in SoQt. We strongly recommend you to upgrade.])
      fi

      sim_ac_qt_cppflags=

      # Do not cache the result, as we might need to play tricks with
      # CPPFLAGS under MSWin.

      # It should be helpful to be able to override the libs-checking with
      # environment variables. Then people won't get completely stuck
      # when the check fails -- we can just take a look at the
      # config.log and give them advice on how to proceed with no updates
      # necessary.
      #
      # (Note also that this makes it possible to select whether to use the
      # mt-safe or the "standard" Qt library if both are installed on the
      # user's system.)
      #
      # mortene.

      if test x"$CONFIG_QTLIBS" != x""; then
        AC_MSG_CHECKING([for Qt linking with $CONFIG_QTLIBS])

        for sim_ac_qt_cppflags_loop in "" "-DQT_DLL"; do
          CPPFLAGS="$sim_ac_QTDIR_cppflags $sim_ac_qt_cppflags_loop $sim_ac_save_cppflags"
          LIBS="$CONFIG_QTLIBS $sim_ac_save_libs"
          AC_TRY_LINK([#include <qapplication.h>],
                      [
                       // FIXME: assignment to qApp does no longer work with Qt 4,
                       // should try to find another way to do the same thing. 20050629 mortene.
                       #if QT_VERSION < 0x040000
                       qApp = NULL; /* QT_DLL must be defined for assignment to global variables to work */
                       #endif
                       qApp->exit(0);],
                      [sim_ac_qt_libs="$CONFIG_QTLIBS"
                       sim_ac_qt_cppflags="$sim_ac_QTDIR_cppflags $sim_ac_qt_cppflags_loop"
                       sim_ac_qt_ldflags="$sim_ac_QTDIR_ldflags"
                      ])
        done

        if test "x$sim_ac_qt_libs" = "xUNRESOLVED"; then
          AC_MSG_RESULT([failed!])
        else
          AC_MSG_RESULT([ok])
        fi

      else
        AC_MSG_CHECKING([for Qt library devkit])

        ## Test all known possible combinations of linking against the
        ## Troll Tech Qt library:
        ##
        ## * "-lQtGui": Qt 4 on UNIX-like systems
        ##
        ## * "-lQtGui -lQtCore -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32 -lwinspool -lwinmm -ladvapi32 -lws2_32 -lshell32"
        ##   Should cover static linking against Qt4 on win32
        ##
        ## * "-lqt-gl": links against the standard Debian version of the
        ##   Qt library with embedded QGL
        ##
        ## * "-lqt": should work for most UNIX(-derived) platforms on
        ##   dynamic and static linking with the non-mtsafe library
        ##
        ## * "-lqt-mt": should work for most UNIX(-derived) platforms on
        ##   dynamic and static linking with the mtsafe library
        ##
        ## * "-lqt{version} -lqtmain -lgdi32": w/QT_DLL defined should
        ##   cover dynamic Enterprise Edition linking on Win32 platforms
        ##
        ## * "-lqt -lqtmain -lgdi32": ...unless the {version} suffix is missing,
        ##   which we've had reports about
        ##
        ## * "-lqt-mt{version} -lqtmain -lgdi32": w/QT_DLL defined should
        ##   cover dynamic multi-thread Enterprise Edition linking on Win32
        ##   platforms
        ##
        ## * "-lqt-mt{version}nc -lqtmain -lgdi32": w/QT_DLL defined should
        ##   cover dynamic Non-Commercial Edition linking on Win32 platforms
        ##
        ## * "-lqt -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32": should cover
        ##   static linking on Win32 platforms
        ##
        ## * "-lqt-mt -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32 -lwinspool -lwinmm -ladvapi32 -lws2_32":
        ##   added for the benefit of the Qt 3.0.0 Evaluation Version
        ##   (update: "advapi32.lib" seems to be a new dependency for Qt 3.1.0)
        ##   (update: "ws2_32.lib" seems to be a new dependency for Qt 3.1.2)
        ##
        ## * "-lqt-mt-eval": the Qt/Mac evaluation version
        ##
        ## * "-lqt-mtnc{version}": the non-commercial Qt version that
        ##   comes on the CD with the book "C++ Gui Programming with Qt 3"
        ##   (version==321 there)

        ## FIXME: could probably improve check to not have to go through
        ## all of the above. See bug item #028 in SoQt/BUGS.txt.
        ## 20040805 mortene.

        sim_ac_qt_suffix=
        if $sim_ac_qt_debug; then
          sim_ac_qt_suffix=d
        fi

        # Note that we need to always check for -lqt-mt before -lqt, because
        # at least the most recent Debian platforms (as of 2003-02-20) comes
        # with a -lqt which is missing QGL support, while it also has a
        # -lqt-mt *with* QGL support. The reason for this is because the
        # default GL (Mesa) library on Debian is built in mt-safe mode,
        # so a non-mt-safe Qt can't use it.

        for sim_ac_qt_cppflags_loop in "" "-DQT_DLL"; do
          for sim_ac_qt_libcheck in \
              "-lQtGui${sim_ac_qt_suffix}${sim_ac_qt_major_version} -lQtCore${sim_ac_qt_suffix}${sim_ac_qt_major_version}" \
              "-lQtGui -lQtCore" \
              "-lQtGui${sim_ac_qt_suffix} -lQtCore${sim_ac_qt_suffix} -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32 -lwinspool -lwinmm -ladvapi32 -lws2_32 -lshell32" \
              "-lqt-gl" \
              "-lqt-mt" \
              "-lqt" \
              "-lqt-mt -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32 -lwinspool -lwinmm -ladvapi32 -lws2_32" \
              "-lqt-mt${sim_ac_qt_version}${sim_ac_qt_suffix} -lqtmain -lgdi32" \
              "-lqt-mt${sim_ac_qt_version}nc${sim_ac_qt_suffix} -lqtmain -lgdi32" \
              "-lqt-mtedu${sim_ac_qt_version}${sim_ac_qt_suffix} -lqtmain -lgdi32" \
              "-lqt -lqtmain -lgdi32" \
              "-lqt${sim_ac_qt_version}${sim_ac_qt_suffix} -lqtmain -lgdi32" \
              "-lqt -luser32 -lole32 -limm32 -lcomdlg32 -lgdi32" \
              "-lqt-mt-eval" \
              "-lqt-mteval${sim_ac_qt_version}" \
              "-lqt-mtnc${sim_ac_qt_version}"
          do
            if test "x$sim_ac_qt_libs" = "xUNRESOLVED"; then
              CPPFLAGS="$sim_ac_QTDIR_cppflags $sim_ac_qt_cppflags_loop $sim_ac_save_cppflags"
              LIBS="$sim_ac_qt_libcheck $sim_ac_save_libs"
              AC_TRY_LINK([#include <qapplication.h>],
                          [
                           // FIXME: assignment to qApp does no longer work with Qt 4,
                           // should try to find another way to do the same thing. 20050629 mortene.
                           #if QT_VERSION < 0x040000
                           qApp = NULL; /* QT_DLL must be defined for assignment to global variables to work */
                           #endif
                           qApp->exit(0);],
                          [sim_ac_qt_libs="$sim_ac_qt_libcheck"
                           sim_ac_qt_cppflags="$sim_ac_QTDIR_cppflags $sim_ac_qt_cppflags_loop"
                           sim_ac_qt_ldflags="$sim_ac_QTDIR_ldflags"
                          ])
            fi
          done
        done

        AC_MSG_RESULT($sim_ac_qt_cppflags $sim_ac_QTDIR_ldflags $sim_ac_qt_libs)
      fi

    fi # sim_ac_qglobal_unresolved = false

  fi # sim_cv_have_qt_framework

  # We should only *test* availability, not mutate the LIBS/CPPFLAGS
  # variables ourselves inside this macro. 20041021 larsa
  CPPFLAGS=$sim_ac_save_cppflags
  LDFLAGS=$sim_ac_save_ldflags
  LIBS=$sim_ac_save_libs
  if test ! x"$sim_ac_qt_libs" = xUNRESOLVED; then
    sim_ac_qt_avail=yes
    $1

    sim_ac_qt_install=`cd $sim_ac_qtdir; pwd`/bin/install
    AC_MSG_CHECKING([whether Qt's install tool shadows the system install])
    case $INSTALL in
    "${sim_ac_qt_install}"* )
      AC_MSG_RESULT(yes)
      echo "\$INSTALL is '$INSTALL', which matches '$QTDIR/bin/install*'." >&5
      echo "\$QTDIR part is '$QTDIR'." >&5
      SIM_AC_ERROR([qt-install])
      ;;
    * )
      AC_MSG_RESULT(no)
      ;;
    esac

  else
    if test -z "$QTDIR"; then
      AC_MSG_WARN([QTDIR environment variable not set -- this might be an indication of a problem])
    fi
    $2
  fi
fi
])

# Usage:
#  SIM_AC_CHECK_QGL([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the QGL widget for interfacing Qt with OpenGL. If it
#  is found, these shell variables are set:
#
#    $sim_ac_qgl_cppflags (extra flags the compiler needs for QGL lib)
#    $sim_ac_qgl_ldflags  (extra flags the linker needs for QGL lib)
#    $sim_ac_qgl_libs     (link libraries the linker needs for QGL lib)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_qgl_avail is set to "yes" if the QGL extension
#  library is found.
#
# Note that all "modern" variants of Qt should come with QGL embedded.
# There's one important deviation: Debian comes with a -lqt which is
# missing QGL support, while it also has a -lqt-mt *with* QGL support.
# The reason for this is because the default GL (Mesa) library on Debian
# is built in mt-safe mode.
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_CHECK_QGL], [

AC_REQUIRE([SIM_AC_WITH_QT])

sim_ac_qgl_avail=no
sim_ac_qgl_cppflags=
sim_ac_qgl_ldflags=
sim_ac_qgl_libs=

if $sim_ac_with_qt; then
  # first check if we can link with the QGL widget already
  AC_CACHE_CHECK(
    [whether the QGL widget is part of main Qt library],
    sim_cv_lib_qgl_integrated,
    [AC_TRY_LINK([#include <qgl.h>],
                 [QGLFormat * f = new QGLFormat; f->setDepth(true); ],
                 [sim_cv_lib_qgl_integrated=yes],
                 [sim_cv_lib_qgl_integrated=no])])

  if test x"$sim_cv_lib_qgl_integrated" = xyes; then
    sim_ac_qgl_avail=yes
    $1
  else
    sim_ac_save_LIBS=$LIBS
    LIBS="$sim_ac_qgl_libs $LIBS"

    AC_MSG_CHECKING([for the QGL extension library])

    sim_ac_qt_suffix=
    if $sim_ac_qt_debug; then
      sim_ac_qt_suffix=d
    fi

    sim_ac_qgl_libs=UNRESOLVED
    for sim_ac_qgl_libcheck in "-lQtOpenGL${sim_ac_qt_suffix}${sim_ac_qt_major_version}" "-lQtOpenGL${sim_ac_qt_suffix}" "-lqgl" "-lqgl -luser32"; do
      if test "x$sim_ac_qgl_libs" = "xUNRESOLVED"; then
        LIBS="$sim_ac_qgl_libcheck $sim_ac_save_LIBS"
        AC_TRY_LINK([#include <qgl.h>],
                    [QGLFormat * f = new QGLFormat; f->setDepth(true); ],
                    [sim_ac_qgl_libs="$sim_ac_qgl_libcheck"])
      fi
    done

    if test x"$sim_ac_qgl_libs" != xUNRESOLVED; then
      AC_MSG_RESULT($sim_ac_qgl_libs)
      sim_ac_qgl_avail=yes
      $1
    else
      AC_MSG_RESULT([unavailable])
      LIBS=$sim_ac_save_LIBS
      $2
    fi
  fi
fi
])

# SIM_AC_QGLWIDGET_SETAUTOBUFFERSWAP
# ----------------------------------
#
# Use the macro for its side-effect: it defines
#
#       HAVE_QGLWIDGET_SETAUTOBUFFERSWAP
#
# to 1 in config.h if QGLWidget::setAutoBufferSwap() is available.
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_QGLWIDGET_SETAUTOBUFFERSWAP], [
AC_CACHE_CHECK(
  [whether the QGLWidget::setAutoBufferSwap() is available],
  sim_cv_func_qglwidget_setautobufferswap,
  [AC_TRY_LINK([#include <qgl.h>
class MyGLWidget : public QGLWidget {
public: MyGLWidget() {setAutoBufferSwap(FALSE);} };],
               [MyGLWidget * w = new MyGLWidget;],
               [sim_cv_func_qglwidget_setautobufferswap=yes],
               [sim_cv_func_qglwidget_setautobufferswap=no])])

if test x"$sim_cv_func_qglwidget_setautobufferswap" = xyes; then
  AC_DEFINE([HAVE_QGLWIDGET_SETAUTOBUFFERSWAP], 1,
    [Define this to 1 if QGLWidget::setAutoBufferSwap() is available])
fi
])


# SIM_AC_QGLFORMAT_SETOVERLAY
# ---------------------------
#
# Use the macro for its side-effect: it defines
#
#       HAVE_QGLFORMAT_SETOVERLAY
#
# to 1 in config.h if QGLFormat::setOverlay() is available.
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_QGLFORMAT_SETOVERLAY], [
AC_CACHE_CHECK(
  [whether QGLFormat::setOverlay() is available],
  sim_cv_func_qglformat_setoverlay,
  [AC_TRY_LINK([#include <qgl.h>],
               [/* The basics: */
                QGLFormat f; f.setOverlay(TRUE);
                /* We've had a bug report about soqt.dll linking fail due
                   to missing the QGLWidget::overlayContext() symbol: */
                QGLWidget * w = NULL; (void)w->overlayContext();
               ],
               [sim_cv_func_qglformat_setoverlay=yes],
               [sim_cv_func_qglformat_setoverlay=no])])

if test x"$sim_cv_func_qglformat_setoverlay" = xyes; then
  AC_DEFINE([HAVE_QGLFORMAT_SETOVERLAY], 1,
    [Define this to 1 if QGLFormat::setOverlay() is available])
fi
])


# SIM_AC_QGLFORMAT_EQ_OP
# ----------------------
#
# Use the macro for its side-effect: it defines
#
#       HAVE_QGLFORMAT_EQ_OP
#
# to 1 in config.h if operator==(QGLFormat&, QGLFormat&) is available.
# (For Qt v2.2.2 at least, Troll Tech forgot to include this method
# in the publicly exported API for MSWindows DLLs.)
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_QGLFORMAT_EQ_OP], [
AC_CACHE_CHECK(
  [whether operator==(QGLFormat&,QGLFormat&) is available],
  sim_cv_func_qglformat_eq_op,
  [AC_TRY_LINK([#include <qgl.h>],
               [QGLFormat f; if (f == f) f.setDepth(true);],
               [sim_cv_func_qglformat_eq_op=true],
               [sim_cv_func_qglformat_eq_op=false])])

if $sim_cv_func_qglformat_eq_op; then
  AC_DEFINE([HAVE_QGLFORMAT_EQ_OP], 1,
    [Define this to 1 if operator==(QGLFormat&, QGLFormat&) is available])
fi
])


# SIM_AC_QWIDGET_SHOWFULLSCREEN
# -----------------------------
#
# Use the macro for its side-effect: it defines HAVE_QWIDGET_SHOWFULLSCREEN
# to 1 in config.h if QWidget::showFullScreen() is available (that
# function wasn't introduced in Qt until version 2.1.0).
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_QWIDGET_SHOWFULLSCREEN], [
AC_CACHE_CHECK(
  [whether QWidget::showFullScreen() is available],
  sim_cv_def_qwidget_showfullscreen,
  [AC_TRY_LINK([#include <qwidget.h>],
               [QWidget * w = new QWidget(); w->showFullScreen();],
               [sim_cv_def_qwidget_showfullscreen=true],
               [sim_cv_def_qwidget_showfullscreen=false])])

if $sim_cv_def_qwidget_showfullscreen; then
  AC_DEFINE([HAVE_QWIDGET_SHOWFULLSCREEN], 1,
            [Define this if QWidget::showFullScreen() is available])
fi
]) # SIM_AC_QWIDGET_SHOWFULLSCREEN

# SIM_AC_QAPPLICATION_HASPENDINGEVENTS
# -----------------------------
#
# Use the macro for its side-effect: it defines
# HAVE_QAPPLICATION_HASPENDINGEVENTS to 1 in config.h if
# QApplication::hasPendingEvents() is available (that
# function wasn't introduced in Qt until version 3.0).
#
# Author: Peder Blekken <pederb@sim.no>.

AC_DEFUN([SIM_AC_QAPPLICATION_HASPENDINGEVENTS], [
AC_CACHE_CHECK(
  [whether QApplication::hasPendingEvents() is available],
  sim_cv_def_qapplication_haspendingevents,
  [AC_TRY_LINK([#include <qapplication.h>],
               [int argc; char ** argv; QApplication app(argc, argv); (void) app.hasPendingEvents();],
               [sim_cv_def_qapplication_haspendingevents=true],
               [sim_cv_def_qapplication_haspendingevents=false])])

if $sim_cv_def_qapplication_haspendingevents; then
  AC_DEFINE([HAVE_QAPPLICATION_HASPENDINGEVENTS], 1,
            [Define this if QApplication::hasPendingEvents() is available])
fi
]) # SIM_AC_QAPPLICATION_HASPENDINGEVENTS


# SIM_AC_QT_KEYPAD_DEFINE
# -----------------------
#
# Use the macro for its side-effect: it defines HAVE_QT_KEYPAD_DEFINE
# to 1 in config.h if Qt::Keypad is available.
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_QT_KEYPAD_DEFINE], [
AC_CACHE_CHECK(
  [whether Qt::Keypad is defined],
  sim_cv_def_qt_keypad,
  [AC_TRY_LINK([#include <qkeycode.h>],
               [Qt::ButtonState s = Qt::Keypad;],
               [sim_cv_def_qt_keypad=true],
               [sim_cv_def_qt_keypad=false])])

if $sim_cv_def_qt_keypad; then
  AC_DEFINE([HAVE_QT_KEYPAD_DEFINE], 1,
            [Define this if Qt::Keypad is available])
fi
]) # SIM_AC_QT_KEYPAD_DEFINE


# SIM_AC_QWIDGET_HASSETWINDOWSTATE
# --------------------------------
# QWidget->setWindowState() was added around Qt 3.3

AC_DEFUN([SIM_AC_QWIDGET_HASSETWINDOWSTATE], [
AC_CACHE_CHECK(
  [whether QWidget::setWindowState() exists],
  sim_cv_exists_qwidget_setwindowstate,

  [AC_TRY_LINK([#include <qwidget.h>],
               [QWidget * w = NULL; w->setWindowState(0);],
               [sim_cv_exists_qwidget_setwindowstate=true],
               [sim_cv_exists_qwidget_setwindowstate=false])])

if $sim_cv_exists_qwidget_setwindowstate; then
  AC_DEFINE([HAVE_QWIDGET_SETWINDOWSTATE], 1,
            [Define this if QWidget::setWindowState() is available])
fi
]) # SIM_AC_QWIDGET_HASSETWINDOWSTATE



# SIM_AC_QLINEEDIT_HASSETINPUTMASK
# --------------------------------
# QLineEdit->setInputMask() was added around Qt 3.3

AC_DEFUN([SIM_AC_QLINEEDIT_HASSETINPUTMASK], [
AC_CACHE_CHECK(
  [whether QLineEdit::setInputMask() exists],
  sim_cv_exists_qlineedit_setinputmask,

  [AC_TRY_LINK([#include <qlineedit.h>],
               [QLineEdit * le = NULL; le->setInputMask(0);],
               [sim_cv_exists_qlineedit_setinputmask=true],
               [sim_cv_exists_qlineedit_setinputmask=false])])

if $sim_cv_exists_qlineedit_setinputmask; then
  AC_DEFINE([HAVE_QLINEEDIT_SETINPUTMASK], 1,
            [Define this if QLineEdit::setInputMask() is available])
fi
]) # SIM_AC_QLINEEDIT_HASSETINPUTMASK



# SIM_AC_HAVE_QT_FRAMEWORK
# ----------------------
#
# Determine whether Qt is installed as a Mac OS X framework.
#
# Uses the variable $sim_ac_qt_framework_dir which should either
# point to /Library/Frameworks or $QTDIR/lib.
#
# Sets sim_cv_have_qt_framework to true if Qt is installed as
# a framework, and to false otherwise.
#
# Author: Karin Kosina, <kyrah@sim.no>.

AC_DEFUN([SIM_AC_HAVE_QT_FRAMEWORK], [
case $host_os in
  darwin*)
    # First check if framework exists in the specified location, then
    # try to actually link against the framework. This precaution is
    # needed to catch the case where Qt-4 is installed in the default
    # location /Library/Frameworks, but the user wants to override it
    # by setting QTDIR to point to a non-framework install.
    if test -d $sim_ac_qt_framework_dir/QtCore.framework; then
      sim_ac_save_ldflags_fw=$LDFLAGS
      LDFLAGS="$LDFLAGS -F$sim_ac_qt_framework_dir -framework QtCore"
      AC_CACHE_CHECK(
        [whether Qt is installed as a framework],
        sim_cv_have_qt_framework,
        [AC_TRY_LINK([#include <QtCore/qglobal.h>],
                 [],
                 [sim_cv_have_qt_framework=true],
                 [sim_cv_have_qt_framework=false])
        ])
        LDFLAGS=$sim_ac_save_ldflags_fw
    else
      sim_cv_have_qt_framework=false
    fi
    ;;
  *)
    sim_cv_have_qt_framework=false
    ;;
esac
])


#
# SIM_AC_CHECK_SIMIAN_IFELSE( IF-SIMIAN, IF-NOT-SIMIAN )
#
# Sets $sim_ac_simian to true or false
#

AC_DEFUN([SIM_AC_CHECK_SIMIAN_IFELSE], [
AC_MSG_CHECKING([if user is simian])
case `hostname -d 2>/dev/null || domainname 2>/dev/null || hostname` in
*.sim.no | sim.no )
  sim_ac_simian=true
  ;;
* )
  if grep -ls "domain.*sim\\.no" /etc/resolv.conf >/dev/null; then
    sim_ac_simian=true
    :
  else
    sim_ac_simian=false
    :
  fi
  ;;
esac

if $sim_ac_simian; then
  AC_MSG_RESULT([probably])
  ifelse($1, [], :, $1)
else
  AC_MSG_RESULT([probably not])
  ifelse($2, [], :, $2)
fi])


# *******************************************************************
# SIM_AC_RELATIVE_SRC_DIR
#
# Sets $sim_ac_relative_src_dir to the relative path to the source
# directory, and $sim_ac_relative_src_dir_p to true or false depending
# on whether a relative path can be used or not (in case of different
# drives).
#
# Author:
#   Lars J. Aas <larsa@sim.no>


AC_DEFUN([SIM_AC_RELATIVE_SRC_DIR], [

temp_build_dir=`pwd`
temp_src_dir=`cd "$srcdir"; pwd`

temp_up=""
temp_down=""

while test "$temp_build_dir" != "$temp_src_dir"; do
  srclen=`echo "$temp_src_dir" | wc -c`
  buildlen=`echo "$temp_build_dir" | wc -c`
  if test $srclen -gt $buildlen; then
    # cut source tail, insert into temp_up
    temp_src_tail=`echo "$temp_src_dir" | sed -e 's,.*/,,g'`
    temp_src_dir=`echo "$temp_src_dir" | sed -e 's,/[[^/]]*\$,,g'`
    if test x"$temp_up" = "x"; then
      temp_up="$temp_src_tail"
    else
      temp_up="$temp_src_tail/$temp_up"
    fi
  else
    # cut build tail, increase temp_down
    temp_build_dir=`echo "$temp_build_dir" | sed -e 's,/[[^/]]*\$,,g'`
    if test x"$temp_down" = "x"; then
      temp_down=..
    else
      temp_down="../$temp_down"
    fi
  fi
done

if test x"$temp_down" = "x"; then
  if test x"$temp_up" = "x"; then
    sim_ac_relative_src_dir="."
  else
    sim_ac_relative_src_dir="$temp_up"
  fi
else
  if test x"$temp_up" = "x"; then
    sim_ac_relative_src_dir="$temp_down"
  else
    sim_ac_relative_src_dir="$temp_down/$temp_up"
  fi
fi

# this gives false positives on windows, but that's ok for now...
if test -f $sim_ac_relative_src_dir/$ac_unique_file; then
  sim_ac_relative_src_dir_p=true;
else
  sim_ac_relative_src_dir_p=false;
fi

AC_SUBST(ac_unique_file) # useful to have to check the relative path
AC_SUBST(sim_ac_relative_src_dir)
AC_SUBST(sim_ac_relative_src_dir_p)

]) # SIM_AC_RELATIVE_SRC_DIR


# **************************************************************************
# SIM_AC_SETUP_MSVC_IFELSE( IF-FOUND, IF-NOT-FOUND )
#
# This macro invokes IF-FOUND if the wrapmsvc wrapper can be run, and
# IF-NOT-FOUND if not.
#
# Authors:
#   Morten Eriksen <mortene@coin3d.org>
#   Lars J. Aas <larsa@coin3d.org>

# **************************************************************************

AC_DEFUN([SIM_AC_MSVC_DISABLE_OPTION], [
AC_ARG_ENABLE([msvc],
  [AC_HELP_STRING([--disable-msvc], [don't require MS Visual C++ on Cygwin])],
  [case $enableval in
  no | false) sim_ac_try_msvc=false ;;
  *)          sim_ac_try_msvc=true ;;
  esac],
  [sim_ac_try_msvc=true])
])

# **************************************************************************
# Usage:
#  SIM_AC_MSC_VERSION
#
# Find version number of the Visual C++ compiler. sim_ac_msc_version will
# contain the full version number string, and sim_ac_msc_major_version
# will contain only the Visual C++ major version number and
# sim_ac_msc_minor_version will contain the minor version number.

AC_DEFUN([SIM_AC_MSC_VERSION], [

AC_MSG_CHECKING([version of Visual C++ compiler])

cat > conftest.c << EOF
int VerMSC = _MSC_VER;
EOF

# The " *"-parts of the last sed-expression on the next line are necessary
# because at least the Solaris/CC preprocessor adds extra spaces before and
# after the trailing semicolon.
sim_ac_msc_version=`$CXXCPP $CPPFLAGS conftest.c 2>/dev/null | grep '^int VerMSC' | sed 's%^int VerMSC = %%' | sed 's% *;.*$%%'`

sim_ac_msc_minor_version=0
if test $sim_ac_msc_version -ge 1500; then
  sim_ac_msc_major_version=9
elif test $sim_ac_msc_version -ge 1400; then
  sim_ac_msc_major_version=8
elif test $sim_ac_msc_version -ge 1300; then
  sim_ac_msc_major_version=7
  if test $sim_ac_msc_version -ge 1310; then
    sim_ac_msc_minor_version=1
  fi
elif test $sim_ac_msc_version -ge 1200; then
  sim_ac_msc_major_version=6
elif test $sim_ac_msc_version -ge 1100; then
  sim_ac_msc_major_version=5
else
  sim_ac_msc_major_version=0
fi

# compatibility with old version of macro
sim_ac_msvc_version=$sim_ac_msc_major_version

rm -f conftest.c
AC_MSG_RESULT($sim_ac_msc_major_version.$sim_ac_msc_minor_version)
]) # SIM_AC_MSC_VERSION

# **************************************************************************
# Note: the SIM_AC_SETUP_MSVC_IFELSE macro has been OBSOLETED and
# replaced by the one below.
#
# If the Microsoft Visual C++ cl.exe compiler is available, set us up for
# compiling with it and to generate an MSWindows .dll file.

AC_DEFUN([SIM_AC_SETUP_MSVCPP_IFELSE],
[
AC_REQUIRE([SIM_AC_MSVC_DISABLE_OPTION])
AC_REQUIRE([SIM_AC_SPACE_IN_PATHS])

: ${BUILD_WITH_MSVC=false}
if $sim_ac_try_msvc; then
  if test -z "$CC" -a -z "$CXX"; then
    AC_MSG_CHECKING([setup for wrapmsvc.exe])
    case $host in
      *-cygwin)
        valid_system=true
        ;;
      * )
        valid_system=false
        ;;
    esac
    if $valid_system; then
      sim_ac_wrapmsvc=`cd $ac_aux_dir; pwd`/wrapmsvc.exe
      echo "$as_me:$LINENO: sim_ac_wrapmsvc=$sim_ac_wrapmsvc" >&AS_MESSAGE_LOG_FD
      if $sim_ac_wrapmsvc >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
        m4_ifdef([$0_VISITED],
          [AC_FATAL([Macro $0 invoked multiple times])])
        m4_define([$0_VISITED], 1)
        CC=$sim_ac_wrapmsvc
        CXX=$sim_ac_wrapmsvc
        export CC CXX
        BUILD_WITH_MSVC=true
        AC_MSG_RESULT([working])

        # Robustness: we had multiple reports of Cygwin ''link'' getting in
        # the way of MSVC link.exe, so do a little sanity check for that.
        #
        # FIXME: a better fix would be to call link.exe with full path from
        # the wrapmsvc wrapper, to avoid any trouble with this -- I believe
        # that should be possible, using the dirname of the full cl.exe path.
        # 20050714 mortene.
        sim_ac_check_link=`type link`
        AC_MSG_CHECKING([whether Cygwin's /usr/bin/link shadows MSVC link.exe])
        case x"$sim_ac_check_link" in
        x"link is /usr/bin/link"* )
          AC_MSG_RESULT(yes)
          SIM_AC_ERROR([cygwin-link])
          ;;
        * )
          AC_MSG_RESULT(no)
          ;;
        esac

      else
        AC_MSG_RESULT([not working])
        SIM_AC_ERROR([no-msvc++])
      fi
    else
      AC_MSG_RESULT([not a cygwin host])
    fi
  fi
fi
export BUILD_WITH_MSVC
AC_SUBST(BUILD_WITH_MSVC)

if $BUILD_WITH_MSVC; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_SETUP_MSVC_IFELSE

# **************************************************************************
# SIM_AC_SETUP_MSVCRT
#
# This macro sets up compiler flags for the MS Visual C++ C library of
# choice.

AC_DEFUN([SIM_AC_SETUP_MSVCRT],
[sim_ac_msvcrt_LDFLAGS=""
sim_ac_msvcrt_LIBS=""

AC_ARG_WITH([msvcrt],
  [AC_HELP_STRING([--with-msvcrt=<crt>],
                  [set which C run-time library to build against])],
  [case `echo "$withval" | tr "[A-Z]" "[a-z]"` in
  default | singlethread-static | ml | /ml | libc | libc\.lib )
    sim_ac_msvcrt=singlethread-static
    sim_ac_msvcrt_CFLAGS="/ML"
    sim_ac_msvcrt_CXXFLAGS="/ML"
    ;;
  default-debug | singlethread-static-debug | mld | /mld | libcd | libcd\.lib )
    sim_ac_msvcrt=singlethread-static-debug
    sim_ac_msvcrt_CFLAGS="/MLd"
    sim_ac_msvcrt_CXXFLAGS="/MLd"
    ;;
  multithread-static | mt | /mt | libcmt | libcmt\.lib )
    sim_ac_msvcrt=multithread-static
    sim_ac_msvcrt_CFLAGS="/MT"
    sim_ac_msvcrt_CXXFLAGS="/MT"
    ;;
  multithread-static-debug | mtd | /mtd | libcmtd | libcmtd\.lib )
    sim_ac_msvcrt=multithread-static-debug
    sim_ac_msvcrt_CFLAGS="/MTd"
    sim_ac_msvcrt_CXXFLAGS="/MTd"
    ;;
  multithread-dynamic | md | /md | msvcrt | msvcrt\.lib )
    sim_ac_msvcrt=multithread-dynamic
    sim_ac_msvcrt_CFLAGS="/MD"
    sim_ac_msvcrt_CXXFLAGS="/MD"
    ;;
  multithread-dynamic-debug | mdd | /mdd | msvcrtd | msvcrtd\.lib )
    sim_ac_msvcrt=multithread-dynamic-debug
    sim_ac_msvcrt_CFLAGS="/MDd"
    sim_ac_msvcrt_CXXFLAGS="/MDd"
    ;;
  *)
    SIM_AC_ERROR([invalid-msvcrt])
    ;;
  esac],
  [sim_ac_msvcrt=singlethread-static])

AC_MSG_CHECKING([MSVC++ C library choice])
AC_MSG_RESULT([$sim_ac_msvcrt])

$1
]) # SIM_AC_SETUP_MSVCRT

# **************************************************************************
# SIM_AC_SPACE_IN_PATHS

AC_DEFUN([SIM_AC_SPACE_IN_PATHS], [
sim_ac_full_builddir=`pwd`
sim_ac_full_srcdir=`cd $srcdir; pwd`
if test -z "`echo $sim_ac_full_srcdir | tr -cd ' '`"; then :; else
  AC_MSG_WARN([Detected space character in the path leading up to the Coin source directory - this will probably cause random problems later. You are advised to move the Coin source directory to another location.])
  SIM_AC_CONFIGURATION_WARNING([Detected space character in the path leading up to the Coin source directory - this will probably cause random problems later. You are advised to move the Coin source directory to another location.])
fi
if test -z "`echo $sim_ac_full_builddir | tr -cd ' '`"; then :; else
  AC_MSG_WARN([Detected space character in the path leading up to the Coin build directory - this will probably cause random problems later. You are advised to move the Coin build directory to another location.])
  SIM_AC_CONFIGURATION_WARNING([Detected space character in the path leading up to the Coin build directory - this will probably cause random problems later. You are advised to move the Coin build directory to another location.])
fi
]) # SIM_AC_SPACE_IN_PATHS

# EOF **********************************************************************

# Usage:
#  SIM_AC_CHECK_X11([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the X11 development system. If it is found, these
#  shell variables are set:
#
#    $sim_ac_x11_cppflags (extra flags the compiler needs for X11)
#    $sim_ac_x11_ldflags  (extra flags the linker needs for X11)
#    $sim_ac_x11_libs     (link libraries the linker needs for X11)
#
#  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
#  In addition, the variable $sim_ac_x11_avail is set to "yes" if
#  the X11 development system is found.
#
#
# Author: Morten Eriksen, <mortene@sim.no>.

AC_DEFUN([SIM_AC_CHECK_X11], [
AC_REQUIRE([AC_PATH_XTRA])

sim_ac_enable_darwin_x11=false

case $host_os in
  darwin* )
    AC_ARG_ENABLE([darwin-x11],
      AC_HELP_STRING([--enable-darwin-x11],
                     [enable X11 on Darwin [[default=--disable-darwin-x11]]]),
      [case "${enableval}" in
        yes | true) sim_ac_enable_darwin_x11=true ;;
        no | false) sim_ac_enable_darwin_x11=false; no_x=yes ;;
        *) SIM_AC_ENABLE_ERROR([--enable-darwin-x11]) ;;
      esac],
      [sim_ac_enable_darwin_x11=false; no_x=yes])
  ;;
esac

sim_ac_x11_avail=no

if test x"$no_x" != xyes; then

  #  *** DEBUG ***
  #  Keep this around, as it can be handy when testing on new systems.
  # echo "X_CFLAGS: $X_CFLAGS"
  # echo "X_PRE_LIBS: $X_PRE_LIBS"
  # echo "X_LIBS: $X_LIBS"
  # echo "X_EXTRA_LIBS: $X_EXTRA_LIBS"
  # echo
  # exit 0

  sim_ac_x11_cppflags="$X_CFLAGS"
  sim_ac_x11_ldflags="$X_LIBS"
  sim_ac_x11_libs="$X_PRE_LIBS -lX11 $X_EXTRA_LIBS"

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_x11_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_x11_ldflags"
  LIBS="$sim_ac_x11_libs $LIBS"

  AC_CACHE_CHECK(
    [whether we can link against X11],
    sim_cv_lib_x11_avail,
    [AC_TRY_LINK([#include <X11/Xlib.h>],
                 [(void)XOpenDisplay(0L);],
                 [sim_cv_lib_x11_avail=yes],
                 [sim_cv_lib_x11_avail=no])])

  if test x"$sim_cv_lib_x11_avail" = x"yes"; then
    sim_ac_x11_avail=yes
    $1
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    $2
  fi
fi
])

# Usage:
#  SIM_AC_CHECK_X11SHMEM([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the X11 shared memory extension. If it is found, this
#  shell variable is set:
#
#    $sim_ac_x11shmem_libs   (link libraries the linker needs for X11 Shm)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_x11shmem_avail is set to "yes" if the X11 shared
#  memory extension is found.
#
#
# Author: Morten Eriksen, <mortene@sim.no>.
#
# TODO:
#    * [mortene:20000122] make sure this work on MSWin (with
#      Cygwin installation)
#

AC_DEFUN([SIM_AC_CHECK_X11SHMEM], [

sim_ac_x11shmem_avail=no
sim_ac_x11shmem_libs="-lXext"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_x11shmem_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 shared memory extension is available],
  sim_cv_lib_x11shmem_avail,
  [AC_TRY_LINK([#include <X11/Xlib.h>
               #include <X11/extensions/XShm.h>],
               [(void)XShmQueryVersion(0L, 0L, 0L, 0L);],
               [sim_cv_lib_x11shmem_avail=yes],
               [sim_cv_lib_x11shmem_avail=no])])

if test x"$sim_cv_lib_x11shmem_avail" = xyes; then
  sim_ac_x11shmem_avail=yes
  $1
else
  LIBS=$sim_ac_save_libs
  $2
fi
])

# Usage:
#  SIM_AC_CHECK_X11MU([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the X11 miscellaneous utilities extension. If it is
#  found, this shell variable is set:
#
#    $sim_ac_x11mu_libs   (link libraries the linker needs for X11 MU)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_x11mu_avail is set to "yes" if the X11 miscellaneous
#  utilities extension is found.
#  CPPFLAGS and LDFLAGS might also be modified, if library is found in a
#  non-standard location.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#
# TODO:
#    * [mortene:20000122] make sure this work on MSWin (with
#      Cygwin installation)

AC_DEFUN([SIM_AC_CHECK_X11MU], [

sim_ac_x11mu_avail=no
sim_ac_x11mu_cppflags=""
sim_ac_x11mu_ldflags=""
sim_ac_x11mu_libs="-lXmu"

sim_ac_save_libs=$LIBS
sim_ac_save_cppflags=$CPPFLAGS
sim_ac_save_ldflags=$LDFLAGS

LIBS="$sim_ac_x11mu_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 miscellaneous utilities library is available],
  sim_cv_lib_x11mu_avail,
  [AC_TRY_LINK([#include <X11/Xlib.h>
                #include <X11/Xmu/Xmu.h>
                #include <X11/Xmu/StdCmap.h>],
               [(void)XmuAllStandardColormaps(0L);],
               [sim_cv_lib_x11mu_avail=yes],
               [sim_cv_lib_x11mu_avail=maybe])])

if test x"$sim_cv_lib_x11mu_avail" = xyes; then
  sim_ac_x11mu_avail=yes
else
  # On HP-UX, Xmu might be located under /usr/contrib/X11R6/
  mudir=/usr/contrib/X11R6
  if test -d $mudir; then
    sim_ac_x11mu_cppflags="-I$mudir/include"
    sim_ac_x11mu_ldflags="-L$mudir/lib"
    CPPFLAGS="$sim_ac_x11mu_cppflags $CPPFLAGS"
    LDFLAGS="$sim_ac_x11mu_ldflags $LDFLAGS"

    AC_CACHE_CHECK(
      [once more whether the X11 miscellaneous utilities library is available],
      sim_cv_lib_x11mu_contrib_avail,
      [AC_TRY_LINK([#include <X11/Xlib.h>
                    #include <X11/Xmu/Xmu.h>
                    #include <X11/Xmu/StdCmap.h>],
                   [(void)XmuAllStandardColormaps(0L);],
                   [sim_cv_lib_x11mu_contrib_avail=yes],
                   [sim_cv_lib_x11mu_contrib_avail=no])])
    if test x"$sim_cv_lib_x11mu_contrib_avail" = xyes; then
      sim_ac_x11mu_avail=yes
    else
      sim_ac_x11mu_cppflags=""
      sim_ac_x11mu_ldflags=""
    fi
  fi
fi

if test x"$sim_ac_x11mu_avail" = xyes; then
  :
  $1
else
  LIBS=$sim_ac_save_libs
  CPPFLAGS=$sim_ac_save_cppflags
  LDFLAGS=$sim_ac_save_ldflags
  $2
fi
])

# Usage:
#  SIM_AC_CHECK_X11XID([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the X11 extension device library. Sets this
#  shell variable:
#
#    $sim_ac_x11xid_libs   (link libraries the linker needs for X11 XID)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_x11xid_avail is set to "yes" if the X11 extension
#  device library is found.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#
# TODO:
#    * [mortene:20000122] make sure this work on MSWin (with
#      Cygwin installation)
#

AC_DEFUN([SIM_AC_CHECK_X11XID], [

sim_ac_x11xid_avail=no
sim_ac_x11xid_libs="-lXi"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_x11xid_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 extension device library is available],
  sim_cv_lib_x11xid_avail,
  [AC_TRY_LINK([#include <X11/extensions/XInput.h>],
               [(void)XOpenDevice(0L, 0);],
               [sim_cv_lib_x11xid_avail=yes],
               [sim_cv_lib_x11xid_avail=no])])

if test x"$sim_cv_lib_x11xid_avail" = x"yes"; then
  sim_ac_x11xid_avail=yes
  $1
else
  LIBS=$sim_ac_save_libs
  $2
fi
])

# Usage:
#  SIM_AC_CHECK_X_INTRINSIC([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the Xt intrinsic library. Sets this shell variable:
#
#    $sim_ac_xt_libs   (link library the linker needs for X Intrinsic)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_xt_avail is set to "yes" if the X11 Intrinsic
#  library is found.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#

AC_DEFUN([SIM_AC_CHECK_X_INTRINSIC], [

sim_ac_xt_avail=no
sim_ac_xt_libs="-lXt"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_xt_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 Intrinsic library is available],
  sim_cv_lib_xt_avail,
  [AC_TRY_LINK([#include <X11/Intrinsic.h>],
               [(void)XtVaCreateWidget("", 0L, 0L);],
               [sim_cv_lib_xt_avail=yes],
               [sim_cv_lib_xt_avail=no])])

if test x"$sim_cv_lib_xt_avail" = xyes; then
  sim_ac_xt_avail=yes
  $1
else
  LIBS=$sim_ac_save_libs
  $2
fi
])

# Usage:
#   SIM_AC_CHECK_LIBXPM( [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND] )
#
# Description:
#   This macro checks for libXpm.
#
# Variables:
#   $sim_ac_xpm_avail      yes | no
#   $sim_ac_xpm_libs       [link-line libraries]
#
# Authors:
#   Lars J. Aas <larsa@sim.no>
#

AC_DEFUN([SIM_AC_CHECK_LIBXPM], [

sim_ac_xpm_avail=no
sim_ac_xpm_libs="-lXpm"

AC_CACHE_CHECK(
  [whether libXpm is available],
  sim_cv_lib_xpm_avail,
  [sim_ac_save_libs=$LIBS
  LIBS="$sim_ac_xpm_libs $LIBS"
  AC_TRY_LINK([#include <X11/xpm.h>],
              [(void)XpmLibraryVersion();],
              [sim_cv_lib_xpm_avail=yes],
              [sim_cv_lib_xpm_avail=no])
  LIBS="$sim_ac_save_libs"])

if test x"$sim_cv_lib_xpm_avail" = x"yes"; then
  sim_ac_xpm_avail=yes
  LIBS="$sim_ac_xpm_libs $LIBS"
  $1
else
  ifelse([$2], , :, [$2])
fi
])


# Usage:
#  SIM_AC_CHECK_X11_XP([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
#
#  Try to find the Xp library for printing functionality. Sets this
#  shell variable:
#
#    $sim_ac_xp_libs   (link library the linker needs for the Xp library)
#
#  The LIBS flag will also be modified accordingly. In addition, the
#  variable $sim_ac_xp_avail is set to "yes" if the Xp library is found.
#
# Author: Morten Eriksen, <mortene@sim.no>.
#

AC_DEFUN([SIM_AC_CHECK_X11_XP], [
sim_ac_xp_avail=no
sim_ac_xp_libs="-lXp"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_xp_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 printing library is available],
  sim_cv_lib_xp_avail,
  [AC_TRY_LINK([#include <X11/extensions/Print.h>],
               [XpEndJob(0L);],
               [sim_cv_lib_xp_avail=yes],
               [sim_cv_lib_xp_avail=no])])

if test x"$sim_cv_lib_xp_avail" = xyes; then
  sim_ac_xp_avail=yes
  $1
else
  LIBS=$sim_ac_save_libs
  $2
fi
])

# SIM_AC_CHECK_X11_ATHENA( [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND] )

AC_DEFUN([SIM_AC_CHECK_X11_ATHENA], [
sim_ac_athena_avail=no
sim_ac_athena_libs="-lXaw"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_athena_libs $LIBS"

AC_CACHE_CHECK(
  [whether the X11 Athena widgets library is available],
  sim_cv_lib_athena_avail,
  [AC_TRY_LINK([#include <X11/Xfuncproto.h>
                #include <X11/Xaw/XawInit.h>],
               [XawInitializeWidgetSet();],
               [sim_cv_lib_athena_avail=yes],
               [sim_cv_lib_athena_avail=no])])

if test x"$sim_cv_lib_athena_avail" = xyes; then
  sim_ac_athena_avail=yes
  $1
else
  LIBS=$sim_ac_save_libs
  $2
fi
])

# SIM_AC_X11_READY( [ACTION-IF-TRUE], [ACTION-IF-FALSE] )

AC_DEFUN([SIM_AC_CHECK_X11_READY],
[AC_CACHE_CHECK(
  [if X11 linkage is ready],
  [sim_cv_x11_ready],
  [AC_TRY_LINK(
    [#include <X11/Xlib.h>],
    [(void)XOpenDisplay(0L);],
    [sim_cv_x11_ready=true],
    [sim_cv_x11_ready=false])])
if ${sim_cv_x11_ready}; then
  ifelse([$1], , :, [$1])
else
  ifelse([$2], , :, [$2])
fi
]) # SIM_AC_X11_READY()

