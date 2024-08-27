import 'package:qpay/core/shared/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.email,
    required super.userCode,
    required super.phone,
    required super.fullName,
    required super.password,
    required super.accountType,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userCode: json['user_metadata']['user_code'],
      email: json['email'] ?? '',
      phone: json['phone'],
      fullName: json['user_metadata']['full_name'],
      password: json['password'] ?? '',
      accountType: json['user_metadata']['account_type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    String? userCode,
    String? fullName,
    String? password,
    String? accountType,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userCode: userCode ?? this.userCode,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      accountType: accountType ?? this.accountType,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
