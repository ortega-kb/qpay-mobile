import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/domain/repository/auth_repository.dart';
import 'package:qpay/core/provider/auth_repository_provider.dart';

final wrapperViewModelProvider = StateNotifierProvider<WrapperViewModel, bool>(
    (ref) => WrapperViewModel(ref.watch(authRepositoryProvider)));

class WrapperViewModel extends StateNotifier<bool> {
  WrapperViewModel(this._authRepository) : super(false);

  final AuthRepository _authRepository;

  Future<void> isLoggedIn() async {
    state = await _authRepository.isLoggedIn();
  }
}
