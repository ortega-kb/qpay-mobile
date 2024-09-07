import 'package:qpay/features/wallet/domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    super.id,
    super.createdAt,
    super.balance,
    required super.defaultWallet,
    required super.userCode,
    required super.walletPin,
    required super.walletName,
    required super.walletPhone,
    required super.providerType,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      userCode: json['user_code'],
      walletName: json['wallet_name'],
      defaultWallet: json['default_wallet'],
      walletPin: json['wallet_pin'],
      providerType: json['provider_type'],
      walletPhone: json['wallet_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider_type': providerType,
      'user_code': userCode,
      'wallet_phone': walletPhone,
      'wallet_name': walletName,
      'wallet_pin': walletPin,
      'default_wallet': false
    };
  }

  WalletModel copyWith({
    String? id,
    DateTime? createdAt,
    String? walletPin,
    double? balance,
    String? userCode,
    String? walletName,
    bool? defaultWallet,
    String? providerType,
    String? walletPhone,
  }) {
    return WalletModel(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      userCode: userCode ?? this.userCode,
      walletPin: walletPin ?? this.walletPin,
      createdAt: createdAt ?? this.createdAt,
      walletPhone: walletPhone ?? this.walletPhone,
      walletName: walletName ?? this.walletName,
      providerType: providerType ?? this.providerType,
      defaultWallet: defaultWallet ?? this.defaultWallet,
    );
  }
}
