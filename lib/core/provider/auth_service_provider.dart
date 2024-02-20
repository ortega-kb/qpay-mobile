import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/network/service/auth_service.dart';
import 'package:qpay/core/network/service/auth_service_impl.dart';
import 'package:qpay/core/provider/firebase_auth_provider.dart';

final authServiceProvider = Provider<AuthService>(
    (ref) => AuthServiceImpl(ref.watch(firebaseAuthProvider)));
