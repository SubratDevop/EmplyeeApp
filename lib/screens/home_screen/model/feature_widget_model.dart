import 'package:employee_app/screens/features/beds/screens/beds_screen.dart';
import 'package:employee_app/screens/features/grievance/screens/grievance_screen.dart';
import 'package:employee_app/screens/features/referral/referral_screen.dart';
import 'package:employee_app/screens/features/transport/screens/transport_screen.dart';
import 'package:flutter/material.dart';

class FeatureWidgets {
  String? tittle;
  String? iconPath;
  FeatureWidgets({
    required this.tittle,
    required this.iconPath,
  });
}

List<FeatureWidgets> featureList = [
  FeatureWidgets(tittle: "Transport", iconPath: "assets/icons/transport.svg"),
  FeatureWidgets(tittle: "Beds", iconPath: "assets/icons/bed.svg"),
  FeatureWidgets(tittle: "Grievance", iconPath: "assets/icons/referral.svg"),
  FeatureWidgets(tittle: "Referral", iconPath: "assets/icons/referral.svg"),
];

List<Widget> featureScreens = [
  const TransportScreen(),
  const BedsScreen(),
   GrievanceScreen(),
  const ReferralScreen(),
];
