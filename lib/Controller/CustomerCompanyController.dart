import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';
import 'package:speedy_phone_fix/Service/CustomerCompanyService.dart';

import '../Service/caseStatusService.dart';

class CustomerCompanyController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> saveCustomerCompany(
      {required String branchId, required String cus_name}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId, 'cus_name': cus_name});
    var response = await CustomerCompanyService().saveCustomerCompany(request);
    try {
      msgController.showSuccessMessage(response.message, response.description);
    } catch (e) {
      if (e is dio.DioException) {
        log(e.toString());
        msgController.showErrorMessage(response.message, response.description);
      } else {
        msgController.showErrorMessage(response.message, response.description);
      }
      loaderController.loading(false);
    }
  }



}
