import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {

  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  void setPage(value) {
    _selectedPage = value;
    notifyListeners();
  }

}