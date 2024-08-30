
class Wallet {
  final String? id;
  final String userId;
  final String userCode;
  final String providerType;
  final String walletPhone;
  final String walletPin;
  final double? balance;
  final DateTime? createdAt;

  Wallet({
    this.id,
    this.createdAt,
    this.balance,
    required this.userId,
    required this.userCode,
    required this.walletPin,
    required this.providerType,
    required this.walletPhone,
  });
}