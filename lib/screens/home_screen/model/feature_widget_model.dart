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
