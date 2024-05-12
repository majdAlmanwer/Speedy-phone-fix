import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CustomerPrivateResponseModel.dart';

import '../Controller/LoaderController.dart';

class CustomerPrivateService {
  static CustomerPrivateService? _instance;

  var dio = Dio();
  factory CustomerPrivateService() => _instance ??= CustomerPrivateService._();

  CustomerPrivateService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CustomerPrivateResponseModel> saveCustomerPrivate([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/save_private_customer.aspx', data: data);

      if (res.statusCode == 200) {
        return CustomerPrivateResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CustomerPrivateResponseModel();
  }



}
