import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/feature/home/home_screen.dart';
import 'package:qpay/feature/language/language_screen.dart';
import 'package:qpay/wrapper_view_model.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(wrapperViewModelProvider.notifier).isLoggedIn();
    return ref.watch(wrapperViewModelProvider)
        ? HomeScreen()
        : LanguageScreen();
  }
}
