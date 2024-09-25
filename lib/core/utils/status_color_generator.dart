import 'package:flutter/material.dart';

Color statusColorGenrator({required String status}) {
  Color statusColor;
  switch (status) {
    case "Submitted":
      statusColor = Colors.green;
      break;
    case "In Progress":
      statusColor = Colors.yellow;
      break;
    case "Resolved":
      statusColor = const Color(0xFF757575);
      break;
    case "Rejected":
      statusColor = Colors.red;
      break;
    default:
      statusColor = Colors.black;
  }
  return statusColor;
}
