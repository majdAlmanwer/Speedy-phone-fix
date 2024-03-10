// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:speedy_phone_fix/Controller/NewCaseController.dart';

import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import 'package:speedy_phone_fix/Widgets/CustomButton.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';

import 'package:speedy_phone_fix/Routes/Routes.dart';
import '../../Utils/AppStyle.dart';
import 'package:intl/intl.dart';
class NewCaseScreenBody extends StatefulWidget {
  NewCaseScreenBody({super.key});

  @override
  State<NewCaseScreenBody> createState() => _NewCaseScreenBodyState();
}

class _NewCaseScreenBodyState extends State<NewCaseScreenBody> {

  TextEditingController _textEditingController = TextEditingController();
  NewCaseController newCaseController = Get.find();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchCustomerController =
      TextEditingController();
  final TextEditingController caseStatusController = TextEditingController();
  final TextEditingController caseType1Controller = TextEditingController();
  final TextEditingController caseType2Controller = TextEditingController();
  final TextEditingController caseType3Controller = TextEditingController();
  final TextEditingController makeModelController = TextEditingController();
  final TextEditingController deviceDataController = TextEditingController();
  final TextEditingController imeiController = TextEditingController();
  final TextEditingController problemDescriptionController =
      TextEditingController();
  final TextEditingController expectedDeliveryDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const ListTile(
          leading: Icon(Icons.search),
          title: Text(
            'Search',
            style: textStyle,
          ),
        ),

        CustomTextFormField(
          hint: 'Search customer by mobile',
          controller: searchController,
        ),

        //start ayah code
        const ListTile(
          leading: Icon(Icons.person_2_outlined),
          title: Text(
            'Customer',
            style: textStyle,
          ),
        ),

        CustomDropdownFormField(
          items: newCaseController.customersList!
              .map((e) => DropdownMenuItem(
              value: e.cusId, child: Text('${e.cusName}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'Choose customer',
          controller: searchCustomerController,
        ),

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
              .toList(),
          onChanged: (Value) {},
          hint: 'Submitted for repair',
          controller: caseStatusController,
        ),

        Row(
          children: [
            Expanded(
              child: const ListTile(
                leading: Icon(Icons.edit_location_alt_outlined),
                title: Text(
                  'Case Type',
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.makemodelscreen);
              },
              minWidth: 15,
              height: 0,
               padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text('Add',
              style: TextStyle(
                color: BlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),),
            )
          ],
        ),
        CustomDropdownFormField(
          items: newCaseController.caseTypeList!
              .map((e) => DropdownMenuItem(
              value: e.typeId, child: Text('${e.type}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'Not Specified',
          controller: caseType1Controller,
        ),

        SizedBox(
          height: 8,
        ),

        CustomDropdownFormField(
          items: newCaseController.caseTypeList!
              .map((e) => DropdownMenuItem(
              value: e.typeId, child: Text('${e.type}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'Not Specified',
          controller: caseType2Controller,
        ),

        SizedBox(
          height: 8,
        ),

        CustomDropdownFormField(
          items: newCaseController.caseTypeList!
              .map((e) => DropdownMenuItem(
              value: e.typeId, child: Text('${e.type}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'Not Specified',
          controller: caseType3Controller,
        ),
        Row(
          children: [
            Expanded(
              child: const ListTile(
                leading: Icon(Icons.mobile_friendly_outlined),
                title: Text(
                  'Make & Model',
                  style: textStyle,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.makemodelscreen);
              },
              minWidth: 15,
              height: 0,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text('Add',
                style: TextStyle(
                    color: BlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
            )
          ],
        ),

        CustomDropdownFormField(
          items: newCaseController.caseMakeModelList!
              .map((e) => DropdownMenuItem(
              value: e.makemodelId, child: Text('${e.makemodel}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'Motorola',
          controller: makeModelController,
        ),
        Row(
          children: [
            Expanded(
              child: const ListTile(
                leading: Icon(Icons.mobile_friendly_outlined),
                title: Text(
                  'Device Data',
                  style: textStyle,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.devicedatascreen);
              },
              minWidth: 15,
              height: 0,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text('Add',
                style: TextStyle(
                    color: BlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
            )
          ],
        ),
        CustomDropdownFormField(
          items: newCaseController.caseDeviceTypeList!
              .map((e) => DropdownMenuItem(
              value: e.deviceTypeId, child: Text('${e.deviceType}')))
              .toList(),
          onChanged: (Value) {},
          hint: 'g5',
          controller: deviceDataController,
        ),
        const ListTile(
          leading: Icon(Icons.data_object_sharp),
          title: Text(
            'IMEI',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: 'IMEI',
          controller: imeiController,
        ),
        const ListTile(
          leading: Icon(Icons.edit_location_alt_outlined),
          title: Text(
            'Problem Description',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: 'Write here...',
          controller: problemDescriptionController,
        ),
        const ListTile(
          leading: Icon(Icons.date_range_outlined),
          title: Text(
            'Expected Delivery Date',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: '11/02/2024  10:00 a.m',
          controller: datePickerController,
          onTap: () => onTapFunction(context: context),
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
          text: "Submit",
        ),
      ]),
    );
  }
  TextEditingController datePickerController = TextEditingController();
  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
