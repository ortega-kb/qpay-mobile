import 'package:fpdart/fpdart.dart';
import 'package:qpay/core/shared/entities/user.dart';

import '../../../../core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signInWithPhoneAndPassword({
    required String phone,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithPhoneAndPassword({
    required String phone,
    required String email,
    required String fullName,
    required String password,
    required String dateOfBirth,
  });

  Future<void> logout();
}
