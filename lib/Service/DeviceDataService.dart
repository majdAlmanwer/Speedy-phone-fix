import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Api/Api.dart';
import 'package:speedy_phone_fix/Model/CaseDeviceDataResponseModel.dart';
import '../Controller/LoaderController.dart';

class DeviceDataService {
  static DeviceDataService? _instance;

  var dio = Dio();
  factory DeviceDataService() => _instance ??= DeviceDataService._();

  DeviceDataService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<CaseDeviceDataResponseModel> addNewDeviceData([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/new_device_data.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseDeviceDataResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseDeviceDataResponseModel();
  }

  Future<CaseDeviceDataResponseModel> editDeviceData([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/edit_device_data.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseDeviceDataResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseDeviceDataResponseModel();
  }

  Future<CaseDeviceDataResponseModel> deleteDeviceData([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/delete_device_data.aspx', data: data);

      if (res.statusCode == 200) {
        return CaseDeviceDataResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return CaseDeviceDataResponseModel();
  }
}
