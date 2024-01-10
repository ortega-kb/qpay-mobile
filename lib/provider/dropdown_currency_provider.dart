import 'package:flutter/foundation.dart';
import 'package:qpay/utils/enums/currency.dart';

class DropdownCurrencyProvider with ChangeNotifier {

  final currencies = [Currency.CDF, Currency.USD];

  Currency _selectedCurrency = Currency.CDF;
  Currency get selectedCurrency => _selectedCurrency;

  void onChangeCurrency(value) {
    _selectedCurrency = value;
    notifyListeners();
  }

}