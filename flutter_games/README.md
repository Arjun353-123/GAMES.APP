# KIBORI GAMING - Flutter Mobile App

Complete Flutter conversion of the KIBORI Gaming web application optimized for mobile devices.

## 🎮 Features
- **7 Premium Games**: Snake, Flappy Bird, Tic-Tac-Toe, and more
- **Mobile-Optimized UI**: Designed specifically for mobile screens
- **White Theme**: Clean white background with black text
- **Login System**: Username/password and guest login
- **Smooth Animations**: Flutter animations for polished UX
- **Working Games**: Snake and Tic-Tac-Toe fully playable

## 📱 Build APK

### Prerequisites
1. Install Flutter SDK: https://flutter.dev/docs/get-started/install/windows
2. Install Android Studio: https://developer.android.com/studio
3. Set up Android SDK via Android Studio

### Build Commands

```powershell
# Navigate to project
cd flutter_games

# Get dependencies
flutter pub get

# Build APK (Debug)
flutter build apk --debug

# Build APK (Release)
flutter build apk --release

# APK Location:
# Debug: build\app\outputs\flutter-apk\app-debug.apk
# Release: build\app\outputs\flutter-apk\app-release.apk
```

### Quick Build Script
Run the included batch file:
```powershell
.\build_flutter_apk.bat
```

## 🚀 Install on Phone

1. **Enable Developer Options**:
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
   
2. **Enable USB Debugging**:
   - Settings → Developer Options → USB Debugging

3. **Install APK**:
   - Copy APK to phone
   - Open file manager, tap APK
   - Allow "Install from Unknown Sources"
   - Tap Install

## 📂 Project Structure

```
flutter_games/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/
│   │   ├── login_screen.dart     # Login page
│   │   ├── dashboard_screen.dart # Game selection
│   │   └── game_screen.dart      # Individual game view
│   ├── games/
│   │   └── game_list.dart        # Game definitions
│   └── widgets/
│       ├── snake_game_widget.dart      # Snake game
│       ├── flappy_bird_widget.dart     # Flappy Bird
│       ├── tic_tac_toe_widget.dart     # Tic-Tac-Toe
│       └── brick_breaker_widget.dart   # Brick Breaker (coming soon)
├── android/                      # Android configuration
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## 🎨 Design
- **Theme**: White background, black text
- **Typography**: Google Fonts (Inter)
- **Buttons**: White with black borders
- **Mobile-First**: Portrait orientation, touch-optimized

## 🔧 Development

```powershell
# Run in dev mode
flutter run

# Run on specific device
flutter devices
flutter run -d <device_id>

# Hot reload: Press 'r' in terminal
# Hot restart: Press 'R' in terminal
```

## 📦 Dependencies
- flutter_animate: Smooth animations
- google_fonts: Typography
- flame: Game engine (for future 3D games)
- shared_preferences: Local storage

## 🎯 Games Status
- ✅ **Snake**: Fully functional with touch controls
- ✅ **Tic-Tac-Toe**: Complete with AI coming soon
- ✅ **Flappy Bird**: Basic implementation
- 🔄 **Brick Breaker**: Coming soon
- 🔄 **Vice City 3D**: Coming soon
- 🔄 **Neon Racer**: Coming soon
- 🔄 **Temple Runner**: Coming soon

## 🐛 Troubleshooting

### Flutter not recognized
```powershell
# Add Flutter to PATH
$env:PATH += ";C:\flutter\bin"
```

### Build fails
```powershell
# Clean and rebuild
flutter clean
flutter pub get
flutter build apk
```

### Gradle errors
- Update Android Studio
- Update Android SDK
- Check ANDROID_HOME environment variable

## 📝 Notes
- This is a complete rewrite in Flutter
- Original web app: `games/` directory
- Flutter app: `flutter_games/` directory
- All game logic rewritten for mobile
- Optimized for touch controls

## 🚀 Next Steps
1. Install Flutter SDK
2. Run `flutter doctor` to check setup
3. Run `flutter pub get` to install dependencies
4. Run `flutter build apk` to create APK
5. Install APK on phone

---

**App Name**: KIBORI GAMING  
**Package**: com.kiborigaming.app  
**Platform**: Flutter (Android)  
**Min SDK**: 21 (Android 5.0)  
**Target SDK**: 34 (Android 14)
