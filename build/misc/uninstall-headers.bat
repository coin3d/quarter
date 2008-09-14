rem ************************************************************************
rem * uninstall-headers.bat
rem *

set msvc=%1

del %COINDIR%\include\Quarter\Basic.h
del %COINDIR%\include\Quarter\Quarter.h
del %COINDIR%\include\Quarter\QuarterWidget.h

del %COINDIR%\include\Quarter\devices\DeviceManager.h
del %COINDIR%\include\Quarter\devices\DeviceHandler.h
del %COINDIR%\include\Quarter\devices\KeyboardHandler.h
del %COINDIR%\include\Quarter\devices\MouseHandler.h

del %COINDIR%\include\Quarter\eventhandlers\EventManager.h
del %COINDIR%\include\Quarter\eventhandlers\EventHandler.h
del %COINDIR%\include\Quarter\eventhandlers\DragDropHandler.h

