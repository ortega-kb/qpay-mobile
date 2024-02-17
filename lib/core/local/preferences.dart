import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late SharedPreferences _prefs;

  Future<SharedPreferences> instance() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }
}
