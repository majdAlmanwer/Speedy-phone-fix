import 'package:flutter/material.dart';
import '../../../Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Controller/DeviceDataController.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';
import '../../../Controller/NewCaseController.dart';
class DeviceDataBody extends StatefulWidget {
  DeviceDataBody({super.key});

  @override
  State<DeviceDataBody> createState() => _DeviceDataBodyState();
}
class _DeviceDataBodyState extends State<DeviceDataBody> {
  DeviceDataController deviceDataController = Get.put(DeviceDataController());
  final box = GetStorage();
  final NewCaseController newCaseController = Get.find();
  final TextEditingController device_dataController = TextEditingController();

  bool isEdite = false;
  String deviceTypeId = '';
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
            controller: device_dataController,
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
            controller: device_dataController,
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
                  onPressed: () {
                    print(isEdite);
                    print(device_dataController.text);
                    print(box.read('branchId'));
                    if (isEdite == false) {
                      deviceDataController
                          .newDeviceData(
                          branchId: box.read('branchId'),
                          deviceData: device_dataController.text)
                          .then((value) => newCaseController.onInit());
                    } else if (isEdite == true) {
                      deviceDataController
                          .editDeviceData(
                          deviceTypeId: deviceTypeId, deviceType: device_dataController.text)
                          .then((value) => newCaseController.onInit());
                    }
                  },
                  child: const Text("Save",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(5),
              },
              border: TableBorder.all(
                  color: BorderGrey, style: BorderStyle.solid, width: 2),
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
                            style: TextStyle(fontSize: 20.0, color: TextGrey),
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
                            style: TextStyle(fontSize: 20.0, color: TextGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ]),
          GetBuilder<NewCaseController>(
            builder: (controller) =>
            newCaseController.loaderController.loading.value
                ? CircularProgressIndicator()
                : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newCaseController.caseDeviceTypeList!.length,
              itemBuilder: (context, index) {
                return Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(5),
                  },
                  border: TableBorder.all(
                      color: BorderGrey,
                      style: BorderStyle.solid,
                      width: 1),
                  children: [
                    TableRow(children: [
                      SizedBox(
                        height: 50,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    fontSize: 20.0, color: TextGrey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onLongPress: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (BuildContext context) {
                              return EditOrDeleteDialog(
                                firstTitle: 'Edit',
                                firstOnPressed: () {
                                  setState(() {
                                    isEdite = true;
                                    deviceTypeId = newCaseController
                                        .caseDeviceTypeList![index]
                                        .deviceTypeId!;
                                    device_dataController.text =
                                    newCaseController
                                        .caseDeviceTypeList![index]
                                        .deviceType!;
                                    Get.back();
                                  });
                                },
                                secundTitle: 'Delete',
                                secundOnPressed: () {
                                  deviceDataController
                                      .deleteDeviceData(
                                      deviceTypeId: newCaseController
                                          .caseDeviceTypeList![index]
                                          .deviceTypeId!)
                                      .then((value) =>
                                      newCaseController.onInit());
                                  Get.back();
                                },
                              );
                            },
                          );
                          print(newCaseController
                              .caseDeviceTypeList![index].deviceTypeId);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  newCaseController
                                      .caseDeviceTypeList![index].deviceType!,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: TextGrey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
