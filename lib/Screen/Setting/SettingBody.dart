import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Setting/SettingWidget/SettingCardWidget.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingCardWidget(
                    title: 'Case Status',
                    iconPath: 'Assets/Icons/case-status.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.casestatusscreen);
                    }),
                SettingCardWidget(
                    title: 'Case Type',
                    iconPath: 'Assets/Icons/case-type.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.casetypescreen);
                    }),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingCardWidget(
                    title: 'Make Model',
                    iconPath: 'Assets/Icons/make-model.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.makemodelscreen);
                    }),
                SettingCardWidget(
                    title: 'Device Data',
                    iconPath: 'Assets/Icons/device-data.png',
                    onTap: () {
                      Get.toNamed(AppRoutes.devicedatascreen);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
