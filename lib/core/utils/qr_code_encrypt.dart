import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QRCodeEncrypt {
  static String _secretKey = dotenv.get("ENCRYPT_KEY");
  static final _iv = encrypt.IV.fromLength(16);

  static encrypt.Encrypted encryptQRCode(data) {
    final key = encrypt.Key.fromUtf8(_secretKey);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.encrypt(data, iv: _iv);
  }

  static String decryptQRCode(encrypt.Encrypted data) {
    final key = encrypt.Key.fromUtf8(_secretKey);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.decrypt(data, iv: _iv);
  }
}
