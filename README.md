# Signage Player App

## Steps to Run This Project

### 1. Clone the repository

```bash
git clone https://github.com/dhirajdalvi79/signage_player.git
```

### 2. Flutter version

This project uses **Flutter 3.44.4**. Make sure your system has this version installed before proceeding.

### 3. Install dependencies

At the root of the project run

```bash
flutter pub get
```

### 4. Run the app

Ensure a simulator, emulator, or physical device is connected, then run one of the following:

**Android**
```bash
flutter run -d emulator
```

**iOS**
```bash
flutter run -d iphone
```

**Physical device**
1. Connect your phone via USB and enable **USB Debugging** in the phone's Developer Options.
2. Run the following command to find its unique serial number (e.g., `1234xyzabc`):
   ```bash
   flutter devices
   ```
3. Run the app using that device ID:
   ```bash
   flutter run -d 1234xyzabc
   ```

**Alternatively**, you can run the project directly from Android Studio or VS Code — just open `main.dart` and press **Run**.

---

## Architecture

This project follows **Clean Architecture**.

## Packages Used

| Package | Version | Purpose |
|---|---|---|
| [dio](https://pub.dev/packages/dio) | `^5.10.0` | Network requests |
| [path_provider](https://pub.dev/packages/path_provider) | `^2.1.6` | File path access |
| [get_it](https://pub.dev/packages/get_it) | `^9.2.1` | Dependency injection |
| [fpdart](https://pub.dev/packages/fpdart) | `^1.2.0` | Functional programming |
| [video_player](https://pub.dev/packages/video_player) | `^2.11.1` | Video playback |