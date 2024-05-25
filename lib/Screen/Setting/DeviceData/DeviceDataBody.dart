// // ignore_for_file: sort_child_properties_last, must_be_immutable
// ignore_for_file: sort_child_properties_last, must_be_immutable
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/DeviceDataController.dart';

import 'package:speedy_phone_fix/Controller/NewCaseController.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/ConfirmationDialog.dart';
import '../../../Widgets/CustomTextFormFiled.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';
import 'package:speedy_phone_fix/Widgets/CustomDropdownListFormField.dart';

class DeviceDataBody extends StatefulWidget {
  DeviceDataBody({super.key});

  @override
  State<DeviceDataBody> createState() => _DeviceDataBodyState();
}

class _DeviceDataBodyState extends State<DeviceDataBody> {
  DeviceDataController deviceDataController = Get.put(DeviceDataController());

  final NewCaseController newCaseController = Get.find();
  final box = GetStorage();

  TextEditingController makeController = TextEditingController();
  TextEditingController deviceController = TextEditingController();
  bool isEdite = false;
  String makemodelId = '';
  String deviceTypeId = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           ListTile(
            leading: Icon(
              Icons.phone_android,
              color: TextGrey,
            ),
            title: Text(
              'Make & Model'.tr,
              style: TextStyle(color: TextGrey),
            ),
          ),
          GetBuilder<NewCaseController>(
            builder: (controller) => CustomDropdownFormField(
              items: controller.caseMakeModelList!
                  .map((e) => DropdownMenuItem(
                      value: e.makemodelId, child: Text('${e.makemodel}')))
                  .toList(),
              onChanged: (Value) {
                print(Value);

                makemodelId = Value!;

                controller.getCaseDeviceData(Value!);
              },
              hint: 'Motorola'.tr,
              controller: makeController,
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
           ListTile(
            leading: Icon(
              Icons.phone_android,
              color: TextGrey,
            ),
            title: Text(
              'Device Data'.tr,
              style: TextStyle(color: TextGrey),
            ),
          ),
          CustomTextFormField(
            hint: 'Device Data'.tr,
            controller: deviceController,
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
                              makemodelId: makemodelId,
                              deviceData: deviceController.text)
                          .then((value) =>
                              newCaseController.getCaseDeviceData(makemodelId));
                      deviceController.clear();
                    } else if (isEdite == true) {
                      deviceDataController
                          .editDeviceData(
                              deviceTypeId: deviceTypeId,
                              deviceType: deviceController.text)
                          .then((value) =>
                              newCaseController.getCaseDeviceData(makemodelId));
                      deviceController.clear();
                    }
                  },
                  child:  Text("Save".tr,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold))),
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
                            'Device Data'.tr,
                            style: TextStyle(fontSize: 20.0, color: TextGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ]),
          GetBuilder<NewCaseController>(
            builder: (controller) => newCaseController
                    .loaderController.loading.value
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.caseDeviceTypeList!.isNotEmpty
                        ? controller.caseDeviceTypeList!.length
                        : 0,
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
                                      firstTitle: 'Edit'.tr,
                                      firstOnPressed: () {
                                        setState(() {
                                          isEdite = true;
                                          controller.caseDeviceTypeList!
                                                  .isNotEmpty
                                              ? deviceTypeId = newCaseController
                                                  .caseDeviceTypeList![index]
                                                  .deviceTypeId!
                                              : '';
                                          controller.caseDeviceTypeList!
                                                  .isNotEmpty
                                              ? deviceController.text =
                                                  newCaseController
                                                      .caseDeviceTypeList![
                                                          index]
                                                      .deviceType!
                                              : '';
                                          Get.back();
                                        });
                                      },
                                      secundTitle: 'Delete'.tr,
                                      secundOnPressed: () {
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ConfirmationDialog(
                                                title: 'Are You Sure ?'.tr,
                                                firstOnPressed: () {
                                                  controller.caseDeviceTypeList!
                                                          .isNotEmpty
                                                      ? deviceDataController
                                                          .deleteDeviceData(
                                                              deviceTypeId:
                                                                  newCaseController
                                                                      .caseDeviceTypeList![
                                                                          index]
                                                                      .deviceTypeId!)
                                                          .then((value) => controller
                                                              .getCaseDeviceData(
                                                                  makemodelId))
                                                      : null;
                                                  Get.back();
                                                  Get.back();
                                                },
                                                secundOnPressed: () {
                                                  Get.back();
                                                },
                                                firstTitle: 'Yes'.tr,
                                                secundTitle: 'No'.tr,
                                              );
                                            });
                                      },
                                    );
                                  },
                                );
                                // print(newCaseController
                                //     .caseDeviceTypeList![index].deviceTypeId);
                              },
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        newCaseController
                                                .caseDeviceTypeList!.isNotEmpty
                                            ? newCaseController
                                                    .caseDeviceTypeList![index]
                                                    .deviceType ??
                                                'empty'.tr
                                            : '',
                                        style: const TextStyle(
                                            fontSize: 20.0, color: TextGrey),
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
