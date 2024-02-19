// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/IndividualCustomer/IndividualCustomerScreenBody.dart';
import '../../Utils/AppStyle.dart';

class IndividualCustomerScreen extends StatelessWidget {
  const IndividualCustomerScreen({super.key});

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
          title: Text('New Customer'),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: IndividualCustomerScreenBody(),
    );
  }
}
