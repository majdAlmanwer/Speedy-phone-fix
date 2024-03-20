import 'package:flutter/material.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/CustomTextFormFiled.dart';

class CaseTypeBody extends StatelessWidget {
  const CaseTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading: Image(image: AssetImage("Assets/Icons/case-type.png"), width: 28,),
            title: Text(
              'Case Type',
              style: TextStyle(color: TextGrey),
            ),
          ),
          CustomTextFormField(
            hint: 'Case Type',
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
                  child: Text("Save",
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
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                child: Expanded(
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(4),
                    },
                    border: TableBorder.all(
                        color: BorderGrey, style: BorderStyle.solid, width: 1),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '.No',
                                  style: TextStyle(
                                      fontSize: 20.0, color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Model',
                                  style: TextStyle(
                                      fontSize: 20.0, color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '1',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Flutter',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '2',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Dart',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '3',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Flutter Packages',
                                  style: TextStyle(color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}