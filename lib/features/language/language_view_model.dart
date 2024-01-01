import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_locales/flutter_locales.dart';

class LanguageViewModel with ChangeNotifier {

  final List _localesCode = ['fr', 'en'];

  int _selectedLanguage = 0;
  int get selectedLanguage => _selectedLanguage;

  void setLanguage(BuildContext context, int value) {
    _selectedLanguage = value;
    _changeLanguage(context, _localesCode[value]);

    notifyListeners();
  }

  void _changeLanguage(BuildContext context, String lang) => Locales.change(context, lang);
}