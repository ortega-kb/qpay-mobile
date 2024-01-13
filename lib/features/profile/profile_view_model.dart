import 'package:flutter/foundation.dart';
import 'package:qpay/data/services/auth_service.dart';

class ProfileViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();

  void logout() async {
    await _authService.signOut();
  }

}