import 'package:shared_preferences/shared_preferences.dart';

const _kUsernameKey = 'username';
const _kUserIdKey = 'userId';
const _kUserAuthenticatedKey = 'userAuthenticated';
const _kUserCodeKey = 'userCode';
const _kUserCreatedAt = 'userCreatedAt';
const _kAccountTypeKey = 'accountType';
const _kPhoneNumberKey = 'phoneNumber';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();
    
    _preferences = await SharedPreferences.getInstance();
    return _instance!;
  }

  // Private generic method for retrieving data from shared preferences
  dynamic _getData(String key) => _preferences.get(key);

  // Private method for saving data to shared preferences
  void _saveData(String key, dynamic value) {
    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  // Public methods for interacting with shared preferences
  String get username => _getData(_kUsernameKey) ?? '';
  set username(String value) => _saveData(_kUsernameKey, value);

  String get userId => _getData(_kUserIdKey) ?? '';
  set userId(String value) => _saveData(_kUserIdKey, value);

  bool get userAuthenticated => _getData(_kUserAuthenticatedKey) ?? false;
  set userAuthenticated(bool value) => _saveData(_kUserAuthenticatedKey, value);

  String get userCode => _getData(_kUserCodeKey) ?? '';
  set userCode(String value) => _saveData(_kUserCodeKey, value);

  String get accountType => _getData(_kAccountTypeKey) ?? '';
  set accountType(String value) => _saveData(_kAccountTypeKey, value);

  String get userCreatedAt => _getData(_kUserCreatedAt) ?? '';
  set userCreatedAt(String value) => _saveData(_kUserCreatedAt, value);

  String get phoneNumber => _getData(_kPhoneNumberKey) ?? '';
  set phoneNumber(String value) => _saveData(_kPhoneNumberKey, value);

  // Method for clearing all shared preferences
  void clear()  => _preferences.clear();
}
