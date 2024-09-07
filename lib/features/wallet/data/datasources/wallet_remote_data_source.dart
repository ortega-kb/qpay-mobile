import 'package:qpay/core/errors/exception.dart';
import 'package:qpay/features/wallet/data/models/wallet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class WalletRemoteDataSource {
  Future<WalletModel> addWallet({
    required WalletModel wallet,
  });

  Future<List<WalletModel>> getWalletsByUserCode({
    required String userCode,
  });

  Future<WalletModel> chooseDefaultWallet({
    required String walletId,
  });

  Future<bool> deleteWallet({
    required String walletId,
  });
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final SupabaseClient _supabaseClient;

  WalletRemoteDataSourceImpl(this._supabaseClient);

  // Wallet table name
  final String _table = 'wallet';

  @override
  Future<WalletModel> addWallet({required WalletModel wallet}) async {
    try {
      final response = await _supabaseClient
          .from(_table)
          .insert(wallet.toJson())
          .select();

      return WalletModel.fromJson(response.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> deleteWallet({required String walletId}) async {
    try {

      await _supabaseClient
          .from(_table)
          .delete()
          .eq('id', walletId);

      return true;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<WalletModel> chooseDefaultWallet({required String walletId}) {
    // TODO: implement chooseDefaultWallet
    throw UnimplementedError();
  }

  @override
  Future<List<WalletModel>> getWalletsByUserCode({
    required String userCode,
  }) async {
    try {
      final response =
          await _supabaseClient.from(_table).select().eq('user_code', userCode);

      return response.map((wallet) => WalletModel.fromJson(wallet)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
