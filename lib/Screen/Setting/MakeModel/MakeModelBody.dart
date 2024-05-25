import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/MakeModelController.dart';
import 'package:speedy_phone_fix/Controller/NewCaseController.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/ConfirmationDialog.dart';
import '../../../Widgets/CustomTextFormFiled.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';

class MakeModelBody extends StatefulWidget {
  MakeModelBody({super.key});

  @override
  State<MakeModelBody> createState() => _MakeModelBodyState();
}

class _MakeModelBodyState extends State<MakeModelBody> {
  MakeModelController makeModelController = Get.put(MakeModelController());

  final MakeModelController newModelController = Get.find();
  final NewCaseController newCaseController = Get.find();
  final box = GetStorage();

  TextEditingController makeController = TextEditingController();

  bool isEdite = false;
  String makemodelId = '';
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
          CustomTextFormField(
            hint: 'Make & Model'.tr,
            controller: makeController,
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
                    if (isEdite == false) {
                      newModelController
                          .newMakeModel(
                              branchId: box.read('branchId'),
                              makemodel: makeController.text)
                          .then((value) => newCaseController.onInit());
                      makeController.clear();
                    } else if (isEdite == true) {
                      newModelController
                          .editMakeModel(
                              makemodelId: makemodelId,
                              makemodel: makeController.text)
                          .then((value) => newCaseController.onInit());

                      makeController.clear();
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
                            'Make & Model'.tr,
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
                    itemCount: controller.caseMakeModelList!.length,
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
                                          makemodelId = newCaseController
                                              .caseMakeModelList![index]
                                              .makemodelId!;
                                          makeController.text =
                                              newCaseController
                                                  .caseMakeModelList![index]
                                                  .makemodel!;
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
                                                  makeModelController
                                                      .deleteMakeModel(
                                                          makemodelId:
                                                              newCaseController
                                                                  .caseMakeModelList![
                                                                      index]
                                                                  .makemodelId!)
                                                      .then((value) =>
                                                          controller.onInit());
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
                                print(newCaseController
                                    .caseMakeModelList![index].makemodelId);
                              },
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        newCaseController
                                            .caseMakeModelList![index]
                                            .makemodel!,
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
