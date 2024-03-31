import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/feature/verification/verification_state.dart';

import '../../core/domain/repository/auth_repository.dart';
import '../../core/provider/auth_repository_provider.dart';

final verificationViewModelProvider =
    StateNotifierProvider<VerificationViewModel, VerificationState>(
        (ref) => VerificationViewModel(ref.watch(authRepositoryProvider)));

class VerificationViewModel extends StateNotifier<VerificationState> {
  VerificationViewModel(this._authRepository)
      : super(VerificationState.initial());

  final AuthRepository _authRepository;

  Future<void> loginWithOtp(
      {required String otp, required String verificationId}) async {
    state = const VerificationState.loading();

    await _authRepository.loginWithOtp(
      otp: otp,
      verificationId: verificationId,
      onSuccess: () {
        state = const VerificationState.success();
      },
      onError: (error) {
        state = VerificationState.error(error);
      },
    );
  }
}
