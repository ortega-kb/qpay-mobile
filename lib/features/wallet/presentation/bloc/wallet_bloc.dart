import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qpay/features/wallet/domain/usecases/usecases.dart';

import '../../domain/entities/wallet.dart';


part 'wallet_event.dart';

part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final AddWalletUseCase _addWalletUseCase;
  final ChooseDefaultWalletUseCase _chooseDefaultWalletUseCase;
  final DeleteWalletUseCase _deleteWalletUseCase;
  final GetWalletsByUserCodeUseCase _getWalletsByUserCodeUseCase;

  WalletBloc({
    required AddWalletUseCase addWalletUseCase,
    required ChooseDefaultWalletUseCase chooseDefaultWalletUseCase,
    required DeleteWalletUseCase deleteWalletUseCase,
    required GetWalletsByUserCodeUseCase getWalletsByUserCodeUseCase,
  })  : _addWalletUseCase = addWalletUseCase,
        _getWalletsByUserCodeUseCase = getWalletsByUserCodeUseCase,
        _chooseDefaultWalletUseCase = chooseDefaultWalletUseCase,
        _deleteWalletUseCase = deleteWalletUseCase,
        super(WalletInitial()) {
    on<WalletEvent>((event, emit) {});

    on<WalletAddEvent>(addWallet);
    on<WalletChooseDefaultEvent>(chooseDefaultWallet);
    on<WalletDeleteEvent>(deleteWallet);
    on<WalletGetByUserCodeEvent>(getWalletsByUserCode);
  }

  Future<void> addWallet(
    WalletAddEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoadingState());
    final response = await _addWalletUseCase.call(
      AddWalletParams(
          providerType: event.providerType,
          userCode: event.userCode,
          walletPhone: event.walletPhone,
          walletPin: event.walletPin,
          defaultWallet: event.defaultWallet,
          walletName: event.walletPhone),
    );

    response.fold(
      (err) => emit(WalletAddErrorState(err.message)),
      (wallet) => emit(WalletAddSuccessState(wallet)),
    );
  }

  Future<void> chooseDefaultWallet(
    WalletChooseDefaultEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoadingState());
    final response = await _chooseDefaultWalletUseCase.call(
      ChooseDefaultWalletParams(
        walletId: event.walletId,
        userCode: event.userCode,
      ),
    );

    response.fold(
      (err) => emit(WalletChooseErrorState(err.message)),
      (wallet) => emit(WalletChooseDefaultSuccessState(wallet)),
    );
  }

  Future<void> deleteWallet(
    WalletDeleteEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoadingState());
    final response = await _deleteWalletUseCase.call(
      DeleteWalletParams(walletId: event.walletId),
    );

    response.fold(
      (err) => emit(WalletDeletedErrorState(err.message)),
      (deleted) => emit(WalletDeletedSuccessState(deleted)),
    );
  }

  Future<void> getWalletsByUserCode(
    WalletGetByUserCodeEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoadingState());
    final response = await _getWalletsByUserCodeUseCase.call(
      GetWalletsByUserParams(userCode: event.userCode),
    );

    response.fold(
      (err) => emit(WalletLoadErrorState(err.message)),
      (wallets) => emit(WalletLoadedState(wallets)),
    );
  }
}
