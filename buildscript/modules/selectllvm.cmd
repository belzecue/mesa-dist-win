@IF %gitstate% GTR 0 set /p legacyllvm=Use previous LLVM major version (y/n):
@IF %gitstate% GTR 0 echo.
@IF /I "%legacyllvm%"=="y" set llvminstloc=%devroot%\llvmold\build
@IF /I NOT "%legacyllvm%"=="y" set llvminstloc=%devroot%\llvm\build

