import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_static_state.freezed.dart';

@freezed
abstract class QRStaticState with _$QRStaticState {
  const factory QRStaticState.initial() = Initial;
  const factory QRStaticState.loading() = Loading;
  const factory QRStaticState.error(String e) = Error;
  const factory QRStaticState.success(String e) = Success;
}
