@echo off
cls
echo ============================================
echo FLUTTER INSTALLATION HELPER
echo ============================================
echo.

REM Check if Flutter already exists
if exist "C:\flutter\bin\flutter.bat" (
    echo ✓ Flutter found at C:\flutter
    goto :add_to_path
)

echo Flutter is not installed yet.
echo.
echo STEP 1: Download Flutter
echo -------------------------
echo Open this link in your browser:
echo https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip
echo.
echo Save the file to your Downloads folder.
echo File size: ~1.1 GB
echo.
pause

echo.
echo STEP 2: Extract Flutter
echo -----------------------
echo 1. Open your Downloads folder
echo 2. Find: flutter_windows_3.24.5-stable.zip
echo 3. Right-click and select "Extract All..."
echo 4. Change destination to: C:\
echo 5. Click Extract
echo.
echo This will create C:\flutter folder
echo.
pause

if not exist "C:\flutter\bin\flutter.bat" (
    echo.
    echo ERROR: Flutter not found at C:\flutter
    echo Please extract the ZIP file to C:\ and try again
    pause
    exit /b 1
)

:add_to_path
echo.
echo ✓ Flutter found!
echo.
echo STEP 3: Adding Flutter to PATH
echo -------------------------------

REM Add to PATH for current session
set PATH=C:\flutter\bin;%PATH%

REM Add to user PATH permanently
powershell -Command "[Environment]::SetEnvironmentVariable('Path', [Environment]::GetEnvironmentVariable('Path', 'User') + ';C:\flutter\bin', 'User')"

echo ✓ Flutter added to PATH
echo.
echo IMPORTANT: Close and reopen PowerShell for PATH to take effect
echo.

echo STEP 4: Verifying Flutter
echo --------------------------
C:\flutter\bin\flutter.bat doctor
echo.

pause

echo.
echo STEP 5: Install Android Studio
echo -------------------------------
echo If you haven't installed Android Studio yet:
echo 1. Go to: https://developer.android.com/studio
echo 2. Download and install Android Studio
echo 3. Install Android SDK when prompted
echo 4. Then run this command:
echo    C:\flutter\bin\flutter.bat doctor --android-licenses
echo.
pause

echo.
echo ============================================
echo FLUTTER IS READY!
echo ============================================
echo.
echo Next steps:
echo 1. Close this window
echo 2. Close PowerShell if open
echo 3. Open NEW PowerShell
echo 4. Run: flutter doctor
echo 5. Install Android Studio if you haven't
echo 6. Run build script
echo.
pause
