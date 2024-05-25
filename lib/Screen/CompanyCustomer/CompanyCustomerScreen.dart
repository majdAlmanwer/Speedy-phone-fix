// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/CompanyCustomer/CompanyCustomerScreenBody.dart';
import 'package:speedy_phone_fix/Widgets/CustomButtomNavBar.dart';
import '../../Utils/AppStyle.dart';

class CompanyCustomerScreen extends StatelessWidget {
  const CompanyCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            color: TextGrey,
          ),
          title: Text('Customer Company'.tr),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: CompanyCustomerScreenBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
