import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CustomerCompanyResponseModel.dart';


import '../Controller/LoaderController.dart';

class CustomerCompanyService {
  static CustomerCompanyService? _instance;

  var dio = Dio();
  factory CustomerCompanyService() => _instance ??= CustomerCompanyService._();

  CustomerCompanyService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CustomerCompanyResponseModel> saveCustomerCompany([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/save_company_customer.aspx', data: data);

      if (res.statusCode == 200) {
        return CustomerCompanyResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CustomerCompanyResponseModel();
  }

}
