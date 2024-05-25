import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../../../Utils/AppStyle.dart';
import '../../../Widgets/CustomTextFormFiled.dart';
import '../../Controller/CustomerPrivateController.dart';

class MyCheckboxController {
  bool isChecked = false;
}

class IndividualCustomerScreenBody extends StatefulWidget {
  IndividualCustomerScreenBody({super.key});

  @override
  State<IndividualCustomerScreenBody> createState() =>
      _IndividualCustomerState();
}

class _IndividualCustomerState extends State<IndividualCustomerScreenBody> {
  late MyCheckboxController _checkboxController;

  @override
  void initState() {
    super.initState();
    _checkboxController = MyCheckboxController();
  }

  CustomerPrivateController customerPrivateController =
      Get.put(CustomerPrivateController());
  final CustomerPrivateController newCustomerPrivateController = Get.find();
  final box = GetStorage();
  TextEditingController CustomPrivateController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  final TextEditingController gdprController = TextEditingController();

  bool value = true;
  bool isEdite = false;
  bool enabled = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(children: [
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
            hint: "Add customer's name".tr,
            controller: customerNameController,
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
                image: AssetImage("Assets/Icons/bx_map.png")),
            title: Text(
              'Address'.tr,
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Customer’s Address".tr,
            controller: addressController,
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
              'Car'.tr,
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "+46",
            prefixIcon: const Image(
                width: 20,
                height: 20,
                image:
                    AssetImage("Assets/Icons/emojione-v1_flag-for-sweden.png")),
            keyboardType: TextInputType.phone,
            controller: mobileController,
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
            hint: "Email Address".tr,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
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
              'Customer’s Type'.tr,
              style: textStyle,
            ),
          ),
          CustomTextFormField(
            hint: "Private".tr,
            controller: customerTypeController,
            enabled: false,
          ),
          const SizedBox(
            height: 20,
          ),
           ListTile(
            title: Text(
              'GDPR'.tr,
              style: textStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _checkboxController.isChecked,
                onChanged: (value) {
                  setState(() {
                    _checkboxController.isChecked = value!;
                  });
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                // Wrap the Text with Flexible
                child: Text(
                  'I agree that Speedy Phone Fix (559026-6028) saves and processes my personal data in accordance with the Data Protection Act (GDPR)'.tr,
                  style:
                      TextStyle(color: BlueColor, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
            ],
          ),
          _checkboxController.isChecked == true
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: BlueColor),
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('valid');
                            if (isEdite == false) {
                              Get.showOverlay(
                                  asyncFunction: () async =>
                                      await newCustomerPrivateController
                                          .newCustomerPrivate(
                                              branchId: box.read('branchId'),
                                              userName: box.read('username'),
                                              cusName:
                                                  customerNameController.text,
                                              cusEmail: emailController.text,
                                              cusAddress:
                                                  addressController.text,
                                              cusMobile: mobileController.text,
                                              gdpr:
                                                  _checkboxController.isChecked)
                                          .then((value) =>
                                              newCustomerPrivateController
                                                  .onInit()),
                                  loadingWidget: const Center(
                                      child: CircularProgressIndicator(
                                    color: BlueColor,
                                  )),
                                  opacityColor: BlueColor.withOpacity(0.1));
                              CustomPrivateController.clear();
                            } else if (isEdite == false) {
                              return null;
                            }
                          }
                        },
                        child:  Text("Save".tr,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: BlueColor.withOpacity(.5)),
                    child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {},
                        child:  Text("Save".tr,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                  ),
                ),
        ]),
      ),
    );
  }
}
