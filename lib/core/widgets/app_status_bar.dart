import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBar {
  static splashStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
