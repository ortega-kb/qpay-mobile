import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

class ResendOtpCodeUseCase implements UseCase<String, ResendOtpCodeParams> {
  final AuthRepository _authRepository;
  ResendOtpCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure, String>> call(ResendOtpCodeParams params) async {
    return _authRepository.resendOTP(phone: params.phone);
  }
}

class ResendOtpCodeParams {
  final String phone;
  ResendOtpCodeParams(this.phone);
}
