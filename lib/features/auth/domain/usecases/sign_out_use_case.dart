import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository _authRepository;

  const SignOutUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.logout();
  }

}