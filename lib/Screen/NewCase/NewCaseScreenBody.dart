// // // ignore_for_file: file_names
// //
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:speedy_phone_fix/Controller/SaveCaseController.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../../Controller/CustomerPrivateController.dart';
import '../../Controller/LoaderController.dart';
import '../../Controller/NewCaseController.dart';
import '../../Routes/Routes.dart';
import '../../Widgets/CustomAlertDialog.dart';
import '../../Widgets/CustomDropdownListFormField.dart';
import '../../Widgets/CustomSearchDropDown.dart';
class MyCheckboxController {
  bool isChecked = false;
}
class NewCaseScreenBody extends StatefulWidget {
  NewCaseScreenBody({super.key});

  @override
  State<NewCaseScreenBody> createState() => _NewCaseScreenBodyState();
}
class _NewCaseScreenBodyState extends State<NewCaseScreenBody> {

  @override
  void initState() {
    super.initState();
  }
  SaveCaseController saveCaseController = Get.put(SaveCaseController());
  final SaveCaseController newCaseController = Get.find();
  final box = GetStorage();
  TextEditingController addCaseController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  final TextEditingController gdprController  = TextEditingController();
  final TextEditingController caseStatusController = TextEditingController();
  final TextEditingController caseType1Controller = TextEditingController();
  final TextEditingController caseType2Controller = TextEditingController();
  final TextEditingController caseType3Controller = TextEditingController();
  final TextEditingController makeModelController = TextEditingController();
  final TextEditingController deviceDataController = TextEditingController();
  final TextEditingController imeiController = TextEditingController();
  final TextEditingController devicePasswordController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController privateNoteController = TextEditingController();

  final TextEditingController searchCustomerController =
      TextEditingController();
  final TextEditingController problemDescriptionController =
      TextEditingController();
  final TextEditingController expectedDeliveryDateController =
      TextEditingController();
  final TextEditingController expectedDeliveryTimeController =
      TextEditingController();
  RxString searchCustomer = ''.obs;
  final loaderController = Get.put(LoaderController());
  DateTime dateTime = DateTime(2022, 2, 2, 5, 4);
  bool isSave = false;

