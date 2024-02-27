import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  French(name: "Français", code: "fr"),
  English(name: "English", code: "en");

  const Language({required this.name, required this.code});

  final String name;
  final String code;
}

final languageProvider = StateProvider<Language>((ref) => Language.French);
