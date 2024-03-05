import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:speedy_phone_fix/Model/CaseDeviceDataModel.dart';
import 'package:speedy_phone_fix/Model/CaseMakeModel.dart';

import 'package:speedy_phone_fix/Model/FindCustomerByMobile.dart';
import 'package:speedy_phone_fix/Model/ListAllCustomers.dart';
import 'package:speedy_phone_fix/Model/CaseTypeModel.dart';
import 'package:speedy_phone_fix/Service/NewCaseService.dart';

import 'package:speedy_phone_fix/Model/CaseStatusModel.dart';

import 'package:speedy_phone_fix/Service/NewCaseService.dart';

import '../Model/CaseStatusModel.dart';

import 'LoaderController.dart';

class NewCaseController extends GetxController {
  final loaderController = Get.put(LoaderController());
  final box = GetStorage();
  List<CaseStatus> caseStatusList = [];

  List<CaseType>? caseTypeList = [];
  List<CaseMakeModel>? caseMakeModelList = [];
  List<CaseDeviceTypeModel>? caseDeviceTypeList = [];
  List<AllCustomers>? allCustomersList = [];
  List<Customers>? customersList = [];

  @override
  void onInit() {

    // Perform initialization tasks here
    getCaseStatus(9);

    super.onInit();
  }

  Future<dynamic> getCaseStatus(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchCaseStatus(9);

      caseStatusList = res.caseStatus!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }


  Future<dynamic> getCaseType(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchCaseType(9);

      caseTypeList = res.caseType!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }

  Future<dynamic> getCaseMake(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchCaseMakeModel(9);

      caseMakeModelList = res.caseMakeModel!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }

  Future<dynamic> getCaseDeviceData(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchCaseDeviceData(9);

      caseDeviceTypeList = res.caseDeviceType!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }

  Future<dynamic> getCustomersByMobile(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchFindCustomerByMobile(9);

      customersList = res.customers!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }

  Future<dynamic> getAllCustomers(int branchId) async {
    loaderController.loading(true);
    try {
      var res = await NewCaseService().fetchListAllCustomers(9);

      allCustomersList = res.Allcustomers!;
      print(caseStatusList.length);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr is $e');
      }
    }
    update();
    loaderController.loading(false);
  }

}
