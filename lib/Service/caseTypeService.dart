import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CaseTypeResponseModel.dart';

import '../Controller/LoaderController.dart';

class CaseTypeService {
  static CaseTypeService? _instance;

  var dio = Dio();
  factory CaseTypeService() => _instance ??= CaseTypeService._();

  CaseTypeService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CaseTypeResponseModel> addNewCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/new_case_type.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseTypeResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseTypeResponseModel();
  }

  Future<CaseTypeResponseModel> editCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/edit_case_type.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseTypeResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseTypeResponseModel();
  }

  Future<CaseTypeResponseModel> deleteCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/delete_case_type.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseTypeResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseTypeResponseModel();
  }
}
