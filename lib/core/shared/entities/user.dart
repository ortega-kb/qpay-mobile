
class User {
  final String? id;
  final String userCode;
  final String fullName;
  final String? email;
  final String password;
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
    required this.password,
    required this.phone,
  });
}

