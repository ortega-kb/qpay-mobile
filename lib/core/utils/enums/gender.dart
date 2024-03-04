import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Gender {
  M(value: "M"),
  F(value: "F");

  const Gender({required this.value});
  final String value;
}

final genderProvider = StateProvider<Gender>((ref) => Gender.M);
