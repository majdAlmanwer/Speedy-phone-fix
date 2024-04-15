import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Screen/Profile/DeleteAccount/DeleteAccountBody.dart';

import '../../../Utils/AppStyle.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<DeleteAccountScreen> {
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
            title: Text('Delete My Account'),
            centerTitle: true,
            titleTextStyle: AppBarTextStyle),
        body: DeleteAccountBody());
  }
}
