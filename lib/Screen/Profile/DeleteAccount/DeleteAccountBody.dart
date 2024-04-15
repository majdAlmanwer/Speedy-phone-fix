import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Controller/AuthController.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/ConfirmationDialog.dart';

class DeleteAccountBody extends StatefulWidget {
  const DeleteAccountBody({super.key});

  @override
  State<DeleteAccountBody> createState() => _DeleteAccountBodyState();
}

class _DeleteAccountBodyState extends State<DeleteAccountBody> {
  final TextEditingController deleteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  height: Get.width * .5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: TextGrey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: deleteController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 15.2),
                        hintText: "Account Deletion Reason",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Deletion Reason';
                        }

                        return null;
                      },
                      style: textStyle),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
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
                        showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmationDialog(
                                title: 'Are You Sure ?',
                                firstOnPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print(box.read('username'));
                                    Get.showOverlay(
                                        asyncFunction: () async =>
                                            await authController.deleteAccount(
                                              userName: box.read('username'),
                                              reason: deleteController.text,
                                            ),
                                        loadingWidget: const Center(
                                            child: CircularProgressIndicator(
                                          color: BlueColor,
                                        )),
                                        opacityColor:
                                            BlueColor.withOpacity(0.1));
                                  } else {
                                    Get.back();
                                  }
                                },
                                secundOnPressed: () {
                                  Get.back();
                                },
                                firstTitle: 'Yes',
                                secundTitle: 'No',
                              );
                            });
                        // if (_formKey.currentState!.validate()) {
                        //   print(box.read('username'));
                        //   Get.showOverlay(
                        //       asyncFunction: () async =>
                        //           await authController.deleteAccount(
                        //             userName: box.read('username'),
                        //             reason: deleteController.text,
                        //           ),
                        //       loadingWidget: const Center(
                        //           child: CircularProgressIndicator(
                        //         color: BlueColor,
                        //       )),
                        //       opacityColor: BlueColor.withOpacity(0.1));
                        // } else {
                        //   print('not VALID');
                        // }
                      },
                      child: const Text("Save",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                ),
              ]),
        ));
  }
}
