import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Helper class that contain main device data wee need
abstract class DeviceService {
  /// Private Const constructor to prevent getting an object of this class
  const DeviceService._();

  // Future<bool> connectedWithInternet(){...}

  // Future<void> preventScreenRecording(){...}

  /// Setup phone chrome style
  static Future<void> setupSystemChrome() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            SystemUiOverlayStyle.dark.systemNavigationBarColor,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.black,
      ),
    );

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return;
  }
}
