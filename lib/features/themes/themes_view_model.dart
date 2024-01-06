import 'package:flutter/material.dart';

class ThemesViewModel with ChangeNotifier {


  ThemeMode _selectedTheme = ThemeMode.system;
  ThemeMode get selectedTheme => _selectedTheme;

  void setTheme(value) {
    _selectedTheme = value;
    notifyListeners();
  }

}