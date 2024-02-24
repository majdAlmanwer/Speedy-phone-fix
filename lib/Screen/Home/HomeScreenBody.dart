// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Home/homeWidget/HomeCardWidget.dart';
import 'package:speedy_phone_fix/Screen/Home/homeWidget/HomeHeader.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
      child: SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            HomeCardWidget(
              title: 'Cases/Repairs',
              iconPath: 'Assets/Icons/Vector(4).png',
              onTap: () {
                Get.toNamed(AppRoutes.newcasescreen);
              },
            ),
            HomeCardWidget(
              title: 'Customers\n(Private)',
              iconPath: 'Assets/Icons/Vector (2).png',
              onTap: () {
                Get.toNamed(AppRoutes.newcasescreen);
              },
            ),
            HomeCardWidget(
              title: 'Customers\n(Companies)',
              iconPath: 'Assets/Icons/Vector (1).png',
              onTap: () {
                Get.toNamed(AppRoutes.companyCustomerScreen);
              },
            ),
            HomeCardWidget(
              title: 'Orders',
              iconPath: 'Assets/Icons/Vector (3).png',
              onTap: () {
                Get.toNamed(AppRoutes.newcasescreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
