import 'package:qpay/common/widgets/balance.dart';
import 'package:qpay/domain/repositories/balance_repository.dart';

class BalanceRepositoryImpl implements BalanceRepository {
  final String firestore;

  BalanceRepositoryImpl({required this.firestore});

  @override
  Future<Balance> getBalance(String idAbonne) {
    throw UnimplementedError();
  }

}