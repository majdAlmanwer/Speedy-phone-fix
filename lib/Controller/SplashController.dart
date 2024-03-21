import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Routes/Routes.dart';

class SplashController extends GetxController {
  bool isloading = true;
  GetStorage box = GetStorage();
  // LoginController loginController = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    // checkAndConnectivity();
  }

  void check() async {
    if (box.read('loggedIn') == true) {
      Get.offAllNamed(AppRoutes.homescreen);
    } else if (box.read('loggedIn') == null || box.read('loggedIn') == false) {
      Get.toNamed(AppRoutes.authtabbar);
    }
    // Perform actions when there is an internet connection
    print('Internet connection available');
  }
}
