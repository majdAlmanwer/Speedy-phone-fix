import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

class ConfirmationDialog extends StatelessWidget {
  ConfirmationDialog(
      {super.key,
      required this.firstOnPressed,
      required this.secundOnPressed,
      required this.firstTitle,
      required this.secundTitle,
      this.title});
  Function()? firstOnPressed;
  Function()? secundOnPressed;
  String firstTitle;
  String secundTitle;
  String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: AlertDialog(
        // clipBehavior: Clip.hardEdge,
        elevation: 30,

        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(12),
        insetPadding: EdgeInsets.all(10),
        title: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: BlueColor, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        content: Container(
          decoration: BoxDecoration(
              color: Colors.white60, borderRadius: BorderRadius.circular(15)),
          height: Get.height * 0.20,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.3,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: Get.width * 0.82,
                    height: Get.height * 0.07,
                    onPressed: firstOnPressed,
                    color: BlueColor,
                    child: Text(
                      firstTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.1),
                SizedBox(
                  width: Get.width * 0.3,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: Get.width * 0.92,
                    height: Get.height * 0.07,
                    onPressed: secundOnPressed,
                    color: BlueColor,
                    child: Text(
                      secundTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
