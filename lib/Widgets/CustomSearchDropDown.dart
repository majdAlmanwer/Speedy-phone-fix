// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/NewCaseController.dart';
import '../Utils/AppStyle.dart';

class CustomSearchDropDown extends StatelessWidget {
  CustomSearchDropDown({super.key, required this.searchResult});
  NewCaseController newCaseController = Get.find();
  RxString searchResult = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15.0,
        left: 15.0,
      ),
      child: CustomDropdown.searchRequest(
        searchRequestLoadingIndicator: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: CircularProgressIndicator(
              color: BlueColor,
            ),
          ),
        ),
        decoration: CustomDropdownDecoration(
            closedFillColor: FormBackGraund.withOpacity(.5),
            closedBorderRadius: BorderRadius.circular(10.0),
            closedBorder: Border.all(color: BorderGrey)),
        futureRequest: (p0) async {
          await newCaseController.getCustomersByMobile(9, p0);
          return newCaseController.customersList
              .map((element) => element.cusName ?? 'Result Not Fuond')
              .toList()
              .obs;
        },
        hintText: 'Search customer by mobile',
        items: const [],
        onChanged: (value) {
          searchResult.value = value;
        },
      ),
    );
  }
}
