// const localhost = "192.168.29.163";

const localhost = "172.16.0.119"; //~ office

abstract class UrlBuilder {
  static String baseURL = "http://$localhost:9959/soul/erp";

  static String buildUrl({required String endPoint}) => "$baseURL$endPoint";
}

class Api {
  // static String getTopRatedUrl() => UrlBuilder.buildUrl(endPoint: "/top_rated");

//* Login Screen
  static String generateOtpURL({required String mobileNo}) =>
      "${UrlBuilder.buildUrl(endPoint: "/generateOtp")}?mobileNo=$mobileNo";
  static String loginURL({required String mobileNo, required String otp}) =>
      "${UrlBuilder.buildUrl(endPoint: "/employeeLogin")}?mobileNo=$mobileNo&otp=$otp";
}
