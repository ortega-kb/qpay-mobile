part of 'wallet_bloc.dart';

sealed class WalletEvent extends Equatable {
  const WalletEvent();
}

final class WalletAddEvent extends WalletEvent {
  final String providerType;
  final String userCode;
  final String walletPhone;
  final String walletPin;
  final bool defaultWallet;

  WalletAddEvent({
    required this.providerType,
    required this.userCode,
    required this.walletPhone,
    required this.walletPin,
    required this.defaultWallet,
  });

  @override
  List<Object> get props => [
        providerType,
        userCode,
        walletPhone,
        walletPin,
        defaultWallet,
      ];
}

final class WalletChooseDefaultEvent extends WalletEvent {
  final String walletId;
  final String userCode;

  WalletChooseDefaultEvent({
    required this.walletId,
    required this.userCode,
  });

  @override
  List<Object> get props => [walletId];
}

final class WalletDeleteEvent extends WalletEvent {
  final String walletId;

  WalletDeleteEvent({required this.walletId});

  @override
  List<Object> get props => [walletId];
}

final class WalletGetByUserCodeEvent extends WalletEvent {
  final String userCode;

  WalletGetByUserCodeEvent({required this.userCode});

  @override
  List<Object> get props => [userCode];
}
