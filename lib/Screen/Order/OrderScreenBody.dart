// // ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../Controller/OrderController.dart';
import '../../Utils/AppStyle.dart';
import '../../Widgets/CustomTextFormFiled.dart';
class OrderScreenBody extends StatefulWidget {
  const OrderScreenBody({super.key});

  @override
  State<OrderScreenBody> createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> {
  OrderController orderController = Get.put(OrderController());
  final OrderController newOrderController = Get.find();
  final box = GetStorage();
  TextEditingController saveOrderController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController secondUnitController = TextEditingController();
  final TextEditingController customerMobileController = TextEditingController();

  final TextEditingController customerEmailController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController orderDateController = TextEditingController();
  final TextEditingController itemController = TextEditingController();

  final TextEditingController expectedDeliveryTimeController = TextEditingController();
  bool isSave = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              'Order Details'.tr,
              style: TextStyle(
                  fontSize: 18, color: BlueColor, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/edit.png")),
              title: Text(
                'Item'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: itemController,
              validator: (val) {
                print("Validating:  with value: $val");
                if (val == null || val.isEmpty) {
                  return 'required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/edit.png")),
              title: Text(
                'Unit'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: secondUnitController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              validator: (val) {
                print("Validating:  with value: $val");
                if (val == null || val.isEmpty) {
                  return 'required'.tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),

            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/iconamoon_profile.png")),
              title: Text(
                'Customer’s Name'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "The Field is Empty".tr;
                }
              },
              hint: 'Add Customer Name'.tr,
              controller: customerNameController,
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/carbon_phone.png")),
              title: Text(
                'Mobile'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "The Field is Empty".tr;
                }
              },
              hint: '+46',
              prefixIcon: Image(
                  width: 20,
                  height: 20,
                  image:
                      AssetImage("Assets/Icons/emojione-v1_flag-for-sweden.png")),
              controller: customerMobileController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/mail.png")),
              title: Text(
                'Email'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "The Field is Empty".tr;
                }
              },
              hint: 'Customer Email Address'.tr,
              controller: customerEmailController,
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 26,
                  height: 26,
                  image: AssetImage(
                      "Assets/Icons/ant-design_field-number-outlined.png")),
              title: Text(
                'Quantity'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "The Field is Empty".tr;
                }
              },
              hint: 'Quantity'.tr,
              controller: quantityController,
              keyboardType: TextInputType.number,

            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 26,
                  height: 26,
                  image: AssetImage("Assets/Icons/solar_tag-price-outline.png")),
              title: Text(
                'Price'.tr,
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "The Field is Empty".tr;
                }
              },
              hint: 'Unit Price'.tr,
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/Icon7.png")),
              title: Text(
                'Order Delivery Date'.tr,
                style: textStyle,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child:CustomTextFormField(
                    hint: '11/02/2024',
                    controller: orderDateController,
                    validator: (val) {
                      print("Validating:  with value: $val");
                      if (val == null || val.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    },
                    onTap: () => onTapFunction(context: context),
                  ),
                ),

                Expanded(
                  child:CustomTextFormField(
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
                      if (_formKey.currentState!.validate()) {
                        print('valid');
                        if (isSave == false) {
                          Get.showOverlay(
                              asyncFunction: () async =>
                              await newOrderController.saveNewOrder(
                                  branchId: box.read('branchId'),
                                  username: box.read('username'),
                                  item: itemController.text,
                                  customer_name: customerNameController.text,
                                  customer_email: customerEmailController.text,
                                  customer_mobile: customerMobileController.text,
                                  item_quantity: quantityController.text,
                                  item_price: priceController.text,
                                  delivery_date : orderDateController.text
                              ).then((value) => newOrderController.onInit()),

                              loadingWidget: const Center(
                                  child: CircularProgressIndicator(
                                    color: BlueColor,
                                  )),
                              opacityColor: BlueColor.withOpacity(0.1));
                          saveOrderController.clear();
                        }else if (isSave == false) {
                          return null;
                        }

                      }
                    },
                    child:  Text("Save".tr,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))),

              ),
            ),
          ],
        ),
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

    orderDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
