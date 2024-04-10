import 'package:flutter/material.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/ConfirmationDialog.dart';
import '../../../Widgets/CustomTextFormFiled.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speedy_phone_fix/Controller/CaseTypeController.dart';
import 'package:speedy_phone_fix/Widgets/EditOrDeleteDialog.dart';
import '../../../Controller/NewCaseController.dart';

class CaseTypeBody extends StatefulWidget {
  const CaseTypeBody({super.key});

  @override
  State<CaseTypeBody> createState() => _CaseTypeBodyState();
}

class _CaseTypeBodyState extends State<CaseTypeBody> {
  CaseTypeController caseTypeController = Get.put(CaseTypeController());

  final NewCaseController newCaseController = Get.find();

  final box = GetStorage();

  TextEditingController caseController = TextEditingController();

  bool isEdite = false;
  String typeId = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            leading: Image(
              image: AssetImage("Assets/Icons/case-type.png"),
              width: 28,
            ),
            title: Text(
              'Case Type',
              style: TextStyle(color: TextGrey),
            ),
          ),
          CustomTextFormField(
            hint: 'Case Type',
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
                      caseTypeController
                          .newCase(
                              branchId: box.read('branchId'),
                              type: caseController.text)
                          .then((value) => newCaseController.onInit());
                      caseController.clear();
                    } else if (isEdite == true) {
                      caseTypeController
                          .editCase(typeId: typeId, type: caseController.text)
                          .then((value) => newCaseController.onInit());
                      caseController.clear();
                    }
                  },
                  child: const Text("Save",
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
            builder: (controller) => newCaseController
                    .loaderController.loading.value
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newCaseController.caseTypeList?.length,
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
                                          typeId = newCaseController
                                              .caseTypeList![index].typeId!;
                                          caseController.text =
                                              newCaseController
                                                  .caseTypeList![index].type!;
                                          Get.back();
                                        });
                                      },
                                      secundTitle: 'Delete',
                                      secundOnPressed: () {
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ConfirmationDialog(
                                                title: 'Are You Sure ?',
                                                firstOnPressed: () {
                                                  caseTypeController
                                                      .deleteCase(
                                                          typeId:
                                                              newCaseController
                                                                  .caseTypeList![
                                                                      index]
                                                                  .typeId!)
                                                      .then((value) =>
                                                          newCaseController
                                                              .onInit());

                                                  Get.back();
                                                  Get.back();
                                                },
                                                secundOnPressed: () {
                                                  Get.back();
                                                },
                                                firstTitle: 'Yes',
                                                secundTitle: 'No',
                                              );
                                            });
                                      },
                                    );
                                  },
                                );
                                print(newCaseController
                                    .caseTypeList![index].typeId);
                              },
                              child: SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        newCaseController
                                            .caseTypeList![index].type!,
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
