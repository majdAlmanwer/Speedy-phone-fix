import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/TermsAndPrivacyController.dart';
import '../../../Utils/AppStyle.dart';

class TermsBody extends StatefulWidget {
  const TermsBody({super.key});

  @override
  State<TermsBody> createState() => _TermsBodyState();
}

class _TermsBodyState extends State<TermsBody> {
  TermsAndPrivacyController termsAndPrivacyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            termsAndPrivacyController.termsConditions.termsConditions
                .toString(),
            style: TextStyle(
                color: BlueColor, fontWeight: FontWeight.bold, fontSize: 20),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
