import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';
import 'package:speedy_phone_fix/Service/SaveCaseService.dart';


class SaveCaseController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> newCase(
      {required String branchId,required String cus_name,required String username,required String cas_make_model,required String cas_device_data,
        required String cas_device_password,required String cas_device_IMEI,required String cas_Repair_type1,required String cas_Repair_type2,
        required String cas_Repair_type3,required String cas_problem_description,required String cas_estimated_price,required String cas_discount,
        required String cas_estimated_delivery_date,required String cas_estimated_delivery_time,required String cas_note,required String cas_private_note,required String cas_status}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId, 'cus_name': cus_name,
      'username': username,
      'cas_make_model': cas_make_model,'cas_device_data': cas_device_data,'cas_device_password': cas_device_password,'cas_device_IMEI': cas_device_IMEI,
      'cas_Repair_type1': cas_Repair_type1,'cas_Repair_type2': cas_Repair_type2,'cas_Repair_type3': cas_Repair_type3,'cas_problem_description': cas_problem_description,
      'cas_estimated_price': cas_estimated_price,'cas_discount': cas_discount,'cas_estimated_delivery_date': cas_estimated_delivery_date,'cas_estimated_delivery_time': cas_estimated_delivery_time,'cas_note': cas_note,
      'cas_private_note': cas_private_note,'cas_status': cas_status
    });
    var response = await SaveCaseService().saveCase(request);
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
