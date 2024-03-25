// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:speedy_phone_fix/Screen/Auth/SignIn/SignInScreenBody.dart';



class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var passwordController = TextEditingController();
    return const Scaffold(
      body: SignInScreenBody()
    );
  }
}
