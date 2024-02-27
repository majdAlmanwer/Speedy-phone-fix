import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Model/CaseStatusModel.dart';

import '../Api/Api.dart';
import '../Controller/LoaderController.dart';

class NewCaseService {
  static NewCaseService? _instance;

  var dio = Dio();
  factory NewCaseService() => _instance ??= NewCaseService._();

  NewCaseService._();

  final loaderController = Get.put(LoaderController());

  Future<CaseStatusModel> fetchCaseStatus(int id) async {
    loaderController.loading(true);
    try {
      var res = await Api().dio.get('case_status.aspx?branch_id=$id');

      if (res.statusCode == 200) {
        return CaseStatusModel.fromJson(jsonDecode(res.data));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode != 200) {
          print('**********  New Case Error *************${e.response}');
        }
      } else {
        print('New Case errorrrrrr $e');
      }

      loaderController.loading(false);
    }
    return CaseStatusModel();
  }
}
