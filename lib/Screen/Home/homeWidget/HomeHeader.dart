import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(
            right: 0.0, left: 0.0, top: 0.0, bottom: 50.0),
        child: Image.asset(
          'Assets/Images/logo1.png',
          height: Get.height * 0.1,
        ),
      ),
    );
  }
}
