import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/network/service/user_service.dart';
import 'package:qpay/core/network/service/user_service_impl.dart';
import 'package:qpay/core/provider/firebase_firestore_provider.dart';

final userServiceProvider = Provider<UserService>(
    (ref) => UserServiceImpl(ref.watch(firebaseFirestoreProvider)));
