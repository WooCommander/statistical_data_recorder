import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  get themeData => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // Важно вызвать этот метод для обновления UI
  }
}
