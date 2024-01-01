import 'package:flutter/foundation.dart';

class WelcomeProvider with ChangeNotifier {

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  int _currentPage = 0;
  int get currentPage => _currentPage;
  

  void setTheme(value) {
    _darkTheme = value;
    notifyListeners();
  }

  void setPage(value) {
    _currentPage = value;
    notifyListeners();
  }

}