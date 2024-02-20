// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:speedy_phone_fix/Screen/Home/HomeScreenBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HomeScreenBody(),
      ),
    );
  }
}
