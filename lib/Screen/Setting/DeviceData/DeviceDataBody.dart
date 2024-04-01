// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/DeviceDataController.dart';
import 'package:speedy_phone_fix/Controller/MakeModelController.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';
import '../../../Controller/NewCaseController.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/CustomTextFormFiled.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';
class DeviceDataBody extends StatefulWidget {
  DeviceDataBody({super.key});

  @override
  State<DeviceDataBody> createState() => _DeviceDataBodyState();
}

class _DeviceDataBodyState extends State<DeviceDataBody> {
  DeviceDataController deviceDataController = Get.put(DeviceDataController());
  MakeModelController makeModelController = Get.put(MakeModelController());
  final NewCaseController newCaseController = Get.find();
  final box = GetStorage();
  TextEditingController device_dataController = TextEditingController();
  TextEditingController make_modelController = TextEditingController();
  bool isEdite = false;
  String deviceTypeId = '';
  String makeModelId = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading: Image(
              image: AssetImage("Assets/Icons/case-status.png"),
              width: 28,
            ),
            title: Text(
              'Device Data',
              style: TextStyle(color: TextGrey),
            ),
          ),
          CustomTextFormField(
            hint: 'Device Data',
            controller: device_dataController,
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<NewCaseController>(
            builder: (controller) => CustomDropdownFormField(
              items: controller.caseMakeModelList!
                  .map((e) => DropdownMenuItem(
                  value: e.makemodelId, child: Text('${e.makemodel}')))
                  .toList(),
              onChanged: (Value) {
                controller.getCaseDeviceData(Value!);
              },
              hint: 'Motorola',
              controller: make_modelController,
            ),
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
                  if (isEdite == false) {
                    deviceDataController
                        .newDeviceData(
                        makemodelId: make_modelController.text,
                        deviceData: device_dataController.text)
                        .then((value) => newCaseController.onInit());
                    makeModelController
                        .newMakeModel(
                        branchId: box.read('branchId'),
                        makemodel: make_modelController.text)
                        .then((value) => newCaseController.onInit());
                  } else if (isEdite == true) {
                    deviceDataController
                        .editDeviceData(
                        deviceTypeId: deviceTypeId, deviceType: device_dataController.text)
                        .then((value) => newCaseController.onInit());
                    makeModelController
                        .editMakeModel(
                        makemodelId: makeModelId, makemodel: make_modelController.text)
                        .then((value) => newCaseController.onInit());
                  }
                },
                child: Text("Save"),
              ),
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

                                    makeModelId = newCaseController
                                        .caseMakeModelList![index]
                                        .makemodelId!;
                                    make_modelController.text =
                                    newCaseController
                                        .caseMakeModelList![index]
                                        .makemodel!;
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
                                  makeModelController
                                      .deleteMakeModel(
                                      makemodelId: newCaseController
                                          .caseMakeModelList![index]
                                          .makemodelId!)
                                      .then((value) =>
                                      newCaseController.onInit());
                                  Get.back();
                                },
                              );
                            },
                          );
                          print(newCaseController
                              .caseDeviceTypeList![index].deviceTypeId);
                          print(newCaseController
                              .caseMakeModelList![index].makemodelId);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      newCaseController
                                          .caseDeviceTypeList![index].deviceType!,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.red),
                                    ),
                                    Spacer(),
                                    Text(
                                      newCaseController
                                          .caseMakeModelList![index].makemodel!,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.red),
                                    ),
                                  ],
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
