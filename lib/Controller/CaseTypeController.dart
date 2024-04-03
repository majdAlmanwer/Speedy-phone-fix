import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';

import '../Service/caseTypeService.dart';

class CaseTypeController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> newCase(
      {required String branchId, required String type}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId, 'type': type});
    var response = await CaseTypeService().addNewCase(request);
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

  Future<dynamic> editCase(
      {required String typeId, required String type}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'type_id': typeId, 'type': type});
    var response = await CaseTypeService().editCase(request);
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

  Future<dynamic> deleteCase({required String typeId}) async {
    loaderController.loading(true);
    dio.FormData request = dio.FormData.fromMap({'type_id': typeId});
    var response = await CaseTypeService().deleteCase(request);
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
