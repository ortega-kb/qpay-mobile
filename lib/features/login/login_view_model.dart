import 'package:flutter/foundation.dart';
import 'package:qpay/data/services/auth_service.dart';

class LoginViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    final auth = await _authService.signInWithEmailAndPassword(email, password);

    if (auth != null) return true;
    else return false;

  }

}