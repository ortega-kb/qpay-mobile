import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class DeepLink {
  static initDeepLink(BuildContext context) async {
    final _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((uri) async {
      deepLinkHandler(context, uri);
    }, onError: (error) {
      log("Error handling deep link: $error");
    });
  }

  static deepLinkHandler(BuildContext context, Uri? uri) {
    if (uri != null) {
      final id = uri.queryParameters['id'];
      final at = uri.queryParameters['at'];
      final desc = uri.queryParameters['desc'];
      final wt = uri.queryParameters['wt'];

      if (id != null && at != null && desc != null && wt != null) {
        log("$id, $at, $desc, $wt: Received deep link! Redirecting to payment page");
        context.go('/payment', extra: {
          'id': id,
          'at': at,
          'desc': desc,
          'wt': wt,
        });
      } else {}
    }
  }
}
