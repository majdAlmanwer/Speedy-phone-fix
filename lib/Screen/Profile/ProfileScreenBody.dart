// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Profile/PrivacyPolicy/PricavyPolicyScreen.dart';
import 'package:speedy_phone_fix/Screen/Profile/ProfileWidget/ProfileListItem.dart';
import 'package:speedy_phone_fix/Screen/Profile/Terms/TermsScreen.dart';

import 'ProfileWidget/ProfileInfoCard.dart';

class ProfileScreenBody extends StatelessWidget {
  ProfileScreenBody({super.key});
  GetStorage box = GetStorage();
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
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.changepasswordscreen);
            },
            child: ProfileListItem(
                title: 'Change Password', imagePath: 'Assets/Icons/lock.png'),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.deleteaccountscreen);
            },
            child: ProfileListItem(
                title: 'Delete Account', imagePath: 'Assets/Icons/profile.png'),
          ),
          ProfileListItem(
            title: 'Privacy Policy',
            imagePath: 'Assets/Icons/privacy.png',
            onTap: () {
              Get.to(PrivacyPolicyScreen());
            },
          ),
          ProfileListItem(
            title: 'Terms of Use',
            imagePath: 'Assets/Icons/terms.png',
            onTap: () {
              Get.to(TermsScreen());
            },
          ),
          ProfileListItem(
            title: 'Logout',
            imagePath: 'Assets/Icons/logout.png',
            onTap: () {
              Get.offAllNamed(AppRoutes.authtabbar);
              box.write('loggedIn', false);
            },
          )
        ],
      ),
    );
  }
}
