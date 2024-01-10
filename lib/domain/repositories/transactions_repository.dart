import 'package:qpay/domain/models/Transactions.dart';

abstract interface class TransactionsRepository {

  Future<List<Transactions>> getAllTransactionsByAbonneId();
  Future<void> addTransaction(String senderId, String receiverId, double amount);

}