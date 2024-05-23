import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/TermsAndPrivacyController.dart';
import '../../../Utils/AppStyle.dart';

class TermsAndPrivacyScreen extends StatefulWidget {
  const TermsAndPrivacyScreen({super.key});

  @override
  State<TermsAndPrivacyScreen> createState() => _TermsAndPrivacyScreenState();
}

class _TermsAndPrivacyScreenState extends State<TermsAndPrivacyScreen> {
  TermsAndPrivacyController termsAndPrivacyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              color: TextGrey,
            ),
            title: Text('Terms of use & privacy policy'),
            centerTitle: true,
            titleTextStyle: AppBarTextStyle),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'privacy policy',
                  style: AppBarTextStyle,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  termsAndPrivacyController.privacyPolicy.privacyPloicy
                      .toString(),
                  style: TextStyle(
                      color: BlueColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                  softWrap: true,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  'Terms of use ',
                  style: AppBarTextStyle,
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  termsAndPrivacyController.termsConditions.termsConditions
                      .toString(),
                  style: TextStyle(
                      color: BlueColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ));
  }
}
