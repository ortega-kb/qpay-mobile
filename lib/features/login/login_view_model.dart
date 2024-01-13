import 'package:flutter/foundation.dart';
import 'package:qpay/data/services/auth_service.dart';

class LoginViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    _setLoading(true);
    final auth = await _authService.signInWithEmailAndPassword(email, password);

    if (auth != null) {
      _setLoading(false);
      return true;
    } else {
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

}