import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/shared/entities/user.dart';

class SignUpUseCase implements UseCase<User, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> invoke(SignUpParams params) async {
    return await authRepository.signUpWithPhoneAndPassword(
      phone: params.phone,
      email: params.email,
      fullName: params.fullName,
      password: params.password,
      dateOfBirth: params.dateOfBirth,
    );
  }
}

class SignUpParams {
  final String phone;
  final String email;
  final String fullName;
  final String password;
  final String dateOfBirth;

  SignUpParams({
    required this.phone,
    required this.email,
    required this.fullName,
    required this.password,
    required this.dateOfBirth,
  });
}
