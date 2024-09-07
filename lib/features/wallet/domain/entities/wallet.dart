
class Wallet {
  final String? id;
  final String userCode;
  final String providerType;
  final String walletPhone;
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
    required this.walletPin,
    required this.providerType,
    required this.walletPhone,
  });
}