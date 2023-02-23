@setlocal

@echo off

set VisualStudioInstallerFolder="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer"
if %PROCESSOR_ARCHITECTURE%==x86 set VisualStudioInstallerFolder="%ProgramFiles%\Microsoft Visual Studio\Installer"

pushd %VisualStudioInstallerFolder%
for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
  set VisualStudioInstallDir=%%i
)
popd

call "%VisualStudioInstallDir%\VC\Auxiliary\Build\vcvarsall.bat" amd64_x86

set ObjectFolder="%~dp0Output\Objects\x86"
set BinaryFolder="%~dp0Output\Binaries\x86"

rem Remove the output folder for a fresh compile.
rd /s /q %ObjectFolder%
rd /s /q %BinaryFolder%

mkdir %BinaryFolder%

set CommonOptions=-DCMAKE_PREFIX_PATH=%QtBinaryFolder% -DCMAKE_INSTALL_PREFIX=%BinaryFolder% -G "Ninja" -DWindowsTargetPlatformMinVersion=6.0.6000.0 -DFRAMELESSHELPER_ENABLE_VCLTL=ON -DFRAMELESSHELPER_ENABLE_YYTHUNKS=ON -DFRAMELESSHELPER_BUILD_STATIC=ON

mkdir %ObjectFolder%\framelesshelper_debug
pushd %ObjectFolder%\framelesshelper_debug
cmake %CommonOptions%  -DCMAKE_BUILD_TYPE=Debug ../../../../framelesshelper
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
cmake --build . --parallel
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
ninja install
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
popd

mkdir %ObjectFolder%\framelesshelper_release
pushd %ObjectFolder%\framelesshelper_release
cmake %CommonOptions% -DCMAKE_BUILD_TYPE=Release ../../../../framelesshelper
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
cmake --build . --parallel
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
ninja install
if %ERRORLEVEL% NEQ 0 exit /B %ERRORLEVEL%
popd

@endlocal