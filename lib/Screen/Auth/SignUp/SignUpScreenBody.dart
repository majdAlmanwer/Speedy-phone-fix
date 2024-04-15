// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

import 'package:speedy_phone_fix/Widgets/AuthFormFiled.dart';

import '../../../Controller/AuthController.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.1),
              AuthFormField(
                controller: nameController,
                validator: (val) {
                  print("Validating:  with value: $val");
                  if (val == null || val.isEmpty) {
                    return 'Please Enter Full Name'.tr;
                  }

                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'Assets/Icons/profile.png',
                    height: 10,
                    width: 10,
                  ),
                ),
                hint: 'Full Name',
              ),
              const SizedBox(
                height: 10.0,
              ),
              AuthFormField(
                controller: emailController,
                hint: 'Email',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please Enter Email'.tr;
                  } else if (!emailRegex.hasMatch(val)) {
                    return 'Please Enter Valid Email'.tr;
                  }

                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'Assets/Icons/mail.png',
                    color: BlueColor,
                    height: 10,
                    width: 10,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: LightGrey,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              AuthFormField(
                controller: phoneController,
                validator: (val) {
                  print("Validating:  with value: $val");
                  if (val == null || val.isEmpty) {
                    return 'Please Enter Phone Number'.tr;
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(
                  Icons.phone,
                  color: BlueColor,
                ),
                hint: 'Phone Number',
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 20.0,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('valid');
                        Get.showOverlay(
                            asyncFunction: () async =>
                                await authController.signUp(
                                    fullname: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text),
                            loadingWidget: const Center(
                                child: CircularProgressIndicator(
                              color: BlueColor,
                            )),
                            opacityColor: BlueColor.withOpacity(0.1));
                      }
                    },
                    child: const Text("Submit",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),
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
      ),
    );
  }
}
