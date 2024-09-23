import 'package:intl/intl.dart';

String formatDateTime({required String dateTimeStr}) {
  DateTime dateTime = DateTime.parse(dateTimeStr);
  DateFormat dayFormat = DateFormat('d');
  String day = dayFormat.format(dateTime);
  String suffix = getDayOfMonthSuffix(dateTime.day);
  DateFormat monthYearFormat = DateFormat('MMMM yyyy, hh:mm a');
  String formattedDate = "$day$suffix ${monthYearFormat.format(dateTime)}";
  return formattedDate;
}

String getDayOfMonthSuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String formatDateTime2({required dateTimeString}) {
  // Parse the input date-time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Create a DateFormat for the desired output
  DateFormat dateFormatter = DateFormat('d MMM');
  DateFormat timeFormatter = DateFormat('h:mm a');

  // Format the date and time separately
  String formattedDate = dateFormatter.format(dateTime);
  String formattedTime = timeFormatter.format(dateTime).toLowerCase();

  // Determine the suffix for the day (st, nd, rd, th)
  // DateFormat dayFormat = DateFormat('d');
  // String day = dayFormat.format(dateTime);
  // String suffix = getDayOfMonthSuffix(dateTime.day);

  // Combine the formatted date and time with the suffix
  return '$formattedDate, $formattedTime';
}
