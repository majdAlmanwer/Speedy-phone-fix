import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CaaseStatusResponseModel.dart';

import '../Controller/LoaderController.dart';

class CaseStatusService {
  static CaseStatusService? _instance;

  var dio = Dio();
  factory CaseStatusService() => _instance ??= CaseStatusService._();

  CaseStatusService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CaseStutsResponseModel> addNewCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/new_case_status.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseStutsResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseStutsResponseModel();
  }

  Future<CaseStutsResponseModel> editCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/edit_case_status.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseStutsResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseStutsResponseModel();
  }

  Future<CaseStutsResponseModel> deleteCase([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/delete_case_status.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseStutsResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseStutsResponseModel();
  }
}
