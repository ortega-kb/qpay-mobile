

import 'package:qpay/core/utils/qr_response.dart';

import 'enums/operation_type.dart';

class LinkUtil {

  static bool validateLink(String url) {
    final uri = Uri.tryParse(url);

    // Check if link is correct scheme, authority, and path
    if (uri == null) {
      return false;
    }

    // Check if link is for the correct app
    if (uri.host != 'qpay.app' || uri.path != '/transaction') return false;

    // Extract and check query parameters
    final code = uri.queryParameters['code'];
    final amount = uri.queryParameters['at'];
    final description = uri.queryParameters['desc'];
    final wallet = uri.queryParameters['wt'];

    // Check if required query parameters are present and valid
    if (code == null || amount == null || description == null || wallet == null) {
      return false;
    }

    // Check if wallet is valid (CDF or USD)
    if (wallet != 'CDF' && wallet != 'USD') return false;

    // Then all checks passed, the link is valid
    return true;
  }

  static Uri paymentLinkGenerator({
    required String userCode,
    required String amount,
    required String description,
    required String wallet,
  }) {

    final host = 'qpay.app';
    final path = 'transaction';
    final scheme = 'https';

    return Uri.parse(
      "$scheme://$host/$path?code=$userCode&at=$amount&desc=$description&wt=$wallet",
    );
  }

  static TransactionResponse extractLinkData(Uri uri) {
    final code = uri.queryParameters['code'];
    final amount = uri.queryParameters['at'];
    final description = uri.queryParameters['desc'];
    final wallet = uri.queryParameters['wt'];
    final type = uri.queryParameters['type'];

    return TransactionResponse(
      code: code!,
      amount: double.parse(amount!),
      type: type ?? OperationType.PAYMENT.name,
      wallet: wallet!,
    );
  }
}
