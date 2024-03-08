// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speedy_phone_fix/Screen/Auth/SignUp/SignUpScreenBody.dart';

import '../../../Utils/AppStyle.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SignUpScreenBody()
    );
  }
}
