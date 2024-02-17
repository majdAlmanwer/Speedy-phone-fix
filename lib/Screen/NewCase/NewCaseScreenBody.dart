// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';

import '../../Utils/AppStyle.dart';

class NewCaseScreenBody extends StatelessWidget {
  const NewCaseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ListTile(
        leading: Icon(Icons.search),
        title: Text(
          'title',
          style: textStyle,
        ),
      ),
      CustomTextFormField(hint: 'Search customer by mobile'),
    ]);
  }
}
