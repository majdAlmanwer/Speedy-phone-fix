// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Setting/SettingBody.dart';
import 'package:speedy_phone_fix/Widgets/CustomButtomNavBar.dart';

import '../../Utils/AppStyle.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          title:  Text('Settings'.tr),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: const SettingBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
