import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';

class DeleteWalletUseCase implements UseCase<bool, DeleteWalletParams> {
  final WalletRepository _walletRepository;

  DeleteWalletUseCase(this._walletRepository);

  @override
  Future<Either<Failure, bool>> call(DeleteWalletParams params) async {
    return await _walletRepository.deleteWallet(walletId: params.walletId);
  }

}


class DeleteWalletParams {
  final String walletId;

  DeleteWalletParams({required this.walletId});
}