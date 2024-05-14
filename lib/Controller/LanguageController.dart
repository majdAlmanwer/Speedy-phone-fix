// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/Constant.dart';

class LanguageController extends GetxController {
  SingingCharacter? character;

  @override
  void onInit() {
    super.onInit();
    // Set the initial selected language
    character = Get.locale?.languageCode == 'se'
        ? SingingCharacter.swedish
        : SingingCharacter.english;
  }

  void setCharacter(SingingCharacter? value) {
    character = value;
    if (value == SingingCharacter.english) {
      Get.updateLocale(const Locale('en'));
    } else if (value == SingingCharacter.swedish) {
      Get.updateLocale(const Locale('ar'));
    }

    update();
  }
}
