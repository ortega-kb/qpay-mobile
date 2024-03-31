import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/user_repository_impl.dart';
import 'package:qpay/core/domain/repository/user_repository.dart';
import 'package:qpay/core/provider/user_service_provider.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(userService: ref.watch(userServiceProvider)));
