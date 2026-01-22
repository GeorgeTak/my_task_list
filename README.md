# My Task List App

A privacy-focused Flutter application designed to help you manage chores, priorities, and to-do lists locally on your device.

## 🚀 Getting Started

This project uses Google AdMob. To keep sensitive Ad Unit IDs secure, the `ad_helper.dart` file has been excluded from this repository. 

**To run this app, you must create this file manually:**

1. Navigate to the `lib/` folder in your project.
2. Create a new file named `ad_helper.dart`.
3. Paste the following code into it (these are Google's public Test IDs, so the app will run safely without real ads):

```dart
import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // Google Test Banner ID for Android
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // Google Test Banner ID for iOS
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
