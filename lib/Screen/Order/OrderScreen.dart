// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Order/OrderScreenBody.dart';
import 'package:speedy_phone_fix/Widgets/CustomButtomNavBar.dart';

import '../../Utils/AppStyle.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

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
          title: Text('Order'.tr),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: OrderScreenBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
