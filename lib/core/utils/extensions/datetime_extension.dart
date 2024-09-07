import 'package:intl/intl.dart';

// Datetime extensions 
extension DatetimeExtension on DateTime {
  toDDMMYYYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  toDDMMYYYYHHMM() {
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }
}

// String extensions
extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}