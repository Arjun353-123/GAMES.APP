@echo off
echo ============================================
echo KIBORI GAMING - Flutter APK Builder
echo ============================================
echo.

echo Checking Flutter installation...
flutter --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Flutter is not installed or not in PATH!
    echo.
    echo Please install Flutter from: https://flutter.dev/docs/get-started/install/windows
    echo.
    echo After installation, add Flutter to PATH:
    echo   1. Search "Environment Variables" in Windows
    echo   2. Edit PATH variable
    echo   3. Add Flutter bin folder (e.g., C:\flutter\bin)
    echo.
    pause
    exit /b 1
)
echo ✓ Flutter found
echo.

echo Step 1: Getting dependencies...
call flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to get dependencies!
    pause
    exit /b 1
)
echo ✓ Dependencies installed
echo.

echo Step 2: Cleaning previous builds...
call flutter clean
echo ✓ Clean completed
echo.

echo Step 3: Building APK (Debug)...
echo This may take several minutes on first build...
echo.
call flutter build apk --debug
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ============================================
    echo BUILD FAILED!
    echo ============================================
    echo.
    echo Common solutions:
    echo   1. Make sure Android SDK is installed via Android Studio
    echo   2. Run 'flutter doctor' to check for issues
    echo   3. Check that ANDROID_HOME is set correctly
    echo.
    pause
    exit /b 1
)

echo.
echo ============================================
echo ✓ APK BUILD SUCCESSFUL!
echo ============================================
echo.
echo APK Location:
echo   build\app\outputs\flutter-apk\app-debug.apk
echo.
echo File size:
dir /b "build\app\outputs\flutter-apk\app-debug.apk" 2>nul
if %ERRORLEVEL% EQU 0 (
    for %%F in ("build\app\outputs\flutter-apk\app-debug.apk") do echo   %%~zF bytes
)
echo.
echo To install on phone:
echo   1. Copy app-debug.apk to your phone
echo   2. Enable "Install from Unknown Sources"
echo   3. Open APK file and install
echo.
echo Opening APK folder...
start "" "build\app\outputs\flutter-apk"

pause
