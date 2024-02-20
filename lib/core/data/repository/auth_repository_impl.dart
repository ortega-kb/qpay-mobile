import 'package:qpay/core/data/repository/auth_repository.dart';
import 'package:qpay/core/network/service/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthService authService})
      : _authService = authService;
  final AuthService _authService;

  @override
  Future<bool> isLoggedIn() async {
    return await _authService.isLoggedIn();
  }

  @override
  Future<void> loginWithOtp({
    required String otp,
    required String verificationId,
    required Function() onSuccess,
    required Function(String error) onError,
  }) async {
    await _authService.loginWithOtp(
      otp: otp,
      verificationId: verificationId,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }

  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verification) onCodeSent,
    required Function(String error) onError,
  }) async {
    await _authService.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: onCodeSent,
      onError: onError,
    );
  }
}
