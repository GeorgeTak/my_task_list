import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4386212806116510/2275733911';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4386212806116510/8712972143';
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}