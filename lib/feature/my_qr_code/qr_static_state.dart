import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';

part 'qr_static_state.freezed.dart';

@freezed
abstract class QRStaticState with _$QRStaticState {
  factory QRStaticState({
    @Default([]) List<QRStatic> qrStatic,
    @Default(true) bool isLoading,
  }) = _QRStaticState;
}
