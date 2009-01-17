#ifndef QUARTER_BASIC_H
#define QUARTER_BASIC_H

/**************************************************************************\
 *
 *  This file is part of the SIM Quarter extension library for Coin.
 *  Copyright (C) 1998-2009 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License ("GPL") version 2
 *  as published by the Free Software Foundation.  See the file COPYING
 *  at the root directory of this source distribution for additional
 *  information about the GNU GPL.
 *
 *  For using SIM Quarter with software that can not be combined with
 *  the GNU GPL, and for taking advantage of the additional benefits of
 *  our support services, please contact Systems in Motion about acquiring
 *  a Coin Professional Edition License.
 *
 *  See <URL:http://www.coin3d.org/> for more information.
 *
 *  Systems in Motion AS, Bygdøy allé 5, N-0257 Oslo, NORWAY. (www.sim.no)
 *
\**************************************************************************/

/*
  See Coin's Inventor/C/basic.h for an explanation to the below #define
  setup.
*/

#ifdef QUARTER_DLL_API
#error Leave the QUARTER_DLL_API define alone
#endif // QUARTER_MAKE_DLL

#ifdef QUARTER_INTERNAL
# ifdef QUARTER_NOT_DLL
#  error The QUARTER_DLL define should not be used when building the library - only when building win32 applications.
# endif // QUARTER_NOT_DLL
# ifdef QUARTER_DLL
#  error The QUARTER_NOT_DLL define should not be used when building the library - only when building win32 applications.
# endif // QUARTER_DLL
#endif // QUARTER_INTERNAL

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
# ifdef QUARTER_INTERNAL
#  ifdef QUARTER_MAKE_DLL
#   define QUARTER_DLL_API __declspec(dllexport)
#  endif // QUARTER_MAKE_DLL
# else // !QUARTER_INTERNAL
#  ifdef QUARTER_DLL
#   ifdef QUARTER_NOT_DLL
#    error Define _either_ QUARTER_DLL or QUARTER_NOT_DLL as appropriate for your linkage -- not both at the same time! See the Coin Inventor/C/basic.h for further instructions.
#   endif // QUARTER_NOT_DLL
#   define QUARTER_DLL_API __declspec(dllimport)
#  else // !QUARTER_DLL
#   ifndef QUARTER_NOT_DLL
#    error Define either QUARTER_DLL or QUARTER_NOT_DLL as appropriate for your linkage. See the Coin Inventor/C/basic.h for further instructions.
#   endif // !QUARTER_NOT_DLL
#  endif // !QUARTER_DLL
# endif // !QUARTER_INTERNAL
#endif // Microsoft Windows

#ifndef QUARTER_DLL_API
# define QUARTER_DLL_API
#endif // !QUARTER_DLL_API

#endif // !QUARTER_BASIC_H
