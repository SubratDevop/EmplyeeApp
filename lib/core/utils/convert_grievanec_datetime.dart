import 'package:intl/intl.dart';

String convertDateTime({required String dateTime}) {
  // return DateFormat("d MMM yyyy, h:mm a").format(DateTime.parse(dateTime));
  return DateFormat("d MMM yyyy, h:mm a")
      .format(DateFormat("dd-MM-yyyy'T'HH:mm").parse(dateTime));
}

String convertDateTime2({required String dateTime}) {
  // return DateFormat("dd MMM yyyy").format(DateTime.parse(dateTime));
  return DateFormat("dd MMM yyyy")
      .format(DateFormat("dd-MM-yyyy'T'HH:mm").parse(dateTime));
}
