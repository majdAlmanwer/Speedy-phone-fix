// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../../Utils/AppStyle.dart';
import '../../Widgets/CustomTextFormFiled.dart';

class MakeModelScreenBody extends StatelessWidget {
  const MakeModelScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(
              'Make & Model',
              style: textStyle,
            ),
          ),

          CustomTextFormField(
            hint: 'Make & Model',
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
          DataTable(
              columns: [
                DataColumn(
                  label: Text('ID'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Code'),
                ),
                DataColumn(
                  label: Text('Quantity'),
                ),
                DataColumn(
                  label: Text('Amount'),
                ),
              ],
              rows: [

                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Arshik')),
                  DataCell(Text('5644645')),
                  DataCell(Text('3')),
                  DataCell(Text('265\$')),
                ])
              ])
        ],
      ),
    );
  }
}
