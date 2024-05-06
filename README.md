Coin3D Quarter 
==============

Introduction
------------
Quarter is a light-weight glue library that provides seamless
integration between Systems in Motions's Coin high-level 3D
visualization library and Trolltech's Qt 2D user interface library.

Qt and Coin is a perfect match since they are both open source, widely
portable and easy to use. Quarter has evolved from Systems in Motion's
own experiences using Coin and Qt together in our applications.

The functionality in Quarter revolves around QuarterWidget, a subclass
of QGLWidget. This widget provides functionality for rendering of Coin
scenegraphs and translation of QEvents into SoEvents. Using this
widget is as easy as using any other QWidget.

How to install
--------------

See the file INSTALL for installation instructions, and the README.*
files for platform-specific notes.

How to use
----------
See Doxygen documentation: https://coin3d.github.io/quarter/

Release history
---------------

Quarter 1.0.0 (2009-01-26):
- first proper release.
- is only usable with Coin-3.x and Qt-4.x

Quarter 1.1.0 (2019-12-25):
* new:
  - Kongsberg Oil & Gas Technologies AS ended SoWin as a commercial product
    and re-licensed it under the BSD 3-clause license as a service to the
    user community.
  - The build system has been migrated from GNU Autotools to CMake
  - Added support for Qt5
  - Added support for high DPI displays in Qt5
  - New 3DConnexion Space Navigator support using the Spacenav opensource library
  - Support for BitBucket and AppVeyor as continuous integration service providers

* bugfixes:
  - Always reinitialize SoRenderManager when GL context is (re-)initialized
  - Avoid unnecessary redraws when moving window around. Fixes COIN-173
  - Handle double click events
  - Buffer went out of scope, while a reference was still held

