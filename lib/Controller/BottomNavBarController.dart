import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';

class CustomBottomNavBarController extends GetxController {
  var selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.homescreen);
        break;
      case 1:
        Get.toNamed(AppRoutes.settingscreen);
        break;
      case 2:
        Get.toNamed(AppRoutes.profilescreen);
        break;
    }
    update();
  }
}
