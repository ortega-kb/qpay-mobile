import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/local/preferences.dart';

final preferencesProvider = Provider<Preferences>((ref) => Preferences());
