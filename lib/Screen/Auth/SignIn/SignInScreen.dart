// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:speedy_phone_fix/Screen/Auth/SignIn/SignInScreenBody.dart';

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';

import '../../../Utils/AppStyle.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var passwordController = TextEditingController();
    return Scaffold(
      body: SignInScreenBody()
    );
  }
}
