import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier {
  bool isDark = false;
  String lang = "en";

  toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
