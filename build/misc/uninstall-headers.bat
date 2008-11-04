rem ************************************************************************
rem * uninstall-headers.bat
rem *

set msvc=%1

del %COINDIR%\include\Quarter\Basic.h
del %COINDIR%\include\Quarter\Quarter.h
del %COINDIR%\include\Quarter\QuarterWidget.h

del %COINDIR%\include\Quarter\devices\DeviceHandler.h
del %COINDIR%\include\Quarter\devices\InputDevice.h
del %COINDIR%\include\Quarter\devices\Keyboard.h
del %COINDIR%\include\Quarter\devices\Mouse.h

del %COINDIR%\include\Quarter\eventhandlers\EventFilter.h
del %COINDIR%\include\Quarter\eventhandlers\EventHandler.h
del %COINDIR%\include\Quarter\eventhandlers\DragDropHandler.h

