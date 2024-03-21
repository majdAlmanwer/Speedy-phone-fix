import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:speedy_phone_fix/Model/CaseDeviceDataModel.dart';
import 'package:speedy_phone_fix/Model/CaseMakeModel.dart';
import 'package:speedy_phone_fix/Model/CaseStatusModel.dart';
import 'package:speedy_phone_fix/Model/CaseTypeModel.dart';
import 'package:speedy_phone_fix/Model/FindCustomerByMobile.dart';
import 'package:speedy_phone_fix/Model/ListAllCustomers.dart';

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

  Future<CaseTypeModel> fetchCaseType(int id) async {
    loaderController.loading(true);
    try {
      var res = await Api().dio.get('case_type.aspx?branch_id=$id');

      if (res.statusCode == 200) {
        return CaseTypeModel.fromJson(jsonDecode(res.data));
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
    return CaseTypeModel();
  }

  Future<CaseMakeModel> fetchCaseMakeModel(int id) async {
    loaderController.loading(true);
    try {
      var res = await Api().dio.get('case_make_model.aspx?branch_id=$id');

      if (res.statusCode == 200) {
        return CaseMakeModel.fromJson(jsonDecode(res.data));
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
    return CaseMakeModel();
  }

  Future<CaseDeviceTypeModel> fetchCaseDeviceData(String id) async {
    loaderController.loading(true);
    try {
      var res = await Api().dio.get('case_device_data.aspx?MakeModel_id=$id');

      if (res.statusCode == 200) {
        return CaseDeviceTypeModel.fromJson(jsonDecode(res.data));
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
    return CaseDeviceTypeModel();
  }

  Future<CustomersByMobile> fetchFindCustomerByMobile(
      int id, String phoneNumber) async {
    loaderController.loading(true);
    try {
      var res = await Api()
          .dio
          .get('filter_by_mobile.aspx?prefixText=$phoneNumber&branch_id=$id');

      if (res.statusCode == 200) {
        return CustomersByMobile.fromJson(jsonDecode(res.data));
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
    return CustomersByMobile();
  }

  Future<AllCustomersModel> fetchListAllCustomers(int id) async {
    loaderController.loading(true);
    try {
      var res = await Api().dio.get('all_customers.aspx?branch_id=$id');

      if (res.statusCode == 200) {
        return AllCustomersModel.fromJson(jsonDecode(res.data));
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
    return AllCustomersModel();
  }
}
