@echo off
echo ============================================
echo KIBORI GAMING - Flutter Installation Script
echo ============================================
echo.

echo This script will:
echo 1. Check if Flutter is installed
echo 2. Add Flutter to PATH
echo 3. Install dependencies
echo 4. Build your APK
echo.
pause

REM Check if Flutter exists
if exist "C:\flutter\bin\flutter.bat" (
    echo ✓ Flutter found at C:\flutter
    goto :setup_path
)

if exist "%USERPROFILE%\flutter\bin\flutter.bat" (
    echo ✓ Flutter found at %USERPROFILE%\flutter
    set FLUTTER_PATH=%USERPROFILE%\flutter\bin
    goto :setup_path
)

echo.
echo ============================================
echo FLUTTER NOT FOUND
echo ============================================
echo.
echo Please install Flutter manually:
echo.
echo 1. Download from: https://docs.flutter.dev/get-started/install/windows
echo    Direct link: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip
echo.
echo 2. Extract ZIP to C:\flutter (or any location)
echo.
echo 3. Run this script again
echo.
pause
exit /b 1

:setup_path
echo.
echo Setting up Flutter PATH...
if exist "C:\flutter\bin\flutter.bat" (
    set FLUTTER_PATH=C:\flutter\bin
) else (
    set FLUTTER_PATH=%USERPROFILE%\flutter\bin
)

REM Add to current session PATH
set PATH=%FLUTTER_PATH%;%PATH%

echo ✓ Flutter PATH configured for this session
echo.

echo Running Flutter Doctor...
call flutter doctor
echo.

echo ============================================
echo INSTALLING DEPENDENCIES
echo ============================================
echo.

cd flutter_games
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: flutter_games folder not found!
    echo Make sure you're running this from GAMES.APP folder
    pause
    exit /b 1
)

echo Installing Flutter packages...
call flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)
echo ✓ Dependencies installed
echo.

echo ============================================
echo BUILDING APK
echo ============================================
echo.

echo Building debug APK (this takes 5-10 minutes on first build)...
call flutter build apk --debug

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ============================================
    echo BUILD FAILED
    echo ============================================
    echo.
    echo Common issues:
    echo 1. Android SDK not installed - Install Android Studio
    echo 2. Java not found - Install JDK
    echo 3. Run: flutter doctor --android-licenses
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================
echo ✓ BUILD SUCCESSFUL!
echo ============================================
echo.
echo APK Location:
echo   flutter_games\build\app\outputs\flutter-apk\app-debug.apk
echo.

if exist "flutter_games\build\app\outputs\flutter-apk\app-debug.apk" (
    for %%F in ("flutter_games\build\app\outputs\flutter-apk\app-debug.apk") do (
        set size=%%~zF
        set /a sizeMB=!size! / 1048576
        echo APK Size: !sizeMB! MB
    )
    echo.
    echo Opening APK folder...
    start "" "flutter_games\build\app\outputs\flutter-apk"
)

echo.
echo To install on phone:
echo 1. Copy app-debug.apk to your phone
echo 2. Enable 'Install from Unknown Sources'
echo 3. Tap APK to install
echo.
pause
