import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/storage_repository.dart';
import 'package:qpay/core/data/repository/storage_repository_impl.dart';
import 'package:qpay/core/provider/storage_service_provider.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) =>
    StorageRepositoryImpl(storageService: ref.watch(storageServiceProvider)));
