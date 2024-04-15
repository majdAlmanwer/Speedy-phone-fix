import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/MessageHandlerController.dart';

import '../Routes/Routes.dart';
import '../Service/AuthService.dart';
import 'LoaderController.dart';

class AuthController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  MessagesHandlerController msgController =
      Get.put(MessagesHandlerController());

  GetStorage box = GetStorage();

  String branchId = '';
  String branchName = '';
  String employeeName = '';
  String username = '';
  Future<dynamic> login(
      {required String userName, required String password}) async {
    loaderController.loading(true);
    dio.FormData request =
        dio.FormData.fromMap({'username': userName, 'password': password});
    var response = await AuthService().login(request);
    try {
      branchId = response.branchId!.toString();
      branchName = response.branchName!;
      employeeName = response.empName!;
      username = response.username!;
      print('user branchId is .... .... $branchId}');

      box.write('branchId', branchId);
      box.write('branchName', branchName);
      box.write('employeeName', employeeName);
      box.write('username', username);

      print('sssssssssssss user branchId is .... .... ${box.read('branchId')}');
      print('username is .... .... ${box.read('username')}');

      box.write('loggedIn', true);
      print('is loggedIn  .... ....${box.read('loggedIn')}');

      msgController.showSuccessMessage(response.message, response.description);
      if (response.message == 'success') {
        Get.offAllNamed(AppRoutes.homescreen);
      }
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

  Future<dynamic> signUp(
      {required String fullname,
      required String email,
      required String phone}) async {
    loaderController.loading(true);
    dio.FormData request = dio.FormData.fromMap(
        {'fullname': fullname, 'email': email, 'phone': phone});
    var response = await AuthService().signUp(request);
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

  Future<dynamic> changePassword(
      {required String userName,
      required String oldPassword,
      required String newPassword}) async {
    loaderController.loading(true);
    dio.FormData request = dio.FormData.fromMap({
      'username': userName,
      'old_password': oldPassword,
      'new_password': newPassword
    });
    var response = await AuthService().changePassword(request);
    try {
      msgController.showSuccessMessage(response.message, response.description);
      if (response.message == 'success') {
        Get.offAllNamed(AppRoutes.homescreen);
      }
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

  Future<dynamic> deleteAccount({
    required String userName,
    required String reason,
  }) async {
    loaderController.loading(true);
    dio.FormData request = dio.FormData.fromMap({
      'username': userName,
      'reason': reason,
    });
    var response = await AuthService().deleteAccount(request);
    try {
      msgController.showSuccessMessage(response.message, response.description);
      if (response.message == 'success') {
        box.write('loggedIn', false);
        Get.offAllNamed(AppRoutes.authtabbar);
      }
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
