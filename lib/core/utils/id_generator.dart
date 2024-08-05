
import 'dart:math';

class IDGenerator {

  // generate unique user ID for customers
  static String userID() {
    return "qp${_uniqueNumericCode()}";
  }

  // generate unique numeric code for transaction IDs
  static String transactionID() {
    return "#qp${_uniqueNumericCode()}";
  }

  // generate unique numeric code for user and transaction IDs
  static String _uniqueNumericCode() {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final randomPart = random.nextInt(1000000).toString().padLeft(6, '0');
    return '$timestamp$randomPart';
  }
}