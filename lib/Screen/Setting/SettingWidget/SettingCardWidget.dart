import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/AppStyle.dart';

class SettingCardWidget extends StatelessWidget {
  SettingCardWidget(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap});
  String title;
  String iconPath;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.only(right: 1, left: 5),
        width: Get.width * .45,
        height: Get.height * .25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('Assets/Images/back-ground-2.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: Get.height * .05,
              width: Get.width * .4,
              iconPath,
              fit: BoxFit.contain,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: titleCardStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
