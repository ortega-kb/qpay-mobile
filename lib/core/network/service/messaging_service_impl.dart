import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:qpay/core/network/service/messaging_service.dart';

class MessagingServiceImpl extends MessagingService {
  MessagingServiceImpl(this._firebaseMessaging);

  final FirebaseMessaging _firebaseMessaging;

  @override
  Future<void> initMessaging() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint("fcmToken $fcmToken");
  }
}
