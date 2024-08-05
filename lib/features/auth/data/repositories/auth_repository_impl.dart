import 'package:fpdart/src/either.dart';
import 'package:qpay/core/shared/entities/user.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/errors/exception.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<void> logout() async {
    await authRemoteDataSource.signOut();
  }

  @override
  Future<Either<Failure, User>> signInWithPhoneAndPassword({
    required String phone,
    required String password,
  }) async {
    return _user(
      func: () async => authRemoteDataSource.signInWithPhoneAndPassword(
        phone: phone,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithPhoneAndPassword({
    required String phone,
    required String email,
    required String fullName,
    required String password,
    required String accountType,
  }) async {
    return _user(
      func: () async => authRemoteDataSource.signUpWithPhoneAndPassword(
        phone: phone,
        email: email,
        fullName: fullName,
        password: password,
        accountType: accountType,
      ),
    );
  }

  Future<Either<Failure, User>> _user({
    required Future<User> Function() func,
  }) async {
    try {
      final user = await func();

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
