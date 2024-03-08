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
  Future<dynamic> login(
      {required String userName, required String password}) async {
    loaderController.loading(true);
    dio.FormData request =
        dio.FormData.fromMap({'username': userName, 'password': password});
    var response = await AuthService().login(request);
    try {
      branchId = response.branchId!.toString();

      print('user branchId is .... .... $branchId}');

      box.write('branchId', branchId);

      print('sssssssssssss user branchId is .... .... ${box.read('branchId')}');

      box.write('loggedIn', true);
      print('is loggedIn  .... ....${box.read('loggedIn')}');

      msgController.showSuccessMessage(response.message, response.description);
      if (response.message == 'success') {
        Get.offAndToNamed(AppRoutes.homescreen);
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
