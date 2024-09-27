// const localhost = "192.168.29.163";

const localhost = "172.16.0.147"; //~ office

// const localhost = "192.168.228.57"; //~  mobile Divyesh
// const localhost = "172.16.0.168"; //~ Divyesh

abstract class UrlBuilder {
  static String baseURL = "http://$localhost:9959/erpapp/erp";

  static String buildUrl({required String endPoint}) => "$baseURL$endPoint";
}

class Api {
  // static String getTopRatedUrl() => UrlBuilder.buildUrl(endPoint: "/top_rated");

//* Login Screen
  static String generateOtpURL({required String mobileNo}) =>
      "${UrlBuilder.buildUrl(endPoint: "/generateOtp")}?mobileNo=$mobileNo";
  static String loginURL({required String mobileNo, required String otp}) =>
      "${UrlBuilder.buildUrl(endPoint: "/employeeLogin")}?mobileNo=$mobileNo&otp=$otp";

//* Grievance
  static String getGrievanceTypeURL() =>
      UrlBuilder.buildUrl(endPoint: "/lookup?type=grievance_type");

  static String saveGrievanceURL() =>
      UrlBuilder.buildUrl(endPoint: "/saveGrievance");

  static String getGrievanceURL(
          {String? grievanceId = "",
          String? grievanceType = "",
          String? employeeId = ""}) =>
      "${UrlBuilder.buildUrl(endPoint: "/fetchGrievances")}?grievanceId=$grievanceId&grievanceType=$grievanceType&employeeId=$employeeId";

//* Transport
  static String getTransportURL(
          {required String employeeId,
          String? transportId = "",
          String? transportStatus = ""}) =>
      "${UrlBuilder.buildUrl(endPoint: "/fetchTransports")}?transportId=$transportId&employeeId=$employeeId&transportStatus=$transportStatus";

  static String saveTransportURL() =>
      UrlBuilder.buildUrl(endPoint: "/saveTransport");

//* Bed
  static String getBedServiceCenterURL() =>
      UrlBuilder.buildUrl(endPoint: "/lookup?type=service_center");
  // static String getBedNoURL({required String serviceCenter}) =>
  //     "${UrlBuilder.buildUrl(endPoint: "/fetchBedMaster")}?serviceCenter=$serviceCenter"; //! form service center

  static String bedServiceCenterListURL({
    String? serviceCenter = "",
    String? page = "",
  }) =>
      "${UrlBuilder.buildUrl(endPoint: "/fetchBedMaster")}?serviceCenter=$serviceCenter&page=$page";

//* Referral
  static String getreferralTypeURL() =>
      UrlBuilder.buildUrl(endPoint: "/lookup?type=referral_priority");
  static String getReferralBedNoURL({required String serviceCenter}) =>
      "${UrlBuilder.buildUrl(endPoint: "/fetchReferralsBeds")}?serviceCenter=$serviceCenter"; //! form service center

  static String referralListListURL({
    String? employeeId = "",
    String? employeeName = "",
    String? departmentName = "",
    String? referralPriority = "",
  }) =>
      "${UrlBuilder.buildUrl(endPoint: "/fetchReferrals")}?employeeName=$employeeName&departmentName=$departmentName&referralPriority=$referralPriority&employeeId=$employeeId";

  static String saveReferralURL() =>
      UrlBuilder.buildUrl(endPoint: "/saveReferral");
}
