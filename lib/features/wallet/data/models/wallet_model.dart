import 'package:qpay/features/wallet/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    super.id,
    super.createdAt,
    super.balance,
    required super.userId,
    required super.userCode,
    required super.walletPin,
    required super.walletPhone,
    required super.providerType,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      userCode: json['user_code'],
      walletPin: json['wallet_pin'],
      providerType: json['provider_type'],
      walletPhone: json['wallet_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'provider_type': providerType,
      'user_code': userCode,
      'wallet_phone': walletPhone,
      'wallet_pin': walletPin,
    };
  }

  WalletModel copyWith({
    String? id,
    DateTime? createdAt,
    String? walletPin,
    String? userId,
    double? balance,
    String? userCode,
    String? providerType,
    String? walletPhone,
  }) {
    return WalletModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      userCode: userCode ?? this.userCode,
      walletPin: walletPin ?? this.walletPin,
      createdAt: createdAt ?? this.createdAt,
      walletPhone: walletPhone ?? this.walletPhone,
      providerType: providerType ?? this.providerType,
    );
  }
}
