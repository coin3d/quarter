# Microsoft Developer Studio Project File - Name="quarter1" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=quarter1 - Win32 DLL (Release)
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "quarter1.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "quarter1.mak" CFG="quarter1 - Win32 DLL (Debug)"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "quarter1 - Win32 LIB (Release)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarter1 - Win32 LIB (Debug)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarter1 - Win32 DLL (Release)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "quarter1 - Win32 DLL (Debug)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "QuarterStaticRelease"
# PROP BASE Intermediate_Dir "QuarterStaticRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "QuarterStaticRelease"
# PROP Intermediate_Dir "QuarterStaticRelease"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=0  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GR /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=0  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "NDEBUG"
# ADD RSC /l 0x414 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarter1s.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarter1s.lib"

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "QuarterStaticDebug"
# PROP BASE Intermediate_Dir "QuarterStaticDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "QuarterStaticDebug"
# PROP Intermediate_Dir "QuarterStaticDebug"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=1  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GR /GX /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D QUARTER_DEBUG=1  /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_INTERNAL" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "_DEBUG"
# ADD RSC /l 0x414 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarter1sd.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarter1sd.lib"

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "QuarterRelease"
# PROP BASE Intermediate_Dir "QuarterRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "QuarterRelease"
# PROP Intermediate_Dir "QuarterRelease"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=0 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GR /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=0 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /Gs /c
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
# ADD BASE LINK32 $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /release /machine:I386
# ADD LINK32 $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /release /machine:I386 /out:"quarter1.dll" /opt:nowin98
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "QuarterDebug"
# PROP BASE Intermediate_Dir "QuarterDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "QuarterDebug"
# PROP Intermediate_Dir "QuarterDebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GR /GX /ZI /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=1 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GR /GX /ZI /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D QUARTER_DEBUG=1 /D "HAVE_CONFIG_H" /D "QUARTER_MAKE_DLL" /D "COIN_DLL" /D "QUARTER_INTERNAL" /YX /FD /GZ /c
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
# ADD LINK32 $(QTDIR)\lib\QtOpenGLd4.lib $(QTDIR)\lib\QtGuid4.lib $(QTDIR)\lib\QtCored4.lib $(COINDIR)\lib\coin3d.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /out:"quarter1d.dll"

!ENDIF

# Begin Target

# Name "quarter1 - Win32 DLL (Release)"
# Name "quarter1 - Win32 DLL (Debug)"
# Name "quarter1 - Win32 LIB (Release)"
# Name "quarter1 - Win32 LIB (Debug)"
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
# PROP Default_Filter "c;cpp;ic;icc;h"
# Begin Source File

SOURCE=..\..\src\Quarter\ContextMenu.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\ContextMenu.h

"src\Quarter\moc_ContextMenu.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_ContextMenu.cpp ..\..\src\Quarter\ContextMenu.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\ContextMenu.h

"src\Quarter\moc_ContextMenu.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_ContextMenu.cpp ..\..\src\Quarter\ContextMenu.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\ContextMenu.h

"src\Quarter\moc_ContextMenu.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_ContextMenu.cpp ..\..\src\Quarter\ContextMenu.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\ContextMenu.h

"src\Quarter\moc_ContextMenu.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_ContextMenu.cpp ..\..\src\Quarter\ContextMenu.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\SensorManager.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SensorManager.h

"src\Quarter\moc_SensorManager.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SensorManager.cpp ..\..\src\Quarter\SensorManager.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SensorManager.h

"src\Quarter\moc_SensorManager.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SensorManager.cpp ..\..\src\Quarter\SensorManager.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SensorManager.h

"src\Quarter\moc_SensorManager.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SensorManager.cpp ..\..\src\Quarter\SensorManager.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SensorManager.h

"src\Quarter\moc_SensorManager.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SensorManager.cpp ..\..\src\Quarter\SensorManager.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\SignalThread.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SignalThread.h

"src\Quarter\moc_SignalThread.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SignalThread.cpp ..\..\src\Quarter\SignalThread.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SignalThread.h

"src\Quarter\moc_SignalThread.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SignalThread.cpp ..\..\src\Quarter\SignalThread.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SignalThread.h

"src\Quarter\moc_SignalThread.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SignalThread.cpp ..\..\src\Quarter\SignalThread.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\SignalThread.h

"src\Quarter\moc_SignalThread.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_SignalThread.cpp ..\..\src\Quarter\SignalThread.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_ContextMenu.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\ContextMenu.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_QuarterWidget.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QuarterWidget.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_SensorManager.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_EventFilter.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_DragDropHandler.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_FocusHandler.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\SensorManager.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_SignalThread.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\SignalThread.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\ImageReader.h
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\ImageReader.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QtCoinCompatibility.h
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QtCoinCompatibility.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=src\Quarter\moc_InteractionMode.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\InteractionMode.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\InteractionMode.h

