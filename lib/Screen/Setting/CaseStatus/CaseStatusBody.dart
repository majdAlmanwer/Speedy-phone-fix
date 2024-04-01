// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/CaseStatusController.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';
import '../../../Controller/NewCaseController.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/CustomTextFormFiled.dart';

class CaseStatusBody extends StatefulWidget {
  CaseStatusBody({super.key});

  @override
  State<CaseStatusBody> createState() => _CaseStatusBodyState();
}

class _CaseStatusBodyState extends State<CaseStatusBody> {
  CaseStatusController caseStatusController = Get.put(CaseStatusController());

  final NewCaseController newCaseController = Get.find();

  final box = GetStorage();

  TextEditingController caseController = TextEditingController();

  bool isEdite = false;
  String statusId = '';

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
              'Case Status',
              style: TextStyle(color: TextGrey),
            ),
          ),
          CustomTextFormField(
            hint: 'Case status',
            controller: caseController,
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
                  print(caseController.text);
                  print(box.read('branchId'));
                  if (isEdite == false) {
                    caseStatusController
                        .newCase(
                            branchId: box.read('branchId'),
                            status: caseController.text)
                        .then((value) => newCaseController.onInit());
                    caseController.clear();
                  } else if (isEdite == true) {
                    caseStatusController
                        .editCase(
                            statusId: statusId, status: caseController.text)
                        .then((value) => newCaseController.onInit());
                    caseController.clear();
                  }
                },
                child: const Text("Save",
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
                            'Case',
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
                        itemCount: newCaseController.caseStatusList.length,
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
                                              statusId = newCaseController
                                                  .caseStatusList[index]
                                                  .statusId!;
                                              caseController.text =
                                                  newCaseController
                                                      .caseStatusList[index]
                                                      .status!;
                                              Get.back();
                                            });
                                          },
                                          secundTitle: 'Delete',
                                          secundOnPressed: () {
                                            caseStatusController
                                                .deleteCase(
                                                    statusId: newCaseController
                                                        .caseStatusList[index]
                                                        .statusId!)
                                                .then((value) =>
                                                    newCaseController.onInit());
                                            Get.back();
                                          },
                                        );
                                      },
                                    );
                                    print(newCaseController
                                        .caseStatusList[index].statusId);
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            newCaseController
                                                .caseStatusList[index].status!,
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
