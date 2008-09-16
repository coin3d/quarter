# Microsoft Developer Studio Project File - Name="quarterwidgetplugin1_install" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) External Target" 0x0106

CFG=quarterwidgetplugin1_install - Win32 DLL (Debug)
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "quarterwidgetplugin1_install.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "quarterwidgetplugin1_install.mak" CFG="quarterwidgetplugin1_install - Win32 DLL (Debug)"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "quarterwidgetplugin1_install - Win32 LIB (Release)" (based on "Win32 (x86) External Target")
!MESSAGE "quarterwidgetplugin1_install - Win32 LIB (Debug)" (based on "Win32 (x86) External Target")
!MESSAGE "quarterwidgetplugin1_install - Win32 DLL (Release)" (based on "Win32 (x86) External Target")
!MESSAGE "quarterwidgetplugin1_install - Win32 DLL (Debug)" (based on "Win32 (x86) External Target")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 LIB (Release)"

# PROP BASE Use_MFC
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "StaticRelease"
# PROP BASE Intermediate_Dir "StaticRelease"
# PROP BASE Cmd_Line "..\misc\install-plugin.bat lib release msvc6 quarterwidgetplugin1"
# PROP BASE Rebuild_Opt ""
# PROP BASE Target_File ""
# PROP BASE Bsc_Name ""
# PROP BASE Target_Dir ""
# PROP Use_MFC
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "StaticRelease"
# PROP Intermediate_Dir "StaticRelease"
# PROP Cmd_Line "..\misc\install-plugin.bat lib release msvc6 quarterwidgetplugin1"
# PROP Rebuild_Opt ""
# PROP Target_File ""
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 LIB (Debug)"

# PROP BASE Use_MFC
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "StaticDebug"
# PROP BASE Intermediate_Dir "StaticDebug"
# PROP BASE Cmd_Line "..\misc\install-plugin.bat lib debug msvc6 quarterwidgetplugin1"
# PROP BASE Rebuild_Opt ""
# PROP BASE Target_File ""
# PROP BASE Bsc_Name ""
# PROP BASE Target_Dir ""
# PROP Use_MFC
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "StaticDebug"
# PROP Intermediate_Dir "StaticDebug"
# PROP Cmd_Line "..\misc\install-plugin.bat lib debug msvc6 quarterwidgetplugin1"
# PROP Rebuild_Opt ""
# PROP Target_File ""
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 DLL (Release)"

# PROP BASE Use_MFC
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Cmd_Line "..\misc\install-plugin.bat dll release msvc6 quarterwidgetplugin1"
# PROP BASE Rebuild_Opt ""
# PROP BASE Target_File ""
# PROP BASE Bsc_Name ""
# PROP BASE Target_Dir ""
# PROP Use_MFC
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Cmd_Line "..\misc\install-plugin.bat dll release msvc6 quarterwidgetplugin1"
# PROP Rebuild_Opt ""
# PROP Target_File ""
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 DLL (Debug)"

# PROP BASE Use_MFC
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Cmd_Line "..\misc\install-plugin.bat dll debug msvc6 quarterwidgetplugin1"
# PROP BASE Rebuild_Opt ""
# PROP BASE Target_File ""
# PROP BASE Bsc_Name ""
# PROP BASE Target_Dir ""
# PROP Use_MFC
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Cmd_Line "..\misc\install-plugin.bat dll debug msvc6 quarterwidgetplugin1"
# PROP Rebuild_Opt ""
# PROP Target_File ""
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ENDIF

# Begin Target

# Name "quarterwidgetplugin1_install - Win32 LIB (Release)"
# Name "quarterwidgetplugin1_install - Win32 LIB (Debug)"
# Name "quarterwidgetplugin1_install - Win32 DLL (Release)"
# Name "quarterwidgetplugin1_install - Win32 DLL (Debug)"

!IF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 LIB (Release)"

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 LIB (Debug)"

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 DLL (Release)"

!ELSEIF  "$(CFG)" == "quarterwidgetplugin1_install - Win32 DLL (Debug)"

!ENDIF

# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe;bat"
# Begin Source File

SOURCE=..\misc\install-plugin.bat
# End Source File
# End Group
# End Target
# End Project
