import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/SaveCaseResponseModel.dart';


import '../Controller/LoaderController.dart';

class SaveCaseService {
  static SaveCaseService? _instance;

  var dio = Dio();
  factory SaveCaseService() => _instance ??= SaveCaseService._();

  SaveCaseService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<SaveCaseResponseModel> saveCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/save_case.aspx', data: data);

      if (res.statusCode == 200) {
        return SaveCaseResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return SaveCaseResponseModel();
  }

}