"src\Quarter\moc_InteractionMode.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_InteractionMode.cpp ..\..\src\Quarter\InteractionMode.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\InteractionMode.h

"src\Quarter\moc_InteractionMode.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_InteractionMode.cpp ..\..\src\Quarter\InteractionMode.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\InteractionMode.h

"src\Quarter\moc_InteractionMode.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_InteractionMode.cpp ..\..\src\Quarter\InteractionMode.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\Quarter\InteractionMode.h

"src\Quarter\moc_InteractionMode.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_InteractionMode.cpp ..\..\src\Quarter\InteractionMode.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\InteractionMode.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\Quarter.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QuarterP.h
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QuarterP.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QuarterWidgetP.h
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\QuarterWidgetP.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\InputDevice.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\Keyboard.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\KeyboardP.h
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\KeyboardP.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\Mouse.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\SpaceNavigatorDevice.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\EventFilter.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\DragDropHandler.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\Quarter\FocusHandler.cpp
!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "QuarterRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "QuarterDebug"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "QuarterStaticRelease"
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "QuarterStaticDebug"
!ENDIF
# End Source File
# End Group
# Begin Group "Public Headers"
# Set Default_Filter "h"
# Begin Source File

SOURCE=..\..\include\Quarter\Basic.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\Quarter.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\QuarterWidget.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\QuarterWidget.h

"src\Quarter\moc_QuarterWidget.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_QuarterWidget.cpp ..\..\include\Quarter\QuarterWidget.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\QuarterWidget.h

"src\Quarter\moc_QuarterWidget.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_QuarterWidget.cpp ..\..\include\Quarter\QuarterWidget.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\QuarterWidget.h

"src\Quarter\moc_QuarterWidget.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_QuarterWidget.cpp ..\..\include\Quarter\QuarterWidget.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\QuarterWidget.h

"src\Quarter\moc_QuarterWidget.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_QuarterWidget.cpp ..\..\include\Quarter\QuarterWidget.h

# End Custom Build

!ENDIF

# End Source File
# Begin Group "devices"
# Begin Source File

SOURCE=..\..\include\Quarter\devices\DeviceHandler.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\devices\InputDevice.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\devices\Keyboard.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\devices\Mouse.h
# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\devices\SpaceNavigatorDevice.h
# End Source File
# End Group
# Begin Group "eventhandlers"
# Begin Source File

SOURCE=..\..\include\Quarter\eventhandlers\DragDropHandler.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\DragDropHandler.h

"src\Quarter\moc_DragDropHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_DragDropHandler.cpp ..\..\include\Quarter\eventhandlers\DragDropHandler.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\DragDropHandler.h

"src\Quarter\moc_DragDropHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_DragDropHandler.cpp ..\..\include\Quarter\eventhandlers\DragDropHandler.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\DragDropHandler.h

"src\Quarter\moc_DragDropHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_DragDropHandler.cpp ..\..\include\Quarter\eventhandlers\DragDropHandler.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\DragDropHandler.h

"src\Quarter\moc_DragDropHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_DragDropHandler.cpp ..\..\include\Quarter\eventhandlers\DragDropHandler.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\eventhandlers\FocusHandler.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\FocusHandler.h

"src\Quarter\moc_FocusHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_FocusHandler.cpp ..\..\include\Quarter\eventhandlers\FocusHandler.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\FocusHandler.h

"src\Quarter\moc_FocusHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_FocusHandler.cpp ..\..\include\Quarter\eventhandlers\FocusHandler.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\FocusHandler.h

"src\Quarter\moc_FocusHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_FocusHandler.cpp ..\..\include\Quarter\eventhandlers\FocusHandler.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\FocusHandler.h

"src\Quarter\moc_FocusHandler.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_FocusHandler.cpp ..\..\include\Quarter\eventhandlers\FocusHandler.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=..\..\include\Quarter\eventhandlers\EventFilter.h

!IF  "$(CFG)" == "quarter1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\EventFilter.h

"src\Quarter\moc_EventFilter.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_EventFilter.cpp ..\..\include\Quarter\eventhandlers\EventFilter.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\EventFilter.h

"src\Quarter\moc_EventFilter.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_EventFilter.cpp ..\..\include\Quarter\eventhandlers\EventFilter.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\EventFilter.h

"src\Quarter\moc_EventFilter.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_EventFilter.cpp ..\..\include\Quarter\eventhandlers\EventFilter.h

# End Custom Build
  
!ELSEIF  "$(CFG)" == "quarter1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\include\Quarter\eventhandlers\EventFilter.h

"src\Quarter\moc_EventFilter.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	$(QTDIR)\bin\moc -o src\Quarter\moc_EventFilter.cpp ..\..\include\Quarter\eventhandlers\EventFilter.h

# End Custom Build

!ENDIF

# End Source File
# End Group
# End Group
# End Target
# End Project
