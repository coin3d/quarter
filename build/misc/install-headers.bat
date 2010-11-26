rem ************************************************************************
rem * install-headers.bat
rem *

set msvc=%1

copy /Y ..\..\include\Quarter\Basic.h %COINDIR%\include\Quarter\Basic.h >nul:
copy /Y ..\..\include\Quarter\Quarter.h %COINDIR%\include\Quarter\Quarter.h >nul:
copy /Y ..\..\include\Quarter\QuarterWidget.h %COINDIR%\include\Quarter\QuarterWidget.h >nul:

copy /Y ..\..\include\Quarter\devices\DeviceHandler.h %COINDIR%\include\Quarter\devices\DeviceHandler.h >nul:
copy /Y ..\..\include\Quarter\devices\InputDevice.h %COINDIR%\include\Quarter\devices\InputDevice.h >nul:
copy /Y ..\..\include\Quarter\devices\Keyboard.h %COINDIR%\include\Quarter\devices\Keyboard.h >nul:
copy /Y ..\..\include\Quarter\devices\Mouse.h %COINDIR%\include\Quarter\devices\Mouse.h >nul:
copy /Y ..\..\include\Quarter\devices\SpaceNavigatorDevice.h %COINDIR%\include\Quarter\devices\SpaceNavigatorDevice.h >nul:

copy /Y ..\..\include\Quarter\eventhandlers\EventFilter.h %COINDIR%\include\Quarter\eventhandlers\EventFilter.h >nul:
copy /Y ..\..\include\Quarter\eventhandlers\EventHandler.h %COINDIR%\include\Quarter\eventhandlers\EventHandler.h >nul:
copy /Y ..\..\include\Quarter\eventhandlers\DragDropHandler.h %COINDIR%\include\Quarter\eventhandlers\DragDropHandler.h >nul:

