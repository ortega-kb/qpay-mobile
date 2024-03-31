abstract class AuthRepository {
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String) onCodeSent,
    required Function(String) onError,
  });

  Future<void> loginWithOtp({
    required String otp,
    required String verificationId,
    required Function() onSuccess,
    required Function(String) onError,
  });

  Future<void> logout();
  Future<bool> isLoggedIn();
}
