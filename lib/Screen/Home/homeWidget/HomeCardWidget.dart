// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget(
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
        width: Get.width,
        height: Get.height * .215,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('Assets/Images/Rectangle.png'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: titleCardStyle,
                ),
              ),
            ),
            Image.asset(
              height: Get.height * .150,
              width: Get.width * .4,
              iconPath,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
