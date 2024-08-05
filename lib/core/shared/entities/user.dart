import 'package:qpay/core/utils/account_type.dart';

class User {
  final String? id;
  final String fullName;
  final String? email;
  final String password;
  final String phone;
  final AccountType accountType;
  final DateTime? createdAt;

  User({
    this.id,
    this.email,
    this.createdAt,
    required this.accountType,
    required this.fullName,
    required this.password,
    required this.phone,
  });
}

