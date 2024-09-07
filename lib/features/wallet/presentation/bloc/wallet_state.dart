part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();
}

final class WalletInitial extends WalletState {
  @override
  List<Object> get props => [];
}

final class WalletLoadingState extends WalletState {
  const WalletLoadingState();
  
  @override
  List<Object> get props => [];
}

final class WalletLoadedState extends WalletState {
  final List<Wallet> wallets;
  
  const WalletLoadedState(this.wallets);

  @override
  List<Object> get props => [wallets];
}

final class WalletLoadErrorState extends WalletState {
  final String message;
  const WalletLoadErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class WalletAddSuccessState extends WalletState {
  final Wallet wallet;
  const WalletAddSuccessState(this.wallet);

  @override
  List<Object> get props => [wallet];
}

final class WalletAddErrorState extends WalletState {
  final String message;
  const WalletAddErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class WalletDeletedSuccessState extends WalletState {
  final bool deleted;
  const WalletDeletedSuccessState(this.deleted);

  @override
  List<Object> get props => [deleted];
}

final class WalletDeletedErrorState extends WalletState {
  final String message;
  const WalletDeletedErrorState(this.message);

  @override
  List<Object> get props => [message];
}

final class WalletChooseDefaultSuccessState extends WalletState {
  final Wallet wallet;
  const WalletChooseDefaultSuccessState(this.wallet);

  @override
  List<Object> get props => [wallet];
}

final class WalletChooseErrorState extends WalletState {
  final String message;
  const WalletChooseErrorState(this.message);

  @override
  List<Object> get props => [message];
}