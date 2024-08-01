part of 'qr_code_bloc.dart';

sealed class QRCodeState extends Equatable {
  const QRCodeState();
}

final class QRCodeInitial extends QRCodeState {
  @override
  List<Object> get props => [];
}

final class QRStaticLoadingState extends QRCodeState {
  @override
  List<Object?> get props => [];
}

final class QRStaticLoadedState extends QRCodeState {
  final List<QRStatic> qrStatics;
  const QRStaticLoadedState(this.qrStatics);

  @override
  List<Object?> get props => [qrStatics];

}