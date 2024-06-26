// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Profile/Language/ChangeLanguageScreen.dart';
import 'package:speedy_phone_fix/Screen/Profile/PrivacyPolicy/PricavyPolicyScreen.dart';
import 'package:speedy_phone_fix/Screen/Profile/ProfileWidget/ProfileListItem.dart';
import 'package:speedy_phone_fix/Screen/Profile/Terms/TermsScreen.dart';

import '../../Controller/TermsAndPrivacyController.dart';
import 'ProfileWidget/ProfileInfoCard.dart';

class ProfileScreenBody extends StatefulWidget {
  ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  GetStorage box = GetStorage();
  final termsAndPrivacyController = Get.put(TermsAndPrivacyController());
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
                title: 'Change Password'.tr, imagePath: 'Assets/Icons/lock.png'),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.deleteaccountscreen);
            },
            child: ProfileListItem(
                title: 'Delete Account'.tr, imagePath: 'Assets/Icons/profile.png'),
          ),
          ProfileListItem(
            title: 'Change Language'.tr,
            imagePath: 'Assets/Icons/lang.png',
            onTap: () {
              Get.to(ChangeLanguageScreen());
            },
          ),
          ProfileListItem(
            title: 'Privacy Policy'.tr,
            imagePath: 'Assets/Icons/privacy.png',
            onTap: () {
              Get.to(PrivacyPolicyScreen());
            },
          ),
          ProfileListItem(
            title: 'Terms of Use'.tr,
            imagePath: 'Assets/Icons/terms.png',
            onTap: () {
              Get.to(TermsScreen());
            },
          ),
          ProfileListItem(
            title: 'Logout'.tr,
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
