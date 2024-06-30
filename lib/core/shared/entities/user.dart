class User {
  final String? id;
  final String fullName;
  final String? email;
  final String password;
  final String phone;
  final String dateOfBirth;
  final DateTime? createdAt;

  User({
    this.id,
    this.email,
    this.createdAt,
    required this.fullName,
    required this.password,
    required this.phone,
    required this.dateOfBirth
  });
}

