import 'package:qpay/features/wallet/data/models/wallet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class WalletRemoteDataSource {
  Future<WalletModel> addWallet({
    required WalletModel wallet,
  });

  Future<bool> deleteWallet({required String walletId});
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  final SupabaseClient _supabaseClient;

  WalletRemoteDataSourceImpl(this._supabaseClient);
  
  @override
  Future<WalletModel> addWallet({required WalletModel wallet}) {
    // TODO: implement addWallet
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deleteWallet({required String walletId}) {
    // TODO: implement deleteWallet
    throw UnimplementedError();
  }

  
}
