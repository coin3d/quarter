# Microsoft Developer Studio Project File - Name="quarterwidgetplugin1" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=quarterwidgetplugin1 - Win32 DLL (Release)
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "quarterwidgetplugin1.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "quarterwidgetplugin1.mak" CFG="quarterwidgetplugin1 - Win32 DLL (Debug)"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "quarterwidgetplugin1 - Win32 LIB (Release)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarterwidgetplugin1 - Win32 LIB (Debug)" (based on "Win32 (x86) Static Library")
!MESSAGE "quarterwidgetplugin1 - Win32 DLL (Release)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "quarterwidgetplugin1 - Win32 DLL (Debug)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "PluginStaticRelease"
# PROP BASE Intermediate_Dir "PluginStaticRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "PluginStaticRelease"
# PROP Intermediate_Dir "PluginStaticRelease"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_NOT_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_NO_DEBUG" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GR /GX /O2 /Ob2 /Og /Oi /Oy /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_NOT_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_NO_DEBUG" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /Gs /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "NDEBUG"
# ADD RSC /l 0x414 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarterwidgetplugin1s.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarterwidgetplugin1s.lib"

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "PluginStaticDebug"
# PROP BASE Intermediate_Dir "PluginStaticDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "PluginStaticDebug"
# PROP Intermediate_Dir "PluginStaticDebug"
# PROP Target_Dir ""
MTL=midl.exe
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_NOT_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GR /GX /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D "HAVE_CONFIG_H" /D "COIN_NOT_DLL" /D "QUARTER_NOT_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /c
RSC=rc.exe
# ADD BASE RSC /l 0x414 /d "_DEBUG"
# ADD RSC /l 0x414 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"quarterwidgetplugin1sd.lib"
# ADD LIB32 /nologo /machine:I386 /out:"quarterwidgetplugin1sd.lib"

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "PluginRelease"
# PROP BASE Intermediate_Dir "PluginRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "PluginRelease"
# PROP Intermediate_Dir "PluginRelease"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MD /W3 /GR /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "COIN_DLL" /D "QUARTER_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_NO_DEBUG" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /Gs /c
# ADD CPP /nologo /MD /W3 /GR /GX /O2 /Og /Oi /Oy /Ob2 /Gy /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "COIN_DLL" /D "QUARTER_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_NO_DEBUG" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /Gs /c
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
# ADD BASE LINK32 $(COINDIR)\lib\quarter1.lib $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /machine:I386
# ADD LINK32 $(COINDIR)\lib\quarter1.lib $(QTDIR)\lib\QtOpenGL4.lib $(QTDIR)\lib\QtGui4.lib $(QTDIR)\lib\QtCore4.lib $(COINDIR)\lib\coin3.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /machine:I386 /out:"quarterwidgetplugin1.dll" /opt:nowin98
# SUBTRACT LINK32 /pdb:none

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "PluginDebug"
# PROP BASE Intermediate_Dir "PluginDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "PluginDebug"
# PROP Intermediate_Dir "PluginDebug"
# PROP Target_Dir ""
CPP=cl.exe
# ADD BASE CPP /nologo /MDd /W3 /Gm /GR /GX /ZI /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "COIN_DLL" /D "QUARTER_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GR /GX /ZI /Od /I "..\..\include" /I "$(COINDIR)\include" /I "$(COINDIR)\include\Inventor\annex" /I "$(QTDIR)\include" /I "$(QTDIR)\include\Qt" /I "$(QTDIR)\include\QtDesigner" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "HAVE_CONFIG_H" /D "COIN_DLL" /D "QUARTER_DLL" /D "QT_PLUGIN" /D "UNICODE" /D "QT_LARGEFILE_SUPPORT" /D "QT_CORE_LIB" /D "QT_XML_LIB" /D "QT_OPENGL_LIB" /D "QT_GUI_LIB" /D "QT_THREAD_SUPPORT" /D "QDESIGNER_EXPORT_WIDGETS" /YX /FD /GZ /c
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
# ADD BASE LINK32 $(COINDIR)\lib\quarter1d.lib $(QTDIR)\lib\QtOpenGLd4.lib $(QTDIR)\lib\QtGuid4.lib $(QTDIR)\lib\QtCored4.lib $(COINDIR)\lib\coin3d.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 $(COINDIR)\lib\quarter1d.lib $(QTDIR)\lib\QtOpenGLd4.lib $(QTDIR)\lib\QtGuid4.lib $(QTDIR)\lib\QtCored4.lib $(COINDIR)\lib\coin3d.lib opengl32.lib gdi32.lib winmm.lib user32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /out:"quarterwidgetplugin1d.dll"

!ENDIF

# Begin Target

# Name "quarterwidgetplugin1 - Win32 DLL (Release)"
# Name "quarterwidgetplugin1 - Win32 DLL (Debug)"
# Name "quarterwidgetplugin1 - Win32 LIB (Release)"
# Name "quarterwidgetplugin1 - Win32 LIB (Debug)"
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
# Begin Source File

SOURCE=..\..\src\plugins\QuarterWidgetPlugin.h

!IF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\plugins\QuarterWidgetPlugin.h

"src\plugins\moc_QuarterWidgetPlugin.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
        "$(QTDIR)"\bin\moc -I"$(QTDIR)"\include\QtDesigner -o src\plugins\moc_QuarterWidgetPlugin.cpp ..\..\src\plugins\QuarterWidgetPlugin.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\plugins\QuarterWidgetPlugin.h

"src\plugins\moc_QuarterWidgetPlugin.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
        "$(QTDIR)"\bin\moc -I"$(QTDIR)"\include\QtDesigner -o src\plugins\moc_QuarterWidgetPlugin.cpp ..\..\src\plugins\QuarterWidgetPlugin.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Release)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\plugins\QuarterWidgetPlugin.h

"src\plugins\moc_QuarterWidgetPlugin.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
        "$(QTDIR)"\bin\moc -I"$(QTDIR)"\include\QtDesigner -o src\plugins\moc_QuarterWidgetPlugin.cpp ..\..\src\plugins\QuarterWidgetPlugin.h

# End Custom Build

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Debug)"

# PROP IgnoreDefaultTool 1
#Begin Custom Build - moc'ing $(InputPath)
InputPath=..\..\src\plugins\QuarterWidgetPlugin.h

"src\plugins\moc_QuarterWidgetPlugin.cpp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
        "$(QTDIR)"\bin\moc -I"$(QTDIR)"\include\QtDesigner -o src\plugins\moc_QuarterWidgetPlugin.cpp ..\..\src\plugins\QuarterWidgetPlugin.h

# End Custom Build

!ENDIF

# End Source File
# Begin Source File

SOURCE=src\plugins\moc_QuarterWidgetPlugin.cpp
!IF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "PluginRelease"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "PluginDebug"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "PluginStaticRelease"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "PluginStaticDebug"
!ENDIF
# End Source File
# Begin Source File

SOURCE=..\..\src\plugins\QuarterWidgetPlugin.cpp
!IF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Release)"
# PROP Intermediate_Dir "PluginRelease"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "PluginDebug"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Release)"
# PROP Intermediate_Dir "PluginStaticRelease"
!ELSEIF  "$(CFG)" == "quarterwidgetplugin1 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "PluginStaticDebug"
!ENDIF
# End Source File
# End Group
# Begin Group "Public Headers"
# End Group
# End Target
# End Project
