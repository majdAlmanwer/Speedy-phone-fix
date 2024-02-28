// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speedy_phone_fix/Screen/Home/HomeScreenBody.dart';

import '../../Controller/NewCaseController.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewCaseController newCaseController = Get.put(NewCaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: HomeScreenBody(),
      ),
    );
  }
}
