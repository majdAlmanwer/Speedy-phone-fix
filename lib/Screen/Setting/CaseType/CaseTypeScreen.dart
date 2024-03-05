import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Setting/CaseStatus/CaseStatusBody.dart';

import '../../../Utils/AppStyle.dart';

class CaseTypeScreen extends StatelessWidget {
  const CaseTypeScreen({super.key});

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
          title: Text('Case Type'),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: CaseStatusBody(),
    );
  }
}
