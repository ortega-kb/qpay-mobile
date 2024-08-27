import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/shared/entities/user.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

class VerifyPhoneUseCase implements UseCase<User, VerifyPhoneParams> {
  final AuthRepository _authRepository;
  VerifyPhoneUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(VerifyPhoneParams params) async {
    return _authRepository.verifyOTP(otp: params.otp, phone: params.phone);
  }
}

class VerifyPhoneParams {
  String phone;
  String otp;

  VerifyPhoneParams({
    required this.phone,
    required this.otp,
  });
}
