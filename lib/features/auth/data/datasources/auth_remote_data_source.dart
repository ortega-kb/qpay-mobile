import 'package:qpay/core/errors/exception.dart';
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

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInWithPhoneAndPassword({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        phone: phone,
        password: password,
      );

      if (response.user != null) {
        throw const ServerException(Constants.userIsNull);
      }

      return UserModel.fromJson(response.user!.toJson());
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
      final response = await supabaseClient.auth.signUp(
        phone: phone,
        password: password,
        data: {
          "userCode": CodeGenerator.userCode(),
          "fullName": fullName,
          "email": email,
          "accountType": accountType
        },
      );

      if (response.user != null) {
        throw const ServerException(Constants.userIsNull);
      }

      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await supabaseClient.auth.signOut(scope: SignOutScope.local);
  }
}
