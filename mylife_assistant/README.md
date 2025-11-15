# MyLife Assistant

## Description

MyLife Assistant is a cross-platform mobile application that acts as a personal assistant. It learns about the user, stores structured memories, and gives personalized suggestions.

## Features

- User Profile Memory System
- Notes Module
- Calendar Module
- Rule-Based Suggestion Engine
- Daily Dashboard
- Profile & Settings screens
- Local storage (SQLite)

## Getting Started

### Prerequisites

- Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode for device-specific builds.

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd mylife_assistant
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```

## Build Instructions

### Android (APK)

1. Connect an Android device or start an emulator.
2. Run the following command to build the APK:
   ```
   flutter build apk --release
   ```
   The APK file will be located in `build/app/outputs/flutter-apk/app-release.apk`.

### iOS

1. Open the project in Xcode:
   ```
   open ios/Runner.xcworkspace
   ```
2. Select a target device (simulator or physical device).
3. Click the "Run" button in Xcode to build and run the app.
