// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileListItem extends StatelessWidget {
  ProfileListItem(
      {super.key, required this.title, required this.imagePath, this.onTap});
  String title;
  String imagePath;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: Get.height * 0.08,
                  width: Get.width * 0.06,
                  child: Image.asset(imagePath)),
              SizedBox(
                width: Get.height * 0.04,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Mulish'),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 25,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
