import 'package:flutter/material.dart';

Color statusColorGenrator({required String status}) {
  Color statusColor;
  switch (status) {
    case "Submitted":
      statusColor = Colors.green;
      break;
    case "In Progress":
      statusColor = Colors.orange;
      break;
    case "Resolved":
      statusColor = const Color(0xFF757575);
      break;
    case "Rejected":
      statusColor = Colors.red;
      break;
    case "Scheduled":
      statusColor = const Color(0xFF757575);
      break;
    case "In Transit":
      statusColor = Colors.orange;
      break;
    case "Picked Up":
      statusColor = Colors.orange;
      break;
    case "Dropped":
      statusColor = Colors.green;
      break;
    case "Cancelled":
      statusColor = Colors.red;
      break;
    case "Available":
      statusColor = const Color(0xFF969EB0);
      break;
    case "Occupied":
      statusColor = const Color(0xFF29BF80);
      break;
    case "Blocked":
      statusColor = const Color(0xFFDE972C);
      break;
    case "Under Maintenance":
      statusColor = const Color(0xFFF14E63);
      break;
    default:
      statusColor = Colors.black;
  }
  return statusColor;
}
