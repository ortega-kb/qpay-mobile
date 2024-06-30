import 'package:qpay/core/shared/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.id,
    super.email,
    required super.phone,
    required super.fullName,
    required super.password,
    required super.dateOfBirth,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      fullName: json['fullName'],
      password: json['password'],
      dateOfBirth: json['dateOfBirth'],
      createdAt: json['createdAt'],
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    String? fullName,
    String? password,
    String? dateOfBirth,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}