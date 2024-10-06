import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../di/dependencies.dart';
import 'constants.dart';

class ExternalLink {

  static void emailSupport(BuildContext context) {
    final emailUri = Uri(
        scheme: 'mailto',
        path: Constants.qpayEmail,
        queryParameters: {
          'subject': AppLocalizations.of(context)!.support
        }
    );

    _launch(emailUri);
  }

  static void privacy() => _launch(Uri.parse(Constants.qpayPrivacyLink));

  static void _launch(Uri uri) async {
    try {
      await launchUrl(uri);
    } catch (e) {
      sl<Logger>().e(e);
    }
  }
}