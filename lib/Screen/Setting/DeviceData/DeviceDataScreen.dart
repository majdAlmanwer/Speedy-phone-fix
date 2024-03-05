import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Setting/DeviceData/DeviceDataBody.dart';

import '../../../Utils/AppStyle.dart';

class DeviceDataScreen extends StatelessWidget {
  const DeviceDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            color: TextGrey,
          ),
          title: Text('Device Data'),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: DeviceDataBody(),
    );
  }
}
