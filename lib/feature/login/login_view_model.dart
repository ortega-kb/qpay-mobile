import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/feature/login/login_state.dart';

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
        (ref) => LoginViewModel());

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState.initial());

  Future<void> login(String phoneNumber) async {
    state = const LoginState.loading();
    await Future.delayed(Duration(seconds: 5));

    state = const LoginState.success();
  }
}
