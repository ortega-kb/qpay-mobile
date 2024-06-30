import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/shared/entities/user.dart';

class SignInUseCase implements UseCase<User, SignInParams> {
  final AuthRepository authRepository;

  const SignInUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> invoke(SignInParams params) async {
    return await authRepository.signInWithPhoneAndPassword(
      phone: params.phone,
      password: params.password,
    );
  }
}

class SignInParams {
  final String phone;
  final String password;

  SignInParams({required this.phone, required this.password});
}
