import 'package:fpdart/fpdart.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';

abstract interface class WalletRepository {
  Future<Either<Failure, Wallet>> addWallet({
    required String providerType,
    required String userCode,
    required String walletPhone,
    required String walletPin,
    required bool defaultWallet,
    required String walletName,
  });

  Future<Either<Failure, List<Wallet>>> getWalletsByUserCode({
    required String userCode,
  });

  Future<Either<Failure, bool>> deleteWallet({
    required String walletId,
  });

  Future<Either<Failure, Wallet>> chooseDefaultWallet({
    required String walletId,
    required String userCode,
  });
}
