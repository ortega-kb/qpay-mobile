import 'package:flutter_riverpod/flutter_riverpod.dart';

final mPasswordFieldProvider =
    StateNotifierProvider<MPasswordFieldNotifier, bool>(
        (ref) => MPasswordFieldNotifier());

class MPasswordFieldNotifier extends StateNotifier<bool> {
  MPasswordFieldNotifier() : super(true);

  void setObscuredText(bool value) {
    state = value;
  }
}
