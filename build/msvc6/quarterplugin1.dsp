# Microsoft Developer Studio Project File - Name="quarterplugin1" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=quarterplugin1 - Win32 DLL (Release)
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "quarterplugin1.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "quarterplugin1.mak" CFG="quarterplugin1 - Win32 DLL (Debug)"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "quarterplugin1 - Win32 LIB (Release)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarterplugin1 - Win32 LIB (Debug)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarterplugin1 - Win32 DLL (Release)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "quarterplugin1 - Win32 DLL (Debug)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "quarterplugin1 - Win32 LIB (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "StaticRelease"
# PROP BASE Intermediate_Dir "StaticRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "StaticRelease"
# PROP Intermediate_Dir "StaticRelease"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=0  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=0  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "NDEBUG"
# ADD RSC /l 0x414 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarterplugin1s.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarterplugin1s.lib"

!ELSEIF  "$(CFG)" == "quarterplugin1 - Win32 LIB (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "StaticDebug"
# PROP BASE Intermediate_Dir "StaticDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "StaticDebug"
# PROP Intermediate_Dir "StaticDebug"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /Od /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=1  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /Od /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=1  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "_DEBUG"
# ADD RSC /l 0x414 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarterplugin1sd.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarterplugin1sd.lib"

!ELSEIF  "$(CFG)" == "quarterplugin1 - Win32 DLL (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=0 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=0 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
RCS=rc.exe
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /machine:I386
# ADD LINK32 $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /machine:I386 /out:"quarterplugin1.dll" /opt:nowin98
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "quarterplugin1 - Win32 DLL (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=1 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "src" /I "data" /I "..\..\src" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=1 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /GZ /c
MTL=midl.exe
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
RCS=rc.exe
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 $(QTDIR)\lib\QtOpenGLd4.lib $(QTDIR)\lib\QtGuid4.lib $(QTDIR)\lib\QtCored4.lib $(COINDIR)\lib\coin3d.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 $(QTDIR)\lib\QtOpenGLd4.lib $(QTDIR)\lib\QtGuid4.lib $(QTDIR)\lib\QtCored4.lib $(COINDIR)\lib\coin3d.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /out:"quarterplugin1d.dll"

!ENDIF

# Begin Target

# Name "quarterplugin1 - Win32 DLL (Release)"
# Name "quarterplugin1 - Win32 DLL (Debug)"
# Name "quarterplugin1 - Win32 LIB (Release)"
# Name "quarterplugin1 - Win32 LIB (Debug)"
# Begin Group "Documents"
# PROP Default_Filter ";txt"
# Begin Source File

SOURCE=..\..\README
# End Source File
# Begin Source File

SOURCE=..\..\README.WIN32
# End Source File
# Begin Source File

SOURCE=..\..\NEWS
# End Source File
# Begin Source File

SOURCE=..\..\COPYING
# End Source File
# Begin Source File

SOURCE=..\..\ChangeLog
# End Source File
# Begin Source File

SOURCE=..\..\AUTHORS
# End Source File
# End Group
# Begin Group "Source Files"
# End Group
# Begin Group "Public Headers"
# End Group
# End Target
# End Project
