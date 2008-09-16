@echo off
rem ************************************************************************

echo Running ..\misc\install-plugin.bat

set type=%1
set mode=%2
set msvc=%3
set libname=%4

rem ************************************************************************
rem * check script arguments

if "%1"=="dll" goto argonegiven
if "%1"=="lib" goto argonegiven
goto argproblem

:argonegiven
if "%2"=="release" goto argtwogiven
if "%2"=="debug" goto argtwogiven
goto argproblem

:argtwogiven
goto argtestdone

:argproblem
echo Error with script arguments: %1 %2 %3 %4.
echo Usage:
echo   install-plugin.bat dll/lib release/debug msvc# libname
exit

:argtestdone

rem ************************************************************************
rem * check environment variables

if not "%QTDIR%"=="" goto qtdirset
echo The QTDIR environment variable must be set to point to a directory
echo to be able to perform the installation procedure.
exit

:qtdirset
if exist %QTDIR%\*.* goto qtdirexists
echo The QTDIR environment variable must point to the Qt installation
echo directory to be able to perform the installation procedure.
exit

:qtdirexists
if exist %QTDIR%\plugins\*.* goto qtpluginsdirexists
echo The QTDIR environment variable must point to the Qt installation
echo directory to be able to perform the installation procedure.
exit

:qtpluginsdirexists
if exist %QTDIR%\plugins\designer\*.* goto qtdesignerdirexists
echo The QTDIR environment variable must point to the Qt installation
echo directory to be able to perform the installation procedure.
exit

:qtdesignerdirexists

echo Installing to %QTDIR%\plugins\designer\

rem **********************************************************************
rem * Copy files

if "%1"=="dll" goto installdll
goto installlib

:installdll

if "%2"=="debug" goto installdlldebug
goto installdllrelease

:installdlldebug
xcopy %libname%d.dll %QTDIR%\plugins\designer\ /R /Y
xcopy PluginDebug\%libname%d.pdb %QTDIR%\plugins\designer\ /R /Y
xcopy PluginDebug\%libname%d.lib %QTDIR%\plugins\designer\ /R /Y
goto binariesdone

:installdllrelease
xcopy %libname%.dll %QTDIR%\plugins\designer\ /R /Y
xcopy PluginRelease\%libname%.lib %QTDIR%\plugins\designer\ /R /Y
goto binariesdone

:installlib

echo The plugin can not be used when built as a static library.

:binariesdone

rem ** EOF ***************************************************************
