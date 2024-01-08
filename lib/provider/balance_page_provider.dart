import 'package:flutter/cupertino.dart';

class BalancePageProvider with ChangeNotifier {

  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  bool _showBalance = false;
  bool get showBalance => _showBalance;


  void setPage(value) {
    _selectedPage = value;
    notifyListeners();
  }

  void onClickShow(value) {
    _showBalance = value;
    notifyListeners();
  }

}
