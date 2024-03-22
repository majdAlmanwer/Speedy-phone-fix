import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/AppStyle.dart';

class MessagesHandlerController extends GetxController {
  Future<void> showErrorMessage(String? message, String? description) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Text(message?.tr ?? 'error'.tr,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        messageText: Text(description?.tr ?? 'error'.tr,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        duration: const Duration(seconds: 4),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        borderRadius: 25.0,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.TOP,
        icon: IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
            },
            icon: const Icon(Icons.cancel),
            iconSize: 30,
            color: Colors.white),
        backgroundColor: BlueColor));
  }

  Future<void> showSuccessMessage(String? message, String? description) async {
    Get.showSnackbar(GetSnackBar(
        titleText: Text(message?.tr ?? 'error'.tr,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        messageText: Text(description?.tr ?? 'Success'.tr,
            style: const TextStyle(
                fontFamily: 'Mulish',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        borderRadius: 25.0,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        snackPosition: SnackPosition.TOP,
        icon: IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
            },
            icon: const Icon(Icons.check),
            iconSize: 30,
            color: Colors.white),
        backgroundColor: BlueColor));
  }
}
