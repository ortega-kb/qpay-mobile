import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/auth_repository_impl.dart';
import 'package:qpay/core/domain/repository/auth_repository.dart';
import 'package:qpay/core/provider/auth_service_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(authService: ref.watch(authServiceProvider)));
