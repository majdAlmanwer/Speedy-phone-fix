import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Api/Api.dart';
import '../Controller/LoaderController.dart';
import '../Model/PrivacyPolicyModel.dart';
import '../Model/TermsModel.dart';

class TermsAndPrivacyService {
  static TermsAndPrivacyService? _instance;

  var dio = Dio();
  factory TermsAndPrivacyService() => _instance ??= TermsAndPrivacyService._();

  TermsAndPrivacyService._();

  final LoaderController loaderController = Get.find<LoaderController>();

  GetStorage box = GetStorage();

  Future<TermsConditionsModel> getTermsConditions([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.get('/terms_and_conditions.aspx', data: data);

      if (res.statusCode == 200) {
        return TermsConditionsModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return TermsConditionsModel();
  }

  Future<PrivacyPolicyModel> getPrivacyPolicy([dynamic data]) async {
    loaderController.loading(true);

    try {
      var res = await Api().dio.get('/privacy_policy.aspx', data: data);

      if (res.statusCode == 200) {
        return PrivacyPolicyModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        print('Exception :${e.response}');
      } else {
        print('errorrrrrr');
      }
      loaderController.loading(false);
    }
    return PrivacyPolicyModel();
  }
}
