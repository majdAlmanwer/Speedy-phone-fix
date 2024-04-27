// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/AppStyle.dart';
import '../../Widgets/CustomTextFormFiled.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            'Order Details',
            style: TextStyle(
                fontSize: 18, color: BlueColor, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            leading: Image(
                width: 23,
                height: 23,
                image: AssetImage("Assets/Icons/edit.png")),
            title: Text(
              'Unit',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            controller: null,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
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
              'Customer’s Name',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: 'Add Customer Name',
            controller: null,
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
              'Mobile',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: '+46',
            prefixIcon: Image(
                width: 20,
                height: 20,
                image:
                    AssetImage("Assets/Icons/emojione-v1_flag-for-sweden.png")),
            controller: null,
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
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: 'Customer Email Address',
            controller: null,
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 26,
                height: 26,
                image: AssetImage(
                    "Assets/Icons/ant-design_field-number-outlined.png")),
            title: Text(
              'Quantity',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: 'Quantity',
            controller: null,
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 26,
                height: 26,
                image: AssetImage("Assets/Icons/solar_tag-price-outline.png")),
            title: Text(
              'Price',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: 'Unit Price',
            controller: null,
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            leading: Image(
                width: 23,
                height: 23,
                image: AssetImage("Assets/Icons/Icon7.png")),
            title: Text(
              'Order Delivery Date',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "The Field is Empty";
              }
            },
            hint: '11/02/2024  10:00 a.m',
            controller: null,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: BlueColor),
              child: TextButton(
                  child: Text("Save", style: TextStyle(fontSize: 18)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      print("Valid");
                    } else {
                      print("Not Valid");
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
