rem ************************************************************************
rem * install-headers.bat
rem *

set msvc=%1

copy /Y ..\..\include\Quarter\Basic.h %COINDIR%\include\Quarter\Basic.h >nul:
copy /Y ..\..\include\Quarter\Quarter.h %COINDIR%\include\Quarter\Quarter.h >nul:
copy /Y ..\..\include\Quarter\QuarterWidget.h %COINDIR%\include\Quarter\QuarterWidget.h >nul:

copy /Y ..\..\include\Quarter\devices\DeviceManager.h %COINDIR%\include\Quarter\devices\DeviceManager.h >nul:
copy /Y ..\..\include\Quarter\devices\DeviceHandler.h %COINDIR%\include\Quarter\devices\DeviceHandler.h >nul:
copy /Y ..\..\include\Quarter\devices\KeyboardHandler.h %COINDIR%\include\Quarter\devices\KeyboardHandler.h >nul:
copy /Y ..\..\include\Quarter\devices\MouseHandler.h %COINDIR%\include\Quarter\devices\MouseHandler.h >nul:

copy /Y ..\..\include\Quarter\eventhandlers\EventManager.h %COINDIR%\include\Quarter\eventhandlers\EventManager.h >nul:
copy /Y ..\..\include\Quarter\eventhandlers\EventHandler.h %COINDIR%\include\Quarter\eventhandlers\EventHandler.h >nul:
copy /Y ..\..\include\Quarter\eventhandlers\DragDropHandler.h %COINDIR%\include\Quarter\eventhandlers\DragDropHandler.h >nul:

