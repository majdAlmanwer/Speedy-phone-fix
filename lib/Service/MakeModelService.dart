import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CaaseStatusResponseModel.dart';
import 'package:speedy_phone_fix/Model/MakeModelResponseModel.dart';

import '../Controller/LoaderController.dart';

class MakeModelService {
  static MakeModelService? _instance;

  var dio = Dio();
  factory MakeModelService() => _instance ??= MakeModelService._();

  MakeModelService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CaseStutsResponseModel> addMakeModel([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/xnew_make_model.asp', data: data);

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

  Future<CaseStutsResponseModel> editMakeModel([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/edit_device_data.aspx', data: data);

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

  Future<CaseStutsResponseModel> deleteMakeModel([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/delete_make_model.aspx', data: data);

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
