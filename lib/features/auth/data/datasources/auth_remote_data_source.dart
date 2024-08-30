import 'package:flutter/material.dart';
import 'package:qpay/core/errors/exception.dart';
import 'package:qpay/core/shared/services/user_information_service.dart';
import 'package:qpay/core/utils/code_generator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/constants.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithPhoneAndPassword({
    required String phone,
    required String email,
    required String fullName,
    required String password,
    required String accountType,
  });

  Future<UserModel> signInWithPhoneAndPassword({
    required String phone,
    required String password,
  });

  Future<UserModel> verifyOTP({required String otp, required String phone});

  Future<String> resendOTP({required String phone});

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  final UserInformationService _userInformationService;

  AuthRemoteDataSourceImpl(this._supabaseClient, this._userInformationService);

  @override
  Future<UserModel> signInWithPhoneAndPassword({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        phone: '243$phone',
        password: password,
      );

      if (response.user == null) {
        throw const ServerException(Constants.userIsNull);
      }

      final userRegistered = response.user!.toJson();
      _userInformationService.storeUserInformation(userRegistered);

      return UserModel.fromJson(userRegistered);
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithPhoneAndPassword({
    required String phone,
    required String email,
    required String fullName,
    required String password,
    required String accountType,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        phone: '243$phone',
        password: password,
        data: {
          "user_code": CodeGenerator.userCode(),
          "full_name": fullName,
          "email": email,
          "account_type": accountType
        },
      );

      final userAlreadyRegistered =
          _checkRegisteredAccount(response.user!.toJson());
      if (userAlreadyRegistered) {
        throw AuthException('User already registered');
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> verifyOTP({
    required String otp,
    required String phone,
  }) async {
    try {
      final response = await _supabaseClient.auth.verifyOTP(
        token: otp,
        type: OtpType.sms,
        phone: '243$phone',
      );

      if (response.user == null) {
        throw const ServerException(Constants.userIsNull);
      }

      debugPrint(response.user!.toJson().toString());
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> resendOTP({
    required String phone,
  }) async {
    try {
      final response = await _supabaseClient.auth.resend(
        type: OtpType.sms,
        phone: '243$phone',
      );
      if (response.messageId == null) {
        throw const ServerException(Constants.somethingWrong);
      }

      return response.messageId!;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut(scope: SignOutScope.local);
  }

  bool _checkRegisteredAccount(Map<String, dynamic> json) {
    return (json['identities'] as List).isEmpty ? true : false;
  }
}
