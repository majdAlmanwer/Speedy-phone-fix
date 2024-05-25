import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Profile/Language/CahngeLanguageBody.dart';

import '../../../Utils/AppStyle.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
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
            title: Text('Change Language'.tr),
            centerTitle: true,
            titleTextStyle: AppBarTextStyle),
        body: ChangeLanguageBody());
  }
}
