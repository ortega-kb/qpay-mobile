import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/export.dart';

class QRCodeEncrypt {
  Future<String> encryptQRCode(String data) async {
    final secretKey = dotenv.get("");
    final key = Digest('SHA-256').process(utf8.encode(secretKey));

    return "";
  }

  Future<String> decryptQRCode(String data) async {
    return "";
  }
}
