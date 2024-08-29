
class Wallet {
  final String? id;
  final String userId;
  final String providerType;
  final String walletPhone;
  final String walletPin;
  final DateTime? createdAt;

  Wallet({
    this.id,
    this.createdAt,
    required this.userId,
    required this.walletPin,
    required this.providerType,
    required this.walletPhone,
  });
}