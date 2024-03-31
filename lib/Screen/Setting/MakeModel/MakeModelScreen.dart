import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Setting/MakeModel/MakeModelBody.dart';

import '../../../Utils/AppStyle.dart';

class MakeModelScreen extends StatelessWidget {
  const MakeModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            color: TextGrey,
          ),
          title: const Text('Make Model'),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: MakeModelBody(),
    );
  }
}
