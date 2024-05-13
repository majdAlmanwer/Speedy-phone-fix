import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import '../Controller/LoaderController.dart';
import '../Model/OrderResponseModel.dart';

class OrderService {
  static OrderService? _instance;

  var dio = Dio();
  factory OrderService() => _instance ??= OrderService._();

  OrderService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<OrderResponseModel> saveOrder([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/save_order.aspx', data: data);

      if (res.statusCode == 200) {
        return OrderResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return OrderResponseModel();
  }



}
