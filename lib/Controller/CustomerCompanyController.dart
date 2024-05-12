import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';
import 'package:speedy_phone_fix/Service/CustomerCompanyService.dart';


class CustomerCompanyController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> newCustomerCompany(
      {required String branchId,required String cusName,required String cusAddress,required String cusMobile,
        required String cusEmail,required String cus_Delegera,required String cus_orgenization_no,required String cus_invoice_address,
        required String cus_wesite,required String username,required bool gdpr}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId, 'cus_name': cusName,
      'cus_address': cusAddress,
      'cus_mobile': cusMobile,'cus_email': cusEmail,
      'cus_Delegera': cus_Delegera,
      'cus_orgenization_no': cus_orgenization_no,'cus_invoice_address': cus_invoice_address,'cus_wesite': cus_wesite,'username': username,'gdpr': gdpr
    });
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
