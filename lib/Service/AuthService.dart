import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Model/LoginResponseModel.dart';

import '../Api/Api.dart';
import '../Controller/LoaderController.dart';
import '../Model/MakeModelResponseModel.dart';

class AuthService {
  static AuthService? _instance;

  var dio = Dio();
  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<LoginResponseModel> login([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/signin.aspx', data: data);

      if (res.statusCode == 200) {
        print('login : ${res.data}');
        return LoginResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('login Exception :${e.response}');
      } else {
        print('login errorrrrrr');
      }
      loaderController.loading(false);
    }
    return LoginResponseModel();
  }

  Future<MakeModelResponseModel> signUp([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/signup.aspx', data: data);

      if (res.statusCode == 200) {
        return MakeModelResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('signup Exception :${e.response}');
      } else {
        print('signup errorrrrrr');
      }
      loaderController.loading(false);
    }
    return MakeModelResponseModel();
  }

  Future<MakeModelResponseModel> changePassword([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/change_password.aspx', data: data);

      if (res.statusCode == 200) {
        return MakeModelResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('change_password Exception :${e.response}');
      } else {
        print('change_password errorrrrrr');
      }
      loaderController.loading(false);
    }
    return MakeModelResponseModel();
  }

  Future<MakeModelResponseModel> deleteAccount([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.post('/delete_account.aspx', data: data);

      if (res.statusCode == 200) {
        return MakeModelResponseModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('delete_account Exception :${e.response}');
      } else {
        print('delete_account errorrrrrr');
      }
      loaderController.loading(false);
    }
    return MakeModelResponseModel();
  }
}
