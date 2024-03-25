// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

class SettingCard extends StatelessWidget {
  SettingCard(
      {super.key, required this.data, required this.path, required this.ontap});
  String path;
  String data;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: Get.width * .450,
        height: Get.height * .200,
        padding:
            const EdgeInsets.only(left: 16.5, right: 16.5, top: 35, bottom: 35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('Assets/Images/Rectangle 62.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(
                  width: Get.width * .065, height: Get.height * .065, path),
            ),
            Text(
              data,
              style: titleCardStyle,
            )
          ],
        ),
      ),
    );
  }
}