  bool isEdite = false;
  @override
  Widget build(BuildContext context) {
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return GetBuilder<NewCaseController>(
      builder: (controller) => loaderController.loading.value
          ? Center(
              child: CircularProgressIndicator(color: BlueColor),
            )
          : SingleChildScrollView(
              child: Column(children: [
                const ListTile(
                  leading: Icon(Icons.search),
                  title: Text(
                    'Search',
                    style: textStyle,
                  ),
                ),
                CustomSearchDropDown(
                  searchResult: searchCustomer,
                ),
                //start ayah code
                Row(
                  children: [
                    const Expanded(
                      child: ListTile(
                        leading: Icon(Icons.person_2_outlined),
                        title: Text(
                          'Customer',
                          style: textStyle,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog();
                          },
                        );
                      },
                      minWidth: 15,
                      height: 0,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: BlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                // Obx(
                //   () =>
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                    left: 15.0,
                  ),
                  child: controller.allCustomersList!.isEmpty
                      ? CircularProgressIndicator(color: BlueColor)
                      : CustomDropdown.search(
                          decoration: CustomDropdownDecoration(
                              closedFillColor: FormBackGraund.withOpacity(.5),
                              closedBorderRadius: BorderRadius.circular(10.0),
                              closedBorder: Border.all(color: BorderGrey)),
                          hintText: 'Choose customer',
                          initialItem: searchCustomer.value,
                          items:
                              // controller.allCustomersList!.isNotEmpty
                              //     ?
                              controller.allCustomersList!
                                  .map((e) => e.cusName)
                                  .toList(),
                          // : List.generate(1, (index) => Text('...')),
                          excludeSelected: false,
                          onChanged: (value) {
                            // setState(() {
                            searchCustomer.value = value.toString();
                            // });

                            print('changing value to: ${searchCustomer.value}');
                          },
                        ),
                ),
                // ),

                const ListTile(
                  leading: Icon(Icons.edit_location_alt_outlined),
                  title: Text(
                    'Case Status',
                    style: textStyle,
                  ),
                ),

                CustomDropdownFormField(
                  items: controller.caseStatusList
                      .map((e) => DropdownMenuItem(
                          value: e.statusId, child: Text('${e.status}')))
                      .toList(),
                  onChanged: (Value) {
                    print(Value);
                  },
                  hint: 'Submitted for repair',
                  controller: caseStatusController,
                ),

                Row(
                  children: [
                    const Expanded(
                      child: ListTile(
                        leading: Icon(Icons.edit_location_alt_outlined),
                        title: Text(
                          'Case Type',
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.makemodelscreen);
                      },
                      minWidth: 15,
                      height: 0,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: BlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                CustomDropdownFormField(
                  items: controller.caseTypeList!
                      .map((e) => DropdownMenuItem(
                          value: e.typeId, child: Text('${e.type}')))
                      .toList(),
                  onChanged: (Value) {},
                  hint: 'Not Specified',
                  controller: caseType1Controller,
                ),

                const SizedBox(
                  height: 8,
                ),

                CustomDropdownFormField(
                  items: controller.caseTypeList!
                      .map((e) => DropdownMenuItem(
                          value: e.typeId, child: Text('${e.type}')))
                      .toList(),
                  onChanged: (Value) {},
                  hint: 'Not Specified',
                  controller: caseType2Controller,
                ),

                const SizedBox(
                  height: 8,
                ),

                CustomDropdownFormField(
                  items: controller.caseTypeList!
                      .map((e) => DropdownMenuItem(
                          value: e.typeId, child: Text('${e.type}')))
                      .toList(),
                  onChanged: (Value) {},
                  hint: 'Not Specified',
                  controller: caseType3Controller,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: ListTile(
                        leading: Icon(Icons.mobile_friendly_outlined),
                        title: Text(
                          'Make & Model',
                          style: textStyle,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.makemodelscreen);
                      },
                      minWidth: 15,
                      height: 0,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: BlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),

                CustomDropdownFormField(
                  items: controller.caseMakeModelList!
                      .map((e) => DropdownMenuItem(
                          value: e.makemodelId, child: Text('${e.makemodel}')))
                      .toList(),
                  onChanged: (Value) {
                    controller.getCaseDeviceData(Value!);
                  },
                  hint: 'Motorola',
                  controller: makeModelController,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: ListTile(
                        leading: Icon(Icons.mobile_friendly_outlined),
                        title: Text(
                          'Device Data',
                          style: textStyle,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.devicedatascreen);
                      },
                      minWidth: 15,
                      height: 0,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: BlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
                GetBuilder<NewCaseController>(
                  builder: (controller) => CustomDropdownFormField(
                    items: controller.caseDeviceTypeList!
                        .map((e) => DropdownMenuItem(
                            value: e.deviceTypeId,
                            child: Text('${e.deviceType}')))
                        .toList(),
                    onChanged: (Value) {},
                    hint: 'g5',
                    controller: deviceDataController,
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.password),
                  title: Text(
                    'Device Password',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Device Password',
                  controller: devicePasswordController,
                ),

                const ListTile(
                  leading: Icon(Icons.data_object_sharp),
                  title: Text(
                    'IMEI',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'IMEI',
                  controller: imeiController,
                ),
                const ListTile(
                  leading: Icon(Icons.edit_location_alt_outlined),
                  title: Text(
                    'Problem Description',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Write here...',
                  controller: problemDescriptionController,
                ),
                const ListTile(
                  leading: Icon(Icons.price_change_outlined),
                  title: Text(
                    'Price',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Price',
                  controller: priceController,
                  keyboardType: TextInputType.number,
                ),
                const ListTile(
                  leading: Icon(Icons.discount),
                  title: Text(
                    'Discount',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Discount',
                  controller: discountController,
                  keyboardType: TextInputType.number,
                ),
                const ListTile(
                  leading: Icon(Icons.date_range_outlined),
                  title: Text(
                    'Expected Delivery Date & Time',
                    style: textStyle,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hint: '11/02/2024',
                        controller: expectedDeliveryDateController,
                        onTap: () => onTapFunction(context: context),
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        hint: '5:30',
                        controller: expectedDeliveryTimeController,
                        onTap: () async {
                          var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            setState(() {
                              // Extract hours and minutes from TimeOfDay object
                              int hours = time.hour;
                              int minutes = time.minute;

                              // Format time in 24-hour format
                              String formattedTime = DateFormat('HH:mm').format(DateTime(2024, 1, 1, hours, minutes));
                              expectedDeliveryTimeController.text = formattedTime;
                            });
                          }
                        },
                      ),
                    ),
                  ],

                ),
                const ListTile(
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    'Note',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Note',
                  controller: noteController,
                ),
                const ListTile(
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    'Private Note',
                    style: textStyle,
                  ),
                ),
                CustomTextFormField(
                  hint: 'Private Note',
                  controller: privateNoteController,
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
                            newCaseController
                                .newCase(
                              branchId: box.read('branchId'),
                              username: box.read('username'),
                              cus_name: searchCustomer.value,
                              cas_status : caseStatusController.text,
                              cas_Repair_type1: caseType1Controller.text,
                              cas_Repair_type2: caseType2Controller.text,
                              cas_Repair_type3: caseType3Controller.text,
                              cas_make_model : makeModelController.text,
                              cas_device_data: deviceDataController.text,
                              cas_device_password: devicePasswordController.text,
                              cas_device_IMEI : imeiController.text,
                              cas_problem_description : problemDescriptionController.text,
                              cas_estimated_price : priceController.text,
                              cas_discount : discountController.text,
                              cas_estimated_delivery_date: expectedDeliveryDateController.text,
                              cas_estimated_delivery_time : expectedDeliveryTimeController.text,
                              cas_note:noteController.text,
                              cas_private_note:privateNoteController.text,
                            )
                                .then((value) => newCaseController.onInit());
                            addCaseController.clear();
                          } else if (isEdite == false) {
                            return null;
                          }
                        },
                        child: const Text("Save",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                  ),
                ),
              ]),
            ),

    );
  }

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),

    );
    if (pickedDate == null) return;
    expectedDeliveryDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}

