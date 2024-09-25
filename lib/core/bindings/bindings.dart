import 'package:get/get.dart';
import '../services/internet_service/internet_services.dart';
import '../services/local_storage/get_storage.dart';
// import '../services/token_expire/token_expire_service.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStorageService>(() => GetStorageService());
    // Get.put(NetworkServiceController());
    // Get.put(AuthController());
    // Get.lazyPut<AuthService>(() => AuthService());

  }
}
