import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_picture_state.freezed.dart';

@freezed
abstract class UploadPictureState with _$UploadPictureState {
  const factory UploadPictureState.initial() = Initial;
  const factory UploadPictureState.loading() = Loading;
  const factory UploadPictureState.error(String err) = Error;
  const factory UploadPictureState.success(String s) = Success;
}
