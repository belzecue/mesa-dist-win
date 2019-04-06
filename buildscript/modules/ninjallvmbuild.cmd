@echo Building llvm-config tool...
@echo.
@ninja -j %throttle% install-llvm-config
@echo.

@rem Build LLVM libraries
@%mesa%\llvm\%abi%-%llvmlink%\bin\llvm-config.exe --libnames engine mcjit bitwriter x86asmprinter irreader 2> %mesa%\mesa-dist-win\buildscript\modules\llvmlibs.tmp
@set llvmlibstotal=0
@FOR /F "skip=2 tokens=4 USEBACKQ" %%a IN (`type %mesa%\mesa-dist-win\buildscript\modules\llvmlibs.tmp`) DO @set /a llvmlibstotal+=1
@setlocal ENABLEDELAYEDEXPANSION
@set llvmlibscount=0
@FOR /F "skip=2 tokens=4 USEBACKQ" %%a IN (`type %mesa%\mesa-dist-win\buildscript\modules\llvmlibs.tmp`) DO @set /a llvmlibscount+=1&echo Building library %%~na - !llvmlibscount! of %llvmlibstotal%...&ninja -j %throttle% install-%%~na&echo.
@endlocal
@del %mesa%\mesa-dist-win\buildscript\modules\llvmlibs.tmp
@echo Installing headers...
@ninja -j %throttle% install-llvm-headers