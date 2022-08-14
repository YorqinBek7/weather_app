import 'package:intl/intl.dart';

getFormatWeekDays(int time) {
  return DateFormat.EEEE().format(
    DateTime.fromMillisecondsSinceEpoch(time * 1000),
  );
}
