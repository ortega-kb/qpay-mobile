import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qpay/core/domain/model/user_model.dart';
import 'package:qpay/core/network/service/user_service.dart';

class UserServiceImpl extends UserService {
  UserServiceImpl(this._firebaseFirestore);

  final FirebaseFirestore _firebaseFirestore;
  static const collection = "users";

  @override
  Future<void> createUser({
    required UserModel userModel,
    required Function() onSuccess,
    required Function(String p1) onError,
  }) async {
    await _firebaseFirestore
        .collection(collection)
        .add(userModel.toJson())
        .onError((error, stackTrace) => onError(error.toString()))
        .whenComplete(() => onSuccess)
        .timeout(Duration(seconds: 20));
  }
}
