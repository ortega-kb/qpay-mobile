import 'package:qpay/common/widgets/balance.dart';

abstract interface class BalanceRepository {

  Future<Balance> getBalance(String abonneId);

}