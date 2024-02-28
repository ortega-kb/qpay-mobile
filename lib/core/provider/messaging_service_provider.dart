import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qpay/core/network/service/messaging_service.dart';
import 'package:qpay/core/network/service/messaging_service_impl.dart';
import 'package:qpay/core/provider/firebase_messaging_provider.dart';

final messagingServiceProvider = Provider<MessagingService>(
    (ref) => MessagingServiceImpl(ref.watch(firebaseMessagingProvider)));
