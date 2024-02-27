// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';
import 'package:speedy_phone_fix/Screen/Home/homeWidget/HomeCardWidget.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(right: 12.0, left: 12.0, top: 8, bottom: 8),
      child: SafeArea(
        child: Column(
          children: [
            HomeCardWidget(
              title: 'Cases/Repairs',
              iconPath: 'Assets/Icons/Vector (2).png',
              onTap: () {
                Get.toNamed(AppRoutes.newcasescreen);
              },
            ),
            HomeCardWidget(
              title: 'Customers\n(Companies)',
              iconPath: 'Assets/Icons/Vector (1).png',
              onTap: () {
                Get.toNamed(AppRoutes.newcasescreen);
              },
            ),
            HomeCardWidget(
              title: 'Orders',
              iconPath: 'Assets/Icons/Vector (3).png',
              onTap: () {
                Get.toNamed(AppRoutes.orderScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
