import 'dart:io';

abstract class StorageRepository {
  Future<void> uploadFile({
    required File file,
    required Function() onSuccess,
    required Function(String err) onError,
  });

  Future<void> deleteFile({
    required String fileName,
    required Function() onSuccess,
    required Function(String err) onError,
  });

  Future<void> downloadURL({
    required String fileName,
    required Function(String s) onSuccess,
    required Function(String err) onError,
  });
}
