import 'package:intl/intl.dart';

String convertDateTime({required String dateTime}) {
  return DateFormat("dd MMM yyyy, hh:mm a").format(DateTime.parse(dateTime));
}

String convertDateTime2({required String dateTime}) {
  return DateFormat("dd MMM yyyy").format(DateTime.parse(dateTime));
}
