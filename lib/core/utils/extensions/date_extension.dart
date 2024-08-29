import 'package:intl/intl.dart';

// Format date time to redable format
extension DatetimeFormatting on DateTime {
  toRedable() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}