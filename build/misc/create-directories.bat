@echo off

REM **********************************************************************
REM * Create all the directories for the installed files

pushd %COINDIR%

if exist bin\*.* goto binexists
echo mkdir %COINDIR%\bin
mkdir bin
:binexists
if exist lib\*.* goto libexists
echo mkdir %COINDIR%\lib
mkdir lib
:libexists
if exist include\*.* goto includeexists
echo mkdir %COINDIR%\include
mkdir include
:includeexists

pushd include

if exist Quarter\*.* goto quarterincludeexists
echo mkdir %COINDIR%\include\Quarter
mkdir Quarter
:quarterincludeexists

popd

pushd include\Quarter

if exist devices\*.* goto devicesexists
echo mkdir %COINDIR%\include\Quarter\devices
mkdir devices
:devicesexists

if exist eventhandlers\*.* goto eventhandlersexists
echo mkdir %COINDIR%\include\Quarter\eventhandlers
mkdir eventhandlers
:eventhandlersexists

popd

popd

