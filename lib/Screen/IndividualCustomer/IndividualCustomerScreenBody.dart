// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import '../../Utils/AppStyle.dart';

class IndividualCustomerScreenBody extends StatelessWidget {
  const IndividualCustomerScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(
            "Customer's Name",
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: "Add customer's name"),

        const ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text(
            "Address",
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: "Customer's Address",),

        const ListTile(
          leading: Icon(Icons.call),
          title: Text(
            "Car",
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: "+46", prefixIcon: Icon(Icons.flag), keyboardType: TextInputType.phone,),

        const ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text(
            "Email",
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: "Email Address",keyboardType: TextInputType.emailAddress,),

        const ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(
            "Customer's Type",
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 2')),
          DropdownMenuItem(value: '2', child: Text('Option 3')),
        ], onChanged: (Value){}, hint: 'Private' ),


        SizedBox(height: 30,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            Text('Term of use & privacy policy', style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold),),
          ],
        ),

        SizedBox(height: 30,),

      ]),
    );
  }
}
