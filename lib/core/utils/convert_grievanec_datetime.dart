  import 'package:intl/intl.dart';

String convertGrievanecDateTime({required String dateTime}) {
    return DateFormat("dd MMM yyyy, hh:mm a").format(DateTime.parse(dateTime));
  }