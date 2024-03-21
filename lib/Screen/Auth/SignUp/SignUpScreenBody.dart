// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

import 'package:speedy_phone_fix/Widgets/AuthFormFiled.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.1),
            AuthFormField(
              prefixIcon: Icon(
                Icons.person_outline,
                color: BlueColor,
              ),
              hint: 'Full Name',
            ),
            SizedBox(
              height: 10.0,
            ),
            AuthFormField(
              prefixIcon: Icon(
                Icons.phone,
                color: BlueColor,
              ),
              hint: 'Phone Number',
            ),
            SizedBox(
              height: 10.0,
            ),
            AuthFormField(
              hint: 'Password',
              prefixIcon: Icon(
                Icons.lock_open_outlined,
                color: BlueColor,
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: LightGrey,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: BlueColor),
              child: TextButton(
                  child: Text("Submit",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () => null),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Terms of use & privacy policy',
                    style: TextStyle(
                        color: BlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
