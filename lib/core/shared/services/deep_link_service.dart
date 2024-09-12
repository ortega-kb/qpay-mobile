import 'dart:convert';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/enums/operation_type.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/qr_response.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  DeepLinkService._();

  static final DeepLinkService instance = DeepLinkService._();

  void checkInitialLink(BuildContext context) async {
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        if (LinkUtil.validateLink(initialLink.toString())) {
          context.push('/payment',
              extra: json.encode(_extractLinkData(initialLink)));
        }
      }
    } on PlatformException catch (e) {
      print('Échec lors de la récupération du lien initial. $e');
    }
  }

  void listenDeepLinks(BuildContext context) {
    log("Starting listening deep link");
    _appLinks.uriLinkStream.listen((Uri? uri) {
      // If the link is valid, handle it accordingly.
      if (LinkUtil.validateLink(uri.toString())) {
        context.push('/payment', extra: json.encode(_extractLinkData(uri!)));
      }
    });
  }

  TransactionResponse _extractLinkData(Uri uri) {
    final code = uri.queryParameters['code'];
    final amount = uri.queryParameters['at'];
    final description = uri.queryParameters['desc'];
    final wallet = uri.queryParameters['wt'];

    return TransactionResponse(
      code: code!,
      amount: double.parse(amount!),
      type: OperationType.TRANSFER.name,
      wallet: wallet!,
    );
  }
}
