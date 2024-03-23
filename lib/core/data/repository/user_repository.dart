import '../../domain/model/user_model.dart';

abstract class UserRepository {
  Future<void> createUser({
    required UserModel userModel,
    required Function() onSuccess,
    required Function(String) onError,
  });
}
