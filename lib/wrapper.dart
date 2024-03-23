import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/feature/language/language_screen.dart';
import 'package:qpay/feature/type_of_account/type_of_account.dart';
import 'package:qpay/wrapper_view_model.dart';

/// Class Wrapper
/// Check if current user is authenticated, redirect to principal screen
/// If not authenticated, redirect to first screen of application
class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(wrapperViewModelProvider.notifier).isLoggedIn();
    return ref.watch(wrapperViewModelProvider)
        ? TypeOfAccount()
        : LanguageScreen();
  }
}
