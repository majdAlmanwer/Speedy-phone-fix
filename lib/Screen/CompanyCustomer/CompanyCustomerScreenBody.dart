// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            leading: Image(image: AssetImage("Icons/profile.png")),
            title: Text(
              'Customer’s Name',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: CustomersName,
            keyboardType: TextInputType.text,
          ),
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
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
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
            title: Text(
              'Car',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: Car,
            hint: '',
            keyboardType: TextInputType.number,
          ),
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
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
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
            title: Text(
              'Customer’s Type',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: CustomerType,
          ),
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
            title: Text(
              'Delegate',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: Delegate,
            hint: "Delegate",
          ),
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
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
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
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
          const ListTile(
            leading: Image(image: AssetImage("Icons/profile.png")),
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
          CustomButton(
            text: "Submit",
          )
        ],
      ),
    );
  }
}
