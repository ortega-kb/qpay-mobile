import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:qpay/di/dependencies.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

void emailSupport(BuildContext context) async {
  try {
    final emailUri = Uri(
      scheme: 'mailto',
      path: Constants.qpayEmail,
      queryParameters: {
        'subject': AppLocalizations.of(context)!.support
      }
    );

    await launchUrl(emailUri);
  } catch (e) {
    locator<Logger>().e(e);
  }
}