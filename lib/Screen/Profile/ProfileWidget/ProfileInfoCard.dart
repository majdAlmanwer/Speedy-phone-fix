// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileInfoCard extends StatelessWidget {
  ProfileInfoCard({super.key});
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(offset: Offset.zero, color: Colors.white70)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: Get.height * 1,
              width: Get.width * 0.2,
              child: Image.asset('Assets/Icons/account icon.png')),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                box.read('employeeName'),
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish'),
              ),
              Text(
                box.read('branchName'),
                style: const TextStyle(
                    color: Colors.black45, fontSize: 16, fontFamily: 'Mulish'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
