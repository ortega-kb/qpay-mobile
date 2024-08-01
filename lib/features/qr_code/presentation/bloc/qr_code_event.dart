part of 'qr_code_bloc.dart';

sealed class QRCodeEvent extends Equatable {
  const QRCodeEvent();
}

final class GetAllQRStatic extends QRCodeEvent {
  @override
  List<Object?> get props => [];
}

final class AddQRStaticEvent extends QRCodeEvent {
  final String account;
  final double amount;
  final String motif;
  final String currency;

  const AddQRStaticEvent(
    this.account,
    this.amount,
    this.motif,
    this.currency,
  );

  @override
  List<Object?> get props => [account, amount, motif, currency];
}

final class DeleteQRStaticEvent extends QRCodeEvent {
  final int index;
  const DeleteQRStaticEvent(this.index);

  @override
  List<Object?> get props => [index];
}
