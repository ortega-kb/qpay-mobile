import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:qpay/data/services/auth_service.dart';
import 'package:qpay/routing/app_routes.dart';

class Wrapper {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isLogged() async {
    try {
      final User? user = await _firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }
}

