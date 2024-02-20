import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/data/repository/auth_repository.dart';
import 'package:qpay/core/provider/auth_repository_provider.dart';
import 'package:qpay/feature/register/register_state.dart';

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
        (ref) => RegisterViewModel(ref.watch(authRepositoryProvider)));

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel(this._authRepository) : super(RegisterState.initial());

  final AuthRepository _authRepository;

  Future<void> sendOtp(String phoneNumber) async {
    state = const RegisterState.loading();
    await _authRepository.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: (verificationId) {
        state = RegisterState.success(verificationId);
      },
      onError: (error) {
        state = RegisterState.error(error.toString());
      },
    );
  }
}
