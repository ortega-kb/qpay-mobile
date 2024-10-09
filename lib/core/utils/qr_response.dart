
import 'package:qpay/core/utils/enums/operation_type.dart';

class TransactionResponse {
  final String code;
  final double? amount;
  final String type;
  final String? wallet;
  final String? description;

  TransactionResponse({
    required this.code,
    required this.amount,
    required this.type,
    required this.wallet,
    this.description
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      code: json['code'],
      amount: json['at'] as double?,
      type: json['type'],
      wallet: json['wt'],
      description: json['desc']
    );
  }

  Map<String, dynamic> toJson() {
    final map = {
      'code': code,
      'at': amount,
      'type': OperationType.PAYMENT.name,
      'wt': wallet,
      'desc': description
    };

    return map;
  }
}
