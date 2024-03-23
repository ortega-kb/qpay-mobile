import 'dart:io';

abstract class StorageService {
  Future<void> uploadFile({
    required File file,
    required Function() onSuccess,
    required Function(String) onError,
  });

  Future<void> deleteFile({
    required String fileName,
    required Function() onSuccess,
    required Function(String) onError,
  });

  Future<void> downloadURL({
    required String fileName,
    required Function(String) onSuccess,
    required Function(String) onError,
  });
}
