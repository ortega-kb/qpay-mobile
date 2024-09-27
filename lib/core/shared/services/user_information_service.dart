import 'package:qpay/core/shared/services/shared_preferences_service.dart';
import 'package:qpay/features/auth/data/models/user_model.dart';

class UserInformationService {
  final SharedPreferencesService _sharedPreferencesService;
  UserInformationService(this._sharedPreferencesService);

  Future<void> storeUserInformation(Map<String, dynamic> json) async {
    UserModel userModel = UserModel.fromJson(json);

    // Store user information in shared preferences
    _sharedPreferencesService.username = userModel.fullName;
    _sharedPreferencesService.userId = userModel.id!;
    _sharedPreferencesService.userCode = userModel.userCode;
    _sharedPreferencesService.accountType = userModel.accountType;
    _sharedPreferencesService.phoneNumber = userModel.phone;
    _sharedPreferencesService.userCreatedAt = userModel.createdAt!.toIso8601String();

    // Set authenticated to true
    _sharedPreferencesService.userAuthenticated = true;
  }

  void clear() => _sharedPreferencesService.clear();

  String get username => _sharedPreferencesService.username;
  String get userId => _sharedPreferencesService.userId;
  String get userCode => _sharedPreferencesService.userCode;
  String get accountType => _sharedPreferencesService.accountType;
  String get userCreatedAt => _sharedPreferencesService.userCreatedAt;
  String get phoneNumber => _sharedPreferencesService.phoneNumber;

}