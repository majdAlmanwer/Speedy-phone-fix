// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Widgets/CustomButton.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';

class CompanyCustomerScreenBody extends StatelessWidget {
  const CompanyCustomerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Customer’s Name',
              style: textStyle,
            ),
          ),
          CustomTextFormField(),
          const ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text(
              'Address',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Customer’s Address",
          ),
          const ListTile(
            leading: Icon(Icons.phone_outlined),
            title: Text(
              'Car',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: '',
          ),
          const ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text(
              'Email',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Customer’s Email Address",
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Customer’s Type',
              style: textStyle,
            ),
          ),
          CustomTextFormField(),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Delegate',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Delegate",
          ),
          const ListTile(
            leading: Icon(Icons.business_outlined),
            title: Text(
              'Organization No.',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Number",
          ),
          const ListTile(
            leading: Icon(Icons.web),
            title: Text(
              'Customer Website',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Website Address",
          ),
          const ListTile(
            leading: Icon(Icons.inventory_2_outlined),
            title: Text(
              'Invoice Address',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Address",
          ),
          CustomButton(
            text: "Submit",
          )
        ],
      ),
    );
  }
}
