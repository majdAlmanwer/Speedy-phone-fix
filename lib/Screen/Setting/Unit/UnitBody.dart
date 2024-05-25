import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/CustomTextFormFiled.dart';

class UnitBody extends StatelessWidget {
  const UnitBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           ListTile(
            leading: Icon(Icons.my_library_books_sharp,
              color: TextGrey,),
            title: Text(
              'Unit'.tr,
              style: TextStyle(
                  color: TextGrey,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          CustomTextFormField(
            hint: 'Unit'.tr,
            controller: null,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: BlueColor),
              child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                  onPressed: () {},
                  child:  Text("Save".tr,
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(

                child: Expanded(
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(4),
                    },
                    border: TableBorder.all(
                        color: BorderGrey, style: BorderStyle.solid, width: 1),
                    children:  [
                      TableRow(children: [
                        SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '.No'.tr,
                                  style: TextStyle(fontSize: 20.0,
                                      color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Unit'.tr,
                                  style: TextStyle(fontSize: 20.0,
                                      color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('1',
                                  style: TextStyle(
                                      color: TextGrey
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Flutter'.tr,
                                  style: TextStyle(
                                      color: TextGrey
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('2',
                                  style: TextStyle(
                                      color: TextGrey
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Dart'.tr,
                                  style: TextStyle(
                                      color: TextGrey
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('3',
                                  style: TextStyle(
                                      color: TextGrey
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Flutter Packages'.tr,
                                  style: TextStyle(
                                      color: TextGrey
                                  ),),
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
