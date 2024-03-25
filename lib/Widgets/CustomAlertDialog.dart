import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Routes/Routes.dart';

import '../Utils/AppStyle.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: AlertDialog(
        // clipBehavior: Clip.hardEdge,
        elevation: 30,

        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(12),
        insetPadding: const EdgeInsets.all(10),

        content: Container(
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(15)),
          height: Get.height * 0.40,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minWidth: Get.width * 0.82,
                  height: Get.height * 0.07,
                  onPressed: () {
                    Get.offNamed(AppRoutes.companyCustomerScreen);
                  },
                  color: BlueColor,
                  child: const Text(
                    'Company Customer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minWidth: Get.width * 0.92,
                  height: Get.height * 0.07,
                  onPressed: () {
                    Get.offNamed(AppRoutes.individualCustomerScreen);
                  },
                  color: BlueColor,
                  child: const Text(
                    'Individual Customer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ),
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     child: Text('Close'),
        //   ),
        // ],
      ),
    );
  }
}
