
import 'package:qpay/core/utils/enums/operation_type.dart';

class TransactionResponse {
  final String code;
  final double? amount;
  final String type;
  final String? wallet;

  TransactionResponse({
    required this.code,
    required this.amount,
    required this.type,
    required this.wallet,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      code: json['code'],
      amount: json['at'] as double?,
      type: json['type'],
      wallet: json['wt'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'code': code,
      'at': amount,
      'type': OperationType.PAYMENT.name,
      'wt': wallet,
    };

    return map;
  }
}
