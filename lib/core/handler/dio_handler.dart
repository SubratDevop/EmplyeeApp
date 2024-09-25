import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleDioError(DioException e) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 422:
          return 'mobile number not found';
        case 401:
          return 'Unauthorized: Please check your authentication credentials.';
        case 500:
          return 'Server error: Please try again later.';
        default:
          return 'Unexpected error: ${e.response?.statusMessage}';
      }
    } else {
      return 'No response received';
    }
  }
}
