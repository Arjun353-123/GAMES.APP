# Install Flutter - Quick Guide

## Step 1: Download Flutter SDK

1. Go to: https://docs.flutter.dev/get-started/install/windows
2. Download Flutter SDK ZIP file
3. Extract to: `C:\flutter` (or your preferred location)

## Step 2: Add Flutter to PATH

### Method 1: Using PowerShell (Quick)
```powershell
# Run PowerShell as Administrator
$env:Path += ";C:\flutter\bin"
[Environment]::SetEnvironmentVariable("Path", $env:Path, "User")
```

### Method 2: Using Windows Settings (Permanent)
1. Search "Environment Variables" in Windows Start
2. Click "Edit the system environment variables"
3. Click "Environment Variables" button
4. Under "User variables", select "Path", click "Edit"
5. Click "New"
6. Add: `C:\flutter\bin`
7. Click "OK" on all dialogs
8. **Restart your terminal/command prompt**

## Step 3: Install Android Studio

1. Download: https://developer.android.com/studio
2. Run installer
3. Follow setup wizard
4. Install Android SDK (will be prompted)

## Step 4: Accept Android Licenses

```powershell
flutter doctor --android-licenses
# Press 'y' to accept all licenses
```

## Step 5: Verify Installation

```powershell
flutter doctor
```

Expected output:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows)
[✓] Android toolchain - develop for Android devices
[✓] Android Studio (version 2023.x)
[!] Some other tools might show warnings (optional)
```

## Step 6: Build Your APK

```powershell
cd C:\Users\Arjun\OneDrive\Desktop\GAMES.APP\flutter_games
flutter pub get
flutter build apk
```

## Quick Commands Reference

```powershell
# Check Flutter status
flutter doctor

# Get dependencies
flutter pub get

# Build debug APK (faster, larger file)
flutter build apk --debug

# Build release APK (slower, smaller file, optimized)
flutter build apk --release

# Run on connected device
flutter run

# List connected devices
flutter devices

# Clean build cache
flutter clean
```

## Troubleshooting

### "flutter is not recognized"
- Flutter not in PATH. Reopen terminal after adding to PATH
- Or run: `C:\flutter\bin\flutter doctor`

### "Android SDK not found"
- Install Android Studio first
- Run: `flutter doctor --android-licenses`

### "cmdline-tools not found"
1. Open Android Studio
2. Tools → SDK Manager
3. SDK Tools tab
4. Check "Android SDK Command-line Tools"
5. Click Apply

### Build stuck/slow
- First build takes 5-10 minutes (normal)
- Subsequent builds are much faster
- Make sure you're not in OneDrive folder (sync issues)

## System Requirements

- **OS**: Windows 10/11 (64-bit)
- **Disk Space**: 2.5 GB (Flutter) + 8 GB (Android SDK)
- **RAM**: 8 GB minimum, 16 GB recommended
- **Tools**: PowerShell 5.0+ or Windows Command Prompt

## Alternative: Online Build Services

If you can't install Flutter locally:

1. **AppGyver/Composer Pro** - No-code platform
2. **Codemagic** - CI/CD for Flutter (free tier)
3. **GitHub Actions** - Automated builds
4. **Appetize.io** - Cloud-based emulator

## Need Help?

- Flutter Documentation: https://docs.flutter.dev/
- Flutter Discord: https://discord.gg/flutter
- Stack Overflow: [flutter] tag

---

**After installation, run the build script:**
```powershell
cd flutter_games
.\build_flutter_apk.bat
```
