import 'package:flutter/material.dart';
import '../../../Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
final TextEditingController deviceDataController = TextEditingController();
class DeviceDataBody extends StatelessWidget {
  const DeviceDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const ListTile(
            leading: Icon(Icons.phone_android_outlined,
              color: TextGrey,),
            title: Text(
              'Device Data',
              style: TextStyle(
                color: TextGrey,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          CustomDropdownFormField(
            items: const [
              DropdownMenuItem(value: 'Nothing', child: Text('--')),
              DropdownMenuItem(value: '1', child: Text('Samsung')),
              DropdownMenuItem(value: '2', child: Text('Nokia')),
            ],
            onChanged: (Value) {},
            hint: 'Samsung',
            controller: deviceDataController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdownFormField(
            items: const [
              DropdownMenuItem(value: 'Nothing', child: Text('--')),
              DropdownMenuItem(value: '1', child: Text('A70')),
              DropdownMenuItem(value: '2', child: Text('A54')),
            ],
            onChanged: (Value) {},
            hint: 'A70',
            controller: deviceDataController,
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
                  child: const Text("Save",
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
                    children: const [
                      TableRow(children: [
                        SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '.No',
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
                                  'Device Data',
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
                                child: Text('Flutter',
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
                                child: Text('Dart',
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
                                child: Text('Flutter Packages',
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
