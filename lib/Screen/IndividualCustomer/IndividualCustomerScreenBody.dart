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
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController customerTypeController = TextEditingController();
  final TextEditingController gdprController = TextEditingController();
  TextEditingController CustomPrivateController = TextEditingController();
  bool value = true;
  bool isEdite = false;
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/iconamoon_profile.png")),
          title: Text(
            'Customer’s Name',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Add customer's name",
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
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/bx_map.png")),
          title: Text(
            'Address',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Customer's Address",
          controller: addressController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/carbon_phone.png")),
          title: Text(
            'Car',
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
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/mail.png")),
          title: Text(
            'Email',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Email Address",
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTile(
          leading: Image(
              width: 23,
              height: 23,
              image: AssetImage("Assets/Icons/iconamoon_profile.png")),
          title: Text(
            'Customer’s Type',
            style: textStyle,
          ),
        ),
        CustomTextFormField(
          hint: "Private",
          controller: customerTypeController,
          enabled: false,
        ),
        const SizedBox(
          height: 20,
        ),
        const ListTile(
          title: Text(
            'GDPR',
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
                'Jag godkänner att Speedy Phone Fix (559026-6028) sparar och behandlar mina personuppgifter enligt dataskyddlagen (GDPR)',
                style: TextStyle(color: BlueColor, fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ),
          ],
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
                    newCustomerPrivateController
                        .newCustomerPrivate(
                            branchId: box.read('branchId'),
                            userName: box.read('username'),
                            cusName: customerNameController.text,
                            cusEmail: emailController.text,
                            cusAddress: addressController.text,
                            cusMobile: mobileController.text,
                            gdpr: _checkboxController.isChecked)
                        .then((value) => newCustomerPrivateController.onInit());
                    CustomPrivateController.clear();
                  } else if (isEdite == false) {
                    return null;
                  }
                },
                child: const Text("Save",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
          ),
        ),
      ]),
    );
  }
}
