
class Wallet {
  final String? id;
  final String userId;
  final String providerType;
  final String walletPhone;
  final DateTime? createdAt;

  Wallet({
    this.id,
    this.createdAt,
    required this.userId,
    required this.providerType,
    required this.walletPhone,
  });
}