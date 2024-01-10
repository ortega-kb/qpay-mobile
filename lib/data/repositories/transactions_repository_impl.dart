import 'package:qpay/domain/models/Transactions.dart';
import 'package:qpay/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final String firestore;

  TransactionsRepositoryImpl({required this.firestore});

  @override
  Future<void> addTransaction(String senderId, String receiverId, double) {
    throw UnimplementedError();
  }

  @override
  Future<List<Transactions>> getAllTransactionsByAbonneId() {
    throw UnimplementedError();
  }

}