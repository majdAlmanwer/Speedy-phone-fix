// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/BottomNavBarController.dart';
import '../Utils/AppStyle.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  CustomBottomNavBarController customBottomNavBarController =
      Get.put(CustomBottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomNavBarController>(
      builder: (controller) {
        return SizedBox(
          height: Get.height * .09,
          // padding: EdgeInsets.all(8),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle:
                const TextStyle(color: BlueColor, fontFamily: 'Mulish'),
            unselectedLabelStyle: const TextStyle(
                color: BorderGrey,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w200),
            selectedItemColor: BlueColor,
            unselectedItemColor: BorderGrey,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeSelectedIndex,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                // tooltip: 'home',
                // activeIcon: Image.asset(
                //   'assets/images/fi_home.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                icon: Icon(Icons.home_rounded),
                // Image.asset(
                //   'assets/images/fi_home_1.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                // activeIcon:
                // Image.asset(
                //   'assets/images/fi_grid_blue.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                icon: Icon(Icons.settings_outlined),
                // Image.asset(
                //   'assets/images/fi_grid.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                label: 'settings'.tr,
              ),
              // const BottomNavigationBarItem(
              //     icon: SizedBox(
              //       width: 10,
              //     ),
              //     label: ''),

              BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   'assets/images/fi_user.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                icon: Icon(Icons.person_2),
                // Image.asset(
                //   'assets/images/fi_user-1.png',
                //   height: getPercentScreenHeight(3),
                //   width: getPercentScreenWidth(8),
                // ),
                label: 'Profile'.tr,
              ),
            ],
          ),
        );
      },
    );
  }
}
