
import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier {

  int _selected = 0;
  int get selected => _selected;

  void setLanguage(value) {
    _selected = value;
    notifyListeners();
  }

}