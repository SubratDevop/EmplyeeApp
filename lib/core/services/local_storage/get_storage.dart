import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class GetStorageService extends GetxService {
  final storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
  }

  Future<void> saveString(String key, String value) async {
    await storage.write(key, value);
  }

  String getString(String key) {
    return storage.read(key) ?? '';
  }

  Future<void> clear() async {
    await storage.erase();
  }
}
