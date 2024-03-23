import 'package:qpay/core/domain/model/user_model.dart';

abstract class UserService {
  Future<void> createUser({
    required UserModel userModel,
    required Function() onSuccess,
    required Function(String) onError,
  });
}
