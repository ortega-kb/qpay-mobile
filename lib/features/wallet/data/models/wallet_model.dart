import 'package:qpay/features/wallet/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    super.id,
    super.createdAt,
    required super.userId,
    required super.providerType,
    required super.walletPhone,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      providerType: json['provider_type'],
      walletPhone: json['wallet_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'provider_type': providerType,
      'wallet_phone': walletPhone,
    };
  }

  WalletModel copyWith({
    String? id,
    DateTime? createdAt,
    String? userId,
    String? providerType,
    String? walletPhone,
  }) {
    return WalletModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      providerType: providerType ?? this.providerType,
      walletPhone: walletPhone ?? this.walletPhone,
    );
  }
}
