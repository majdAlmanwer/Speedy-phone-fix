import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/LoaderController.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';

import '../Service/OrderService.dart';

class OrderController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
  Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  Future<dynamic> saveNewOrder(
      {required String branchId,required String item, required String customer_name,required String customer_email,required String customer_mobile,
        required String item_quantity,required String item_price,required String delivery_date,required String username}) async {
    loaderController.loading(true);
    dio.FormData request =
    dio.FormData.fromMap({'branch_id': branchId,'item':item,'customer_name': customer_name,'customer_email': customer_email,'customer_mobile': customer_mobile,
      'item_quantity': item_quantity,'item_price': item_price,'delivery_date': delivery_date,'username': username});
    var response = await OrderService().saveOrder(request);
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
