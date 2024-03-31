import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/domain/repository/storage_repository.dart';
import 'package:qpay/core/provider/storage_repository_provider.dart';
import 'package:qpay/feature/upload_picture/upload_picture_state.dart';

final uploadPictureViewModel =
    StateNotifierProvider<UploadPictureViewModel, UploadPictureState>(
        (ref) => UploadPictureViewModel(ref.watch(storageRepositoryProvider)));

class UploadPictureViewModel extends StateNotifier<UploadPictureState> {
  UploadPictureViewModel(this._storageRepository)
      : super(UploadPictureState.initial());
  final StorageRepository _storageRepository;

  Future<void> uploadFile(File file) async {
    state = UploadPictureState.loading();

    try {
      await _storageRepository.uploadFile(
        file: file,
        onSuccess: () {
          state = UploadPictureState.success("");
        },
        onError: (err) {
          state = UploadPictureState.error(err);
        },
      );
    } catch (e) {
      state = UploadPictureState.error(e.toString());
    }
  }
}
