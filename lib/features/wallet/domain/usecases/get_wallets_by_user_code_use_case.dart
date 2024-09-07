import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/core/utils/usecase.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletsByUserCodeUseCase
    implements UseCase<List<Wallet>, GetWalletsByUserParams> {
  final WalletRepository _walletRepository;

  GetWalletsByUserCodeUseCase(this._walletRepository);

  @override
  Future<Either<Failure, List<Wallet>>> call(
    GetWalletsByUserParams params,
  ) async {
    return await _walletRepository.getWalletsByUserCode(
      userCode: params.userCode,
    );
  }
}

class GetWalletsByUserParams {
  final String userCode;

  GetWalletsByUserParams({required this.userCode});
}
