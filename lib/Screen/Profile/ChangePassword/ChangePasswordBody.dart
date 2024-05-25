import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/AuthController.dart';

import '../../../Utils/AppStyle.dart';
import '../../../Widgets/AuthFormFiled.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AuthController authController = Get.put(AuthController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  AuthFormField(
                    controller: oldPasswordController,
                    validator: (val) {
                      print("Validating:  with value: $val");
                      if (val == null || val.isEmpty) {
                        return 'Please Enter Current Password'.tr;
                      }

                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'Assets/Icons/lock.png',
                        height: 10,
                        width: 10,
                      ),
                    ),
                    hint: 'Current Password'.tr,
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: LightGrey,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  AuthFormField(
                    controller: newPasswordController,
                    onChange: (val) {
                      val = newPasswordController.text;
                      print(val);
                    },
                    validator: (val1) {
                      if (val1 == null || val1.isEmpty) {
                        return 'Please enter your New Password'.tr;
                      }
                      // Add any additional validation for new password
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'Assets/Icons/lock.png',
                        height: 10,
                        width: 10,
                      ),
                    ),
                    hint: 'New Password'.tr,
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: LightGrey,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  AuthFormField(
                    controller: confirmPasswordController,
                    // onChange: (val) {
                    //   val = confirmPasswordController.text;
                    // },
                    validator: (val2) {
                      if (val2 == null || val2.isEmpty) {
                        return 'Please confirm your Password'.tr;
                      }
                      // Add validation to ensure password matches new password
                      if (val2 != newPasswordController.text) {
                        return 'Passwords do not match'.tr;
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'Assets/Icons/lock.png',
                        height: 10,
                        width: 10,
                      ),
                    ),
                    hint: 'Confirm Password'.tr,
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: LightGrey,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8.0,
              ),
              child: Container(
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
                        Get.showOverlay(
                            asyncFunction: () async =>
                                await authController.changePassword(
                                    userName: box.read('username'),
                                    oldPassword: oldPasswordController.text,
                                    newPassword: newPasswordController.text),
                            loadingWidget: const Center(
                                child: CircularProgressIndicator(
                              color: BlueColor,
                            )),
                            opacityColor: BlueColor.withOpacity(0.1));
                      } else {
                        print('not VALID');
                      }
                    },
                    child:  Text("Save".tr,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
