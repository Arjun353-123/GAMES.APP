# Download and Install Flutter - Complete Guide

## 🚀 Quick Installation (5 Steps)

### Step 1: Download Flutter SDK

**Download Link**: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip

- **File Size**: ~1.1 GB
- **Download Time**: 5-15 minutes depending on internet speed
- **Save to**: Your Downloads folder

### Step 2: Extract Flutter

1. Right-click the downloaded ZIP file
2. Select "Extract All..."
3. Choose destination: `C:\` (will create `C:\flutter`)
4. Click "Extract"

**Result**: You should have `C:\flutter\` folder with `bin`, `packages`, etc.

### Step 3: Add Flutter to PATH

#### Option A: Automatic (PowerShell)
```powershell
# Run PowerShell as Administrator
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\flutter\bin", "User")
```

#### Option B: Manual (GUI)
1. Press `Win + X` → System
2. Click "Advanced system settings"
3. Click "Environment Variables"
4. Under "User variables", select "Path" → Click "Edit"
5. Click "New"
6. Add: `C:\flutter\bin`
7. Click "OK" on all dialogs
8. **Restart your terminal/PowerShell**

### Step 4: Verify Installation

Open **new** PowerShell window:
```powershell
flutter doctor
```

Expected output:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.24.5, on Microsoft Windows)
[!] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
```

### Step 5: Install Android Studio (Required for APK build)

1. Download: https://developer.android.com/studio
2. Run installer
3. Follow wizard, install all default components
4. **Important**: Install Android SDK when prompted
5. After installation, run:
   ```powershell
   flutter doctor --android-licenses
   # Press 'y' to accept all
   ```

---

## 🎯 Build Your APK

Once Flutter is installed:

```powershell
# Navigate to project
cd C:\Users\Arjun\OneDrive\Desktop\GAMES.APP

# Run installation script
.\FLUTTER_INSTALL_AND_BUILD.bat
```

**Or manually**:
```powershell
cd flutter_games
flutter pub get
flutter build apk --debug
```

---

## 📦 APK Location After Build

```
C:\Users\Arjun\OneDrive\Desktop\GAMES.APP\flutter_games\build\app\outputs\flutter-apk\app-debug.apk
```

---

## 🔧 Troubleshooting

### "flutter is not recognized"
- Flutter not in PATH
- **Fix**: Restart PowerShell after adding to PATH
- Or run: `C:\flutter\bin\flutter doctor`

### "Android SDK not found"
- Android Studio not installed
- **Fix**: Install Android Studio, then run `flutter doctor`

### "cmdline-tools not found"
1. Open Android Studio
2. Go to: Tools → SDK Manager
3. SDK Tools tab
4. Check "Android SDK Command-line Tools"
5. Click "Apply"

### Build takes too long
- First build: 5-10 minutes (normal)
- Subsequent builds: 1-2 minutes
- **Be patient on first build!**

---

## 📱 Alternative: Use Pre-built APK Service

If you can't install Flutter locally:

### Option 1: Codemagic (Free)
1. Push code to GitHub
2. Go to https://codemagic.io/
3. Connect GitHub repo
4. Configure Flutter build
5. Download APK from build

### Option 2: GitHub Actions
1. Push code to GitHub
2. Add Flutter build workflow
3. APK built on GitHub servers
4. Download from Actions tab

---

## ✅ Verification Checklist

After installation, verify:

- [ ] Flutter extracted to `C:\flutter\`
- [ ] `C:\flutter\bin` added to PATH
- [ ] Terminal restarted
- [ ] `flutter doctor` shows Flutter installed
- [ ] Android Studio installed
- [ ] Android licenses accepted
- [ ] `flutter_games` folder exists
- [ ] Ready to run build script

---

## 🎮 Final Commands

Once everything is installed:

```powershell
cd C:\Users\Arjun\OneDrive\Desktop\GAMES.APP\flutter_games
flutter pub get
flutter build apk --debug
```

**APK will be at**:
```
build\app\outputs\flutter-apk\app-debug.apk
```

Copy this file to your phone and install!

---

## 💡 Quick Links

- **Flutter Download**: https://docs.flutter.dev/get-started/install/windows
- **Android Studio**: https://developer.android.com/studio
- **Flutter Documentation**: https://docs.flutter.dev/
- **Troubleshooting**: https://docs.flutter.dev/get-started/install/windows#troubleshooting

---

## 📊 Download Sizes

| Component | Size | Time (on 10 Mbps) |
|-----------|------|-------------------|
| Flutter SDK | 1.1 GB | ~15 minutes |
| Android Studio | 1.0 GB | ~13 minutes |
| Android SDK | 2.5 GB | ~30 minutes |
| **Total** | **~4.6 GB** | **~1 hour** |

---

**After installation, your APK file location will be shown by the build script!**
