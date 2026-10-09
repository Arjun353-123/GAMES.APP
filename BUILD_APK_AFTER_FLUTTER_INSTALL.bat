@echo off
echo ============================================
echo BUILD KIBORI GAMING APK
echo ============================================
echo.

REM Check if Flutter exists
if exist "C:\flutter\bin\flutter.bat" (
    set FLUTTER_CMD=C:\flutter\bin\flutter.bat
    echo ✓ Flutter found at C:\flutter
) else (
    where flutter >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        set FLUTTER_CMD=flutter
        echo ✓ Flutter found in PATH
    ) else (
        echo ✗ Flutter not found!
        echo.
        echo Please run INSTALL_FLUTTER_NOW.bat first
        pause
        exit /b 1
    )
)

echo.
echo Checking Flutter installation...
%FLUTTER_CMD% doctor
echo.

echo ============================================
echo BUILDING APK
echo ============================================
echo.

cd flutter_games
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: flutter_games folder not found!
    pause
    exit /b 1
)

echo Step 1: Installing dependencies...
%FLUTTER_CMD% pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)
echo ✓ Dependencies installed
echo.

echo Step 2: Building APK (this takes 10-15 minutes on first build)...
%FLUTTER_CMD% build apk --debug
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ============================================
    echo BUILD FAILED
    echo ============================================
    echo.
    echo Make sure:
    echo 1. Android Studio is installed
    echo 2. Android SDK is installed
    echo 3. You ran: flutter doctor --android-licenses
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
echo   build\app\outputs\flutter-apk\app-debug.apk
echo.

if exist "build\app\outputs\flutter-apk\app-debug.apk" (
    for %%F in ("build\app\outputs\flutter-apk\app-debug.apk") do (
        set size=%%~zF
        set /a sizeMB=!size! / 1048576
        echo APK Size: !sizeMB! MB
    )
    
    echo.
    echo Full path:
    echo %CD%\build\app\outputs\flutter-apk\app-debug.apk
    echo.
    echo Opening APK folder...
    start "" "build\app\outputs\flutter-apk"
) else (
    echo APK file not found!
)

echo.
echo To install on phone:
echo 1. Copy app-debug.apk to your phone
echo 2. Open the file on phone
echo 3. Allow install from unknown sources
echo 4. Tap Install
echo.
pause
