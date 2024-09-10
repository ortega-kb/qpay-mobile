import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/core/utils/link_util.dart';

class DeepLinkService {
  final AppLinks _appLinks = AppLinks();

  DeepLinkService._();

  static final DeepLinkService instance = DeepLinkService._();

  void listenDeepLinks(BuildContext context) {
    log("Starting listening deep link");
    _appLinks.uriLinkStream.listen((Uri? uri) {
      // If the link is valid, handle it accordingly.
      if (LinkUtil.validateLink(uri.toString())) {
        context.push('/payment');
      } 
    });
  }


}
