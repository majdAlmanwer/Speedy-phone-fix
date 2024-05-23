import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/TermsAndPrivacyController.dart';
import '../../../Utils/AppStyle.dart';

class PrivacyBody extends StatefulWidget {
  const PrivacyBody({super.key});

  @override
  State<PrivacyBody> createState() => _PrivacyBodyState();
}

class _PrivacyBodyState extends State<PrivacyBody> {
  TermsAndPrivacyController termsAndPrivacyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 2,
            child: Text(
              termsAndPrivacyController.privacyPolicy.privacyPloicy.toString(),
              style: const TextStyle(
                  color: BlueColor, fontWeight: FontWeight.bold, fontSize: 20),
              softWrap: true,
            )),
      ],
    );
  }
}
