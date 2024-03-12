// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Profile/ProfileWidget/ProfileListItem.dart';

import 'ProfileWidget/ProfileInfoCard.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Get.width * 0.05, left: Get.width * 0.05),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          ProfileInfoCard(),
          SizedBox(
            height: Get.height * 0.05,
          ),
          ProfileListItem(
              title: 'Change Password', imagePath: 'Assets/Icons/lock.png'),
          ProfileListItem(
              title: 'Delete Account', imagePath: 'Assets/Icons/profile.png'),
          ProfileListItem(title: 'Logout', imagePath: 'Assets/Icons/logout.png')
        ],
      ),
    );
  }
}
