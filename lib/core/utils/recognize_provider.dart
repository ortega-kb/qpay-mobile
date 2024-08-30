import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qpay/core/utils/enums/provider_type.dart';

class RecognizeProvider {

  static final List<int> _vodacom = [81,82,83];
  static final List<int> _airtel = [99];
  static final List<int> _orange = [89];
  static final List<int> _africell = [87];

  // Recognize provider type by phone
  static String? recognize(String phone) {
    int twoFirstDigits = _twoFirstDigits(phone);
    log(twoFirstDigits.toString());

    if (_vodacom.contains(twoFirstDigits)) return ProviderType.VODACOM.name;
    else if (_airtel.contains(twoFirstDigits)) return ProviderType.AIRTEL.name;
    else if (_orange.contains(twoFirstDigits)) return ProviderType.ORANGE.name;
    else if (_africell.contains(twoFirstDigits)) return ProviderType.AFRICELL.name;

    return null;
  }

  static Color? bindColorToProvider(String phone) {
    if (recognize(phone) == ProviderType.VODACOM.name) return Colors.red;
    else if (recognize(phone) == ProviderType.AIRTEL.name) return Colors.red;
    else if (recognize(phone) == ProviderType.ORANGE.name) return Colors.orange.shade300;
    else if (recognize(phone) == ProviderType.AFRICELL.name) return Colors.purple;

    return null;
  }

  // Get a two first digits of the phone number
  static int _twoFirstDigits(String phone) => int.parse(phone.substring(0,2));
}
