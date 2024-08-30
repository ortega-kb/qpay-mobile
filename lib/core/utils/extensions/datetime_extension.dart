import 'package:intl/intl.dart';

// Datetime extensions 
extension DatetimeExtension on DateTime {
  toDDMMYYYY() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  toDDMMYYYYHHMM() {
    return DateFormat('dd-MM-yyyy HH:mm').format(this);
  }
}

