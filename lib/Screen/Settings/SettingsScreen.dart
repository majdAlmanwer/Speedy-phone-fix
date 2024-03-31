import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Settings/SettingsScreenBody.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Settings"),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: const SettingsScreenBody(),
    );
  }
}
