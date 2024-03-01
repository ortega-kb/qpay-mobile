import 'package:firebase_auth/firebase_auth.dart';
import 'package:qpay/core/network/service/auth_service.dart';

class AuthServiceImpl extends AuthService {
  AuthServiceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verification) onCodeSent,
    required Function(String error) onError,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
          timeout: Duration(seconds: 20),
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            return;
          },
          verificationFailed: (error) {
            return;
          },
          codeSent: (verificationId, resendToken) async {
            onCodeSent(verificationId);
          },
          codeAutoRetrievalTimeout: (verificationId) {
            return;
          },
        )
        .timeout(Duration(seconds: 20))
        .onError((error, stackTrace) => onError(error.toString()));
  }

  @override
  Future<void> loginWithOtp({
    required String otp,
    required String verificationId,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      final user = await _firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        onSuccess();
        logout();
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message.toString());
    } catch (e) {
      onError(e.toString());
    }
  }

  @override
  Future logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    // debugPrint('[+] ${user?.phoneNumber.toString()}');
    return user != null;
  }
}
