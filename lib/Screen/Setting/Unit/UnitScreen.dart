// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Setting/Unit/UnitBody.dart';

import '../../../Utils/AppStyle.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: TextGrey,
          ),
          title: Text('Unit'.tr),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: UnitBody(),
    );
  }
}
