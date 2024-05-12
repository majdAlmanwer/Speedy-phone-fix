import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';
import 'package:speedy_phone_fix/Service/CustomerPrivateService.dart';

class CustomerPrivateController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> newCustomerPrivate(
      {required String branchId, required String cusName,required String cusAddress,required String cusMobile,
        required String cusEmail,required String userName,required bool gdpr}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId,'cus_name': cusName,'cus_address': cusAddress,'cus_mobile': cusMobile,
      'cus_email': cusEmail,'username': userName,'gdpr': gdpr});
    var response = await CustomerPrivateService().saveCustomerPrivate(request);
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
