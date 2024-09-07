import 'package:fpdart/src/either.dart';
import 'package:qpay/core/errors/exception.dart';
import 'package:qpay/core/errors/failure.dart';
import 'package:qpay/features/wallet/data/datasources/wallet_remote_data_source.dart';
import 'package:qpay/features/wallet/data/models/wallet_model.dart';
import 'package:qpay/features/wallet/domain/entities/wallet.dart';
import 'package:qpay/features/wallet/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource _walletRemoteDataSource;

  WalletRepositoryImpl(this._walletRemoteDataSource);

  @override
  Future<Either<Failure, Wallet>> addWallet({
    required String providerType,
    required String userCode,
    required String walletPhone,
    required String walletPin,
    required bool defaultWallet,
  }) async {
    final wallet = WalletModel(
      defaultWallet: defaultWallet,
      userCode: userCode,
      walletPin: walletPin,
      walletPhone: walletPhone,
      providerType: providerType,
    );

    return _wallet(
      func: () async => _walletRemoteDataSource.addWallet(
        wallet: wallet,
      ),
    );
  }

  @override
  Future<Either<Failure, Wallet>> chooseDefaultWallet({
    required String walletId,
  }) async {
    return _wallet(
      func: () async => _walletRemoteDataSource.chooseDefaultWallet(
        walletId: walletId,
      ),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteWallet({required String walletId}) async {
    try {
      return right(
        await _walletRemoteDataSource.deleteWallet(walletId: walletId),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Wallet>>> getWalletsByUserCode({
    required String userCode,
  }) async {
    try {
      return right(
        await _walletRemoteDataSource.getWalletsByUserCode(userCode: userCode),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, Wallet>> _wallet({
    required Future<Wallet> Function() func,
  }) async {
    try {
      final wallet = await func();

      return right(wallet);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
