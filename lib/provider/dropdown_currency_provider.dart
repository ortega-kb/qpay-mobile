import 'package:flutter/foundation.dart';
import 'package:qpay/utils/enums/currency.dart';

class DropdownCurrencyProvider with ChangeNotifier {

  Currency _selectedCurrency = Currency.CDF;
  Currency get selectedCurrency => _selectedCurrency;

  void onClickChangeCurrency(value) {
    _selectedCurrency = value;
    notifyListeners();
  }

}