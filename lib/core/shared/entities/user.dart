
class User {
  final String? id;
  final String userCode;
  final String fullName;
  final String? email;
  final String pin;
  final String phone;
  final String accountType;
  final DateTime? createdAt;

  User({
    this.id,
    this.email,
    this.createdAt,
    required this.userCode,
    required this.accountType,
    required this.fullName,
    required this.pin,
    required this.phone,
  });
}

