import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:qpay/core/network/service/storage_service.dart';
import 'package:uuid/uuid.dart';

class StorageServiceImpl extends StorageService {
  StorageServiceImpl(this._firebaseStorage);

  final FirebaseStorage _firebaseStorage;

  @override
  Future<void> uploadFile({
    required File file,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    String fileName = Uuid().v4().toString();
    await _firebaseStorage
        .ref()
        .child(fileName)
        .putFile(file)
        .onError((error, stackTrace) => onError(error.toString()))
        .whenComplete(() => onSuccess);
  }

  @override
  Future<void> deleteFile({
    required String fileName,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    await _firebaseStorage
        .ref()
        .child(fileName)
        .delete()
        .onError((error, stackTrace) => onError(error.toString()))
        .whenComplete(() => onSuccess);
  }

  @override
  Future<void> downloadURL({
    required String fileName,
    required Function(String s) onSuccess,
    required Function(String err) onError,
  }) async {
    await _firebaseStorage
        .ref()
        .child(fileName)
        .getDownloadURL()
        .then((value) => onSuccess(value))
        .onError((error, stackTrace) => onError(error.toString()));
  }
}
