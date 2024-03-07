// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/MakeModel/MakeModelScreenBody.dart';
import '../../Utils/AppStyle.dart';

class MakeModelScreen extends StatelessWidget {
  const MakeModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MakeModelScreenBody(),
    );
  }
}
