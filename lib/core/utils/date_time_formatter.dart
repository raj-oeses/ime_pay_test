import 'package:intl/intl.dart';

class DateTimeFormatter {
  //this will format the data ( May 09,2024 3:00AM )
  static formatDMY(DateTime? dateTime) {
    DateFormat formatMDY = DateFormat('MMM d,yyyy  hh:mm a');
    return formatMDY
        .format(dateTime ?? DateTime.now());
  }
  static formatMDYT(DateTime? dateTime) {
    DateFormat formatMDY = DateFormat('MMM d,yyyy  hh:mm');
    return formatMDY
        .format(dateTime ?? DateTime.now());
  }
}
