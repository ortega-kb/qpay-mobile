import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/shared/entities/user.dart';

class SignUpUseCase implements UseCase<User, SignUpParams> {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(SignUpParams params) async {
    return await _authRepository.signUpWithPhoneAndPassword(
      phone: params.phone,
      email: params.email,
      fullName: params.fullName,
      password: params.password,
      accountType: params.accountType,
    );
  }
}

class SignUpParams {
  final String phone;
  final String email;
  final String fullName;
  final String password;
  final String accountType;

  SignUpParams({
    required this.phone,
    required this.email,
    required this.fullName,
    required this.password,
    required this.accountType,
  });
}
