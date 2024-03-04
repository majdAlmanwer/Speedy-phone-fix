// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../Utils/AppStyle.dart';
import '../../Widgets/CustomTextFormFiled.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Text(
            'Order Details',
            style: TextStyle(
                fontSize: 18, color: BlueColor, fontWeight: FontWeight.bold),
          )),
          const ListTile(
            leading: Icon(Icons.edit_location_alt_outlined),
            title: Text(
              'Unit',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.edit_location_alt_outlined),
            title: Text(
              'Unit',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              'Customer Name',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: 'Add Customer Name',
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              'Mobile',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: '+49',
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text(
              'Email',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: 'Customer Email Address',
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.monetization_on_outlined),
            title: Text(
              'Quantity',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: 'Quantity',
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.local_offer_outlined),
            title: Text(
              'Price',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: 'Unit Price',
            controller: null,
          ),
          const ListTile(
            leading: Icon(Icons.date_range_outlined),
            title: Text(
              'Order Delivery Date',
              style: textStyle,
            ),
          ),
          CustomTextFormField(
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
                  child: Text("Save".toUpperCase(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
