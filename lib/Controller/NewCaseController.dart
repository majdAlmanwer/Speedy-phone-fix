import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Service/NewCaseService.dart';

import '../Model/CaseStatusModel.dart';
import 'LoaderController.dart';

class NewCaseController extends GetxController {
  final loaderController = Get.put(LoaderController());
  final box = GetStorage();
  List<CaseStatus> caseStatusList = [];
  @override
  void onInit() {
    // Perform initialization tasks here
    getCaseStatus(9);

    super.onInit();
  }

  Future<dynamic> getCaseStatus(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchCaseStatus(9);

      caseStatusList = res.caseStatus!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }
}
