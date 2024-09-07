import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';

class AddWalletUseCase implements UseCase<Wallet, AddWalletParams> {
  final WalletRepository _walletRepository;

  AddWalletUseCase(this._walletRepository);

  @override
  Future<Either<Failure, Wallet>> call(AddWalletParams params) async {
    return await _walletRepository.addWallet(
      providerType: params.providerType,
      userCode: params.userCode,
      walletPhone: params.walletPhone,
      walletPin: params.walletPin,
      defaultWallet: params.defaultWallet,
    );
  }
}

class AddWalletParams {
  final String providerType;
  final String userCode;
  final String walletPhone;
  final String walletPin;
  final bool defaultWallet;

  AddWalletParams({
    required this.providerType,
    required this.userCode,
    required this.walletPhone,
    required this.walletPin,
    required this.defaultWallet,
  });
}
