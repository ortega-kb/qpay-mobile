import 'package:flutter/cupertino.dart';

class SoldProvider with ChangeNotifier {

  bool _show = false;
  bool get show => _show;

  int _selectedPage = 0;
  int get selectedPage => _selectedPage;


  void setPage(value) {
    _selectedPage = value;
    notifyListeners();
  }

}
