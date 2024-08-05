
import 'dart:math';

class CodeGenerator {

  // generate unique user code for customers
  static String userCode() {
    return "qp${_uniqueNumericCode()}";
  }

  // generate unique numeric code for transaction IDs
  static String transactionCode() {
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