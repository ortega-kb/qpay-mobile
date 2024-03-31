import 'package:hive/hive.dart';
import 'package:qpay/core/domain/entity/qr_static.dart';

import '../../utils/enums/currency.dart';

part 'qr_static_model.g.dart';

@HiveType(typeId: 0)
class QRStaticModel {
  @HiveField(0)
  final String account;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final String motif;
  @HiveField(4)
  final Currency currency;

  QRStaticModel({
    required this.account,
    required this.amount,
    required this.motif,
    required this.currency,
  });

  factory QRStaticModel.fromEntity(QRStatic qrStatic) => QRStaticModel(
        account: qrStatic.account,
        amount: qrStatic.amount,
        motif: qrStatic.motif,
        currency: qrStatic.currency,
      );

  QRStatic toEntity() => QRStatic(
        account: account,
        amount: amount,
        motif: motif,
        currency: currency,
      );
}
