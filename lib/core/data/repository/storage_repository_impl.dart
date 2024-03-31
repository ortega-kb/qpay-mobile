import 'dart:io';

import 'package:qpay/core/domain/repository/storage_repository.dart';
import 'package:qpay/core/network/service/storage_service.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({required StorageService storageService})
      : _storageService = storageService;

  final StorageService _storageService;

  @override
  Future<void> uploadFile({
    required File file,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    // compress file to get low size of image
    // convert file to Uint8List

    // if compress is not equal to null, then upload file
    // to firebase storage
    await _storageService.uploadFile(
      file: file,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  @override
  Future<void> deleteFile({
    required String fileName,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    await _storageService.deleteFile(
      fileName: fileName,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  @override
  Future<void> downloadURL({
    required String fileName,
    required Function(String s) onSuccess,
    required Function(String err) onError,
  }) async {
    await _storageService.downloadURL(
      fileName: fileName,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
