import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String currentSplashPath = "assets/images/splashDark.png";
  ThemeMode currentMode = ThemeMode.dark;

  void changeMode(ThemeMode newMode) {
    currentMode = newMode;
    notifyListeners();
  }

  void changeSplashPath(String newSplashPath) {
    currentSplashPath = newSplashPath;
    notifyListeners();
  }
}
