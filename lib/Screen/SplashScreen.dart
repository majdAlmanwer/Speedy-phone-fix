import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/SplashController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  SplashController splashController = Get.put(SplashController());

  // @override
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, (() => splashController.check()));
  }

  @override
  build(BuildContext context) {
    return Container(
      width: Get.width * 0.1,
      height: Get.width * 0.1,
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Container(
          width: Get.width * 0.7,
          height: Get.width * 0.5,
          decoration: const BoxDecoration(
              // color: sblueColor,
              ),
          child: Image.asset('Assets/Images/logo1.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
