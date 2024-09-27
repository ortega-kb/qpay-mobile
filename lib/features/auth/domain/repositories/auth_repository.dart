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
    required String accountType,
  });

  Future<Either<Failure, User>> verifyOTP({
    required String otp,
    required String phone,
  });

  Future<Either<Failure, String>> resendOTP({
    required String phone,
  });

  Future<Either<Failure, void>> logout();
}
