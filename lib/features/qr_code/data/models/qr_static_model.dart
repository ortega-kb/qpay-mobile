import 'package:hive/hive.dart';
import 'package:qpay/features/qr_code/domain/entities/qr_static.dart';

part 'qr_static_model.g.dart';

@HiveType(typeId: 0)
class QRStaticModel implements QRStatic {
  @HiveField(1)
  @override
  final String account;

  @HiveField(2)
  @override
  final double amount;

  @HiveField(3)
  @override
  final String motif;

  @HiveField(4)
  @override
  final String currency;

  QRStaticModel(
      {
      required this.account,
      required this.amount,
      required this.motif,
      required this.currency});

  factory QRStaticModel.fromEntity(QRStatic qrStatic) {
    return QRStaticModel(
      account: qrStatic.account,
      amount: qrStatic.amount,
      motif: qrStatic.motif,
      currency: qrStatic.currency,
    );
  }

  QRStatic toEntity() {
    return QRStatic(
      account: account,
      amount: amount,
      motif: motif,
      currency: currency,
    );
  }
}
