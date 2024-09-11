import 'dart:convert';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/enums/operation_type.dart';
import 'package:qpay/core/utils/link_util.dart';
import 'package:qpay/core/utils/qr_response.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  DeepLinkService._();

  static final DeepLinkService instance = DeepLinkService._();

  void listenDeepLinks(BuildContext context) {
    log("Starting listening deep link");
    _appLinks.uriLinkStream.listen((Uri? uri) {
      // If the link is valid, handle it accordingly.
      if (LinkUtil.validateLink(uri.toString())) {
        context.push('/payment', extra: json.encode(_extractUrlData(uri!)));
      }
    });
  }

  TransactionResponse _extractUrlData(Uri uri) {
    final code = uri.queryParameters['code'];
    final amount = uri.queryParameters['at'];
    final description = uri.queryParameters['desc'];
    final wallet = uri.queryParameters['wt'];

    return TransactionResponse(
      account: code!,
      amount: double.parse(amount!),
      type: OperationType.TRANSFER.name,
      currency: wallet!,
    );
  }
}
