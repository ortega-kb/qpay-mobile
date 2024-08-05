import 'package:qpay/core/shared/entities/user.dart';
import 'package:qpay/core/utils/account_type.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.email,
    required super.phone,
    required super.fullName,
    required super.password,
    required super.accountType,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      fullName: json['fullName'],
      password: json['password'],
      accountType: json['accountType'],
      createdAt: json['createdAt'],
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    String? fullName,
    String? password,
    AccountType? accountType,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      accountType: accountType ?? this.accountType,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}