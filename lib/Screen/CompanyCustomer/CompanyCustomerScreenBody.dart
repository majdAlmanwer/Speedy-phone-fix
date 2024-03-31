// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Widgets/CustomButton.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';

class CompanyCustomerScreenBody extends StatefulWidget {
  const CompanyCustomerScreenBody({super.key});

  @override
  State<CompanyCustomerScreenBody> createState() =>
      _CompanyCustomerScreenBodyState();
}

class _CompanyCustomerScreenBodyState extends State<CompanyCustomerScreenBody> {
  TextEditingController? CustomersName = TextEditingController();

  TextEditingController? CustomerAddress = TextEditingController();

  TextEditingController? Car = TextEditingController();

  TextEditingController? CustomerEmailAddress = TextEditingController();

  TextEditingController? CustomerType = TextEditingController();

  TextEditingController? Delegate = TextEditingController();

  TextEditingController? OrganizationNo = TextEditingController();

  TextEditingController? WebsiteAddress = TextEditingController();

  TextEditingController? InvoiceAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
            hint: "Add customer’s name",
            controller: CustomersName,
            keyboardType: TextInputType.text,
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
            hint: "Customer’s Address",
            controller: CustomerAddress,
            keyboardType: TextInputType.phone,
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
            controller: Car,
            hint: "+46",
            prefixIcon: const Image(
                width: 20,
                height: 20,
                image:
                    AssetImage("Assets/Icons/emojione-v1_flag-for-sweden.png")),
            keyboardType: TextInputType.number,
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
            controller: CustomerEmailAddress,
            hint: "Customer’s Email Address",
            keyboardType: TextInputType.emailAddress,
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
          CustomTextFormField(
            hint: "Private",
            controller: CustomerType,
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
              'Delegate',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: Delegate,
            hint: "Delegate",
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 23,
                height: 23,
                image: AssetImage("Assets/Icons/build.png")),
            title: Text(
              'Organization No.',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: OrganizationNo,
            hint: "Number",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 23,
                height: 23,
                image: AssetImage("Assets/Icons/web.png")),
            title: Text(
              'Customer Website',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: WebsiteAddress,
            hint: "Website Address",
            keyboardType: TextInputType.url,
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 23,
                height: 23,
                image: AssetImage("Assets/Icons/save.png")),
            title: Text(
              'Invoice Address',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: InvoiceAddress,
            hint: "Address",
            keyboardType: TextInputType.phone,
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
        ],
      ),
    );
  }
}
