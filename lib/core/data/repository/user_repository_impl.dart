import 'package:qpay/core/data/repository/user_repository.dart';
import 'package:qpay/core/domain/model/user_model.dart';
import 'package:qpay/core/network/service/user_service.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserService userService})
      : _userService = userService;

  final UserService _userService;

  @override
  Future<void> createUser({
    required UserModel userModel,
    required Function() onSuccess,
    required Function(String p1) onError,
  }) async {
    await _userService.createUser(
      userModel: userModel,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
