import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';
import 'package:speedy_phone_fix/Service/MakeModelService.dart';

import '../Service/caseStatusService.dart';

class MakeModelController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
      Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> newMakeModel(
      {required String branchId, required String makemodel}) async {
    loaderController.loading(true);
    dio.FormData request =
        dio.FormData.fromMap({'branch_id': branchId, 'makemodel': makemodel});
    var response = await MakeModelService().addMakeModel(request);
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

  Future<dynamic> editMakeModel(
      {required String makemodelId, required String makemodel}) async {
    loaderController.loading(true);
    dio.FormData request =
        dio.FormData.fromMap({'makemodel_id': makemodelId, 'makemodel': makemodel});
    var response = await MakeModelService().editMakeModel(request);
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

  Future<dynamic> deleteMakeModel({required String makemodelId}) async {
    loaderController.loading(true);
    dio.FormData request = dio.FormData.fromMap({'makemodel_id': makemodelId});
    var response = await MakeModelService().deleteMakeModel(request);
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
