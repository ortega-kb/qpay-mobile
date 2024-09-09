import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';

import '../entities/wallet.dart';

class ChooseDefaultWalletUseCase
    implements UseCase<Wallet, ChooseDefaultWalletParams> {
  final WalletRepository _walletRepository;

  ChooseDefaultWalletUseCase(this._walletRepository);

  @override
  Future<Either<Failure, Wallet>> call(ChooseDefaultWalletParams params) async {
    return await _walletRepository.chooseDefaultWallet(
      walletId: params.walletId,
      userCode: params.userCode
    );
  }
}

class ChooseDefaultWalletParams {
  final String walletId;
  final String userCode;

  ChooseDefaultWalletParams({required this.walletId, required this.userCode});
}
