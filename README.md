# <a name="title">Hooply</a>

A modern, offline-capable basketball stats tracker built with Flutter, Riverpod, and Drift (SQLite).

## <a name="table">Table of Contents</a>

1. [Introduction](#introduction)
2. [Tech Stack](#tech-stack)
3. [Features](#features)
4. [Quick Start](#quick-start)
5. [Download the APK (Android)](#download-apk)

## <a name="introduction">Introduction</a>

This is a full-featured basketball stat tracking application designed for real-time game use. It supports team and player management, live in-game stat recording, substitutions, undo actions, game summaries, and game history; all wrapped in a clean, responsive UI optimized for speed and clarity.

## <a name="tech-stack">Tech Stack</a>

- Flutter
- Riverpod
- Drift (SQLite)

## <a name="features">Features</a>

### Team & Player Management

- Create, edit, delete teams
- Add players with jersey number validation
- Manage rosters and lineups
- Persistent local storage via Drift

### Live Game Tracking

Real-time tracking with intuitive tap controls:

- 2PT made/attempted + percentage
- 3PT made/attempted + percentage
- FT made/attempted + percentage
- Assists
- Offensive Rebounds
- Defensive Rebounds
- Blocks
- Steals
- Turnovers
- Fouls
- Auto-calculated: Points, FG%, Total Rebounds

Additional in-game features:

- Game Timer (start/pause/resume)
- Substitutions (hot-swap players easily)
- Undo (reverse the last stat entry)
- Made/Miss shot buttons
- Instant state updates with Riverpod

### Post-Game Summary

- Complete box score per player
- Team totals
- Shooting percentages
- Rebound totals
- Turnover/foul counts
- Shareable game metadata

### Game History

- View all completed games
- Tap to view detailed summaries
- Stored locally with Drift

## <a name="quick-start">Quick Start</a>

Follow these steps to set up Hooply on your local machine and run it on a physical device or emulator.

### Prerequisites

Make sure you have the following installed on your machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/)
- [Dart](https://dart.dev/get-dart) (usually comes with Flutter SDK)
- [Android Studio](https://developer.android.com/studio) (for Android development)
- [Xcode](https://developer.apple.com/xcode/) (macOS only, for iOS development)
- [Git](https://git-scm.com/)

Verify Flutter is installed correctly:

```bash
flutter doctor
```

### Cloning the Repository

```bash
git clone git@github.com:mbanixox/hooply.git
cd hooply
```

### Installing Dependencies

```bash
flutter pub get
```

### Running Drift Build Runner

The project uses Drift for local database management with generated code. Run the following command to generate the necessary code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Running the App

#### Option 1 — Android Emulator

1. Open Android Studio
2. Go to Device Manager
3. Create an Android Virtual Device (AVD)
4. Start the emulator
5. Run:

```bash
flutter run
```

#### Option 2 — Physical Android Device

1. Enable Developer Options → USB Debugging on your Android device
2. Connect your phone via USB
3. Verify device is detected:

```bash
flutter devices
```

4. Run:

```bash
flutter run
```

#### Option 3 — iOS Simulator (macOS only)

1. Open Xcode
2. Go to Xcode → Open Developer Tool → Simulator
3. Run:

```bash
flutter run
```

#### Option 4 — Physical iOS Device (macOS only)

This requires:

- Xcode
- Apple Developer account
- App signing setup

Connect your device via USB and run:

```bash
flutter run
```

## <a name="download-apk">Download the APK (Android)</a>

You can install Hooply directly on an Android device using the APK:

[Download Hooply APK](https://drive.google.com/drive/folders/1VgfnygY07xuFlig_a8LQ4rRzIrqtgFlP?usp=sharing)

Transfer it to your phone and install it, or open the link directly on your androiddevice.