
class Wallet {
  final String? id;
  final String userCode;
  final String providerType;
  final String walletPhone;
  final String? walletName;
  final String walletPin;
  final bool defaultWallet;
  final double? balance;
  final DateTime? createdAt;

  Wallet({
    this.id,
    this.createdAt,
    this.balance,
    required this.userCode,
    required this.defaultWallet,
    required this.walletName,
    required this.walletPin,
    required this.providerType,
    required this.walletPhone,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      walletName: json['wallet_name'],
      balance: json['balance'] == null ? null : double.parse(json['balance']),
      userCode: json['user_code'],
      defaultWallet: json['default_wallet'],
      walletPin: json['wallet_pin'],
      providerType: json['provider_type'],
      walletPhone: json['wallet_phone'],
    );
  }

  Map<String, dynamic> toParcelable() {
    return {
      'id': id,
      'created_at': createdAt!.toIso8601String(),
      'balance': balance,
      'user_code': userCode,
      'default_wallet': defaultWallet,
      'wallet_pin': walletPin,
      'provider_type': providerType,
      'wallet_phone': walletPhone,
    };
  }
}