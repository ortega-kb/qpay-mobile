import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/utils/enums/language.dart';

final languageProvider = StateProvider<Language>((ref) => Language.French);
