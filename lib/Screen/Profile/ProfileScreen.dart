// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Screen/Profile/ProfileScreenBody.dart';
import 'package:speedy_phone_fix/Widgets/CustomButtomNavBar.dart';

import '../../Utils/AppStyle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          title: const Text('Profile'),
          centerTitle: true,
          titleTextStyle: AppBarTextStyle),
      body: ProfileScreenBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
