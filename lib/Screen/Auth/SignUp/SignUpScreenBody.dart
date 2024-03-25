// ignore_for_file: file_names

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
              prefixIcon: const Icon(
                Icons.person_outline,
                color: BlueColor,
              ),
              hint: 'Full Name',
            ),
            const SizedBox(
              height: 10.0,
            ),
            AuthFormField(
              prefixIcon: const Icon(
                Icons.phone,
                color: BlueColor,
              ),
              hint: 'Phone Number',
            ),
            const SizedBox(
              height: 10.0,
            ),
            AuthFormField(
              hint: 'Password',
              prefixIcon: const Icon(
                Icons.lock_open_outlined,
                color: BlueColor,
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: LightGrey,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: BlueColor),
              child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {},
                  child: const Text("Submit",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
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
