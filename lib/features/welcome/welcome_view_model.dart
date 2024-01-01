import 'package:flutter/cupertino.dart';

class WelcomeViewModel with ChangeNotifier {

  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  void setPage(value) {
    _selectedPage = value;
    notifyListeners();
  }

}