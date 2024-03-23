import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/network/service/storage_service.dart';
import 'package:qpay/core/network/service/storage_service_impl.dart';
import 'package:qpay/core/provider/firebase_storage_provider.dart';

final storageServiceProvider = Provider<StorageService>(
    (ref) => StorageServiceImpl(ref.watch(firebaseStorageProvider)));
