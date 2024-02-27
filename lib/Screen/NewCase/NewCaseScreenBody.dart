// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Controller/NewCaseController.dart';

import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import '../../Utils/AppStyle.dart';

class NewCaseScreenBody extends StatefulWidget {
  NewCaseScreenBody({super.key});

  @override
  State<NewCaseScreenBody> createState() => _NewCaseScreenBodyState();
}

class _NewCaseScreenBodyState extends State<NewCaseScreenBody> {
  NewCaseController newCaseController = Get.find();

  @override
  Widget build(BuildContext context) {

  

    return SingleChildScrollView(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.search),
          title: Text(
            'title',
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: 'Search customer by mobile'),
      

        //start ayah code
        const ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(
            'Customer',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 2')),
          DropdownMenuItem(value: '2', child: Text('Option 3')),



        ], onChanged: (Value){}, hint: 'Choose customer' ),
      

        const ListTile(
          leading: Icon(Icons.edit_location_alt_outlined),
          title: Text(
            'Case Status',
            style: textStyle,
          ),
        ),

        CustomDropdownFormField(
            items: newCaseController.caseStatusList
                .map((e) => DropdownMenuItem(
                    value: e.statusId, child: Text('${e.status}')))
                .toList()
            // [
            //   DropdownMenuItem(value: 'Nothing', child: Text('--')),
            //   DropdownMenuItem(value: '1', child: Text('Option 1')),
            //   DropdownMenuItem(value: '2', child: Text('Option 2')),
            // ]
            ,
            onChanged: (Value) {},
            hint: 'Submitted for repair'),


        const ListTile(
          leading: Icon(Icons.edit_location_alt_outlined),
          title: Text(
            'Case Type',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'Not Specified' ),
        SizedBox( height: 8,),

        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'Not Specified' ),
        SizedBox( height: 8,),

        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'Not Specified' ),
      

        const ListTile(
          leading: Icon(Icons.mobile_friendly_outlined),
          title: Text(
            'Make & Model',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'Motorola' ),


        const ListTile(
          leading: Icon(Icons.mobile_friendly_outlined),
          title: Text(
            'Device Data',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'g5' ),


        const ListTile(
          leading: Icon(Icons.data_object_sharp),
          title: Text(
            'IMEI',
            style: textStyle,
          ),
        ),
        CustomDropdownFormField(items: [
          DropdownMenuItem(value: 'Nothing', child: Text('--')),
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),

        ], onChanged: (Value){}, hint: 'g5' ),


        const ListTile(
          leading: Icon(Icons.edit_location_alt_outlined),
          title: Text(
            'Problem Description',
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: 'Write here...'),

        const ListTile(
          leading: Icon(Icons.date_range_outlined),
          title: Text(
            'Expected Delivery Date',
            style: textStyle,
          ),
        ),
        CustomTextFormField(hint: '11/02/2024  10:00 a.m'),

        SizedBox(height: 20,)

      ]),
    );
  }
}
