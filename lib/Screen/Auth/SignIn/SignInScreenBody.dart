// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Controller/AuthController.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

import 'package:speedy_phone_fix/Widgets/AuthFormFiled.dart';

//aleen code
import 'package:get/get.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});
  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyPageState();
}

class _SignInScreenBodyPageState extends State<SignInScreenBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  AuthController authController = Get.put(AuthController());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              AuthFormField(
                controller: emailController,
                onChange: (val) {
                  val == emailController.text;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'Assets/Icons/profile.png',
                    height: 10,
                    width: 10,
                  ),
                ),
                hint: 'User Name'.tr,
              ),
              const SizedBox(
                height: 20.0,
              ),
              AuthFormField(
                controller: passwordController,
                onChange: (val) {
                  val == passwordController.text;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'Assets/Icons/lock.png',
                    height: 10,
                    width: 10,
                  ),
                ),
                hint: 'Password'.tr,
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: LightGrey,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 8.0,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BlueColor),
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
                        authController.login(
                            userName: emailController.text,
                            password: passwordController.text);
                      },
                      child: Text("Sign In".tr,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
