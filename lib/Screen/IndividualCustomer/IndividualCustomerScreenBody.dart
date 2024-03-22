// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import 'package:speedy_phone_fix/Widgets/CustomButton.dart';
import '../../Utils/AppStyle.dart';

class IndividualCustomerScreenBody extends StatelessWidget {
  IndividualCustomerScreenBody({super.key});

  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController carController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/iconamoon_profile.png")),
          title: Text(
            'Customer’s Name',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Add customer's name",
          controller: customerNameController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/bx_map.png")),
          title: Text(
            'Address',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Customer's Address",
          controller: addressController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/carbon_phone.png")),
          title: Text(
            'Car',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "+46",
          prefixIcon: const Image(
              width: 20,
              height: 20,
              image:
                  AssetImage("Assets/Icons/emojione-v1_flag-for-sweden.png")),
          keyboardType: TextInputType.phone,
          controller: carController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/mail.png")),
          title: Text(
            'Email',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Email Address",
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/iconamoon_profile.png")),
          title: Text(
            'Customer’s Type',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(
          items: const [
            DropdownMenuItem(value: 'Nothing', child: Text('--')),
            DropdownMenuItem(value: '1', child: Text('Option 2')),
            DropdownMenuItem(value: '2', child: Text('Option 3')),
          ],
          onChanged: (Value) {},
          hint: 'Private',
          controller: customerTypeController,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
            const Text(
              'Term of use & privacy policy',
              style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CustomButton(
          text: "Submit",
        ),
      ]),
    );
  }
}
