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
    _sharedPreferencesService.userCreatedAt = userModel.createdAt!.toIso8601String();

    // Set authenticated to true
    _sharedPreferencesService.userAuthenticated = true;
  }
}