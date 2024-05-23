import 'package:flutter/material.dart';
import 'package:speedy_phone_fix/Controller/CustomerCompanyController.dart';
import 'package:speedy_phone_fix/Utils/AppStyle.dart';
import 'package:speedy_phone_fix/Widgets/CustomTextFormFiled.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';

class MyCheckboxController {
  bool isChecked = false;
}

class CompanyCustomerScreenBody extends StatefulWidget {
  const CompanyCustomerScreenBody({super.key});

  @override
  State<CompanyCustomerScreenBody> createState() =>
      _CompanyCustomerScreenBodyState();
}

class _CompanyCustomerScreenBodyState extends State<CompanyCustomerScreenBody> {
  late MyCheckboxController _checkboxController;

  @override
  void initState() {
    super.initState();
    _checkboxController = MyCheckboxController();
  }

  final box = GetStorage();
  CustomerCompanyController customerCompanyController =
      Get.put(CustomerCompanyController());

  final CustomerCompanyController newCustomerCompanyController = Get.find();
  final TextEditingController CustomersName = TextEditingController();
  TextEditingController CustomerAddress = TextEditingController();

  TextEditingController Car = TextEditingController();

  TextEditingController CustomerEmailAddress = TextEditingController();

  TextEditingController CustomerType = TextEditingController();

  TextEditingController Delegate = TextEditingController();

  TextEditingController OrganizationNo = TextEditingController();

  TextEditingController WebsiteAddress = TextEditingController();
  TextEditingController InvoiceAddress = TextEditingController();
  TextEditingController CustomCompanyController = TextEditingController();
  bool isEdite = false;
  bool value = false;
  bool enabled = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
              hint: "Add customer’s name",
              controller: CustomersName,
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
              hint: "Customer’s Address",
              controller: CustomerAddress,
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
              controller: Car,
              hint: "+46",
              prefixIcon: const Image(
                  width: 20,
                  height: 20,
                  image: AssetImage(
                      "Assets/Icons/emojione-v1_flag-for-sweden.png")),
              keyboardType: TextInputType.number,
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
              controller: CustomerEmailAddress,
              hint: "Customer’s Email Address",
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
              hint: "Företag",
              enabled: false,
              controller: CustomerType,
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
                'Delegate',
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: Delegate,
              hint: "Delegate",
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
                  image: AssetImage("Assets/Icons/build.png")),
              title: Text(
                'Organization No.',
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: OrganizationNo,
              hint: "Organization Number",
              keyboardType: TextInputType.number,
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
                  image: AssetImage("Assets/Icons/web.png")),
              title: Text(
                'Customer Website',
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: WebsiteAddress,
              hint: "Website Address",
              keyboardType: TextInputType.url,
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Image(
                  width: 23,
                  height: 23,
                  image: AssetImage("Assets/Icons/save.png")),
              title: Text(
                'Invoice Address',
                style: textStyle,
              ),
            ),
            CustomTextFormField(
              controller: InvoiceAddress,
              hint: "Invoice Address",
              validator: (val) {
                print("Validating:  with value: $val");
                if (val == null || val.isEmpty) {
                  return 'required'.tr;
                }
                return null;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _checkboxController.isChecked,
                  onChanged: (value) {
                    validator:
                    (val) {
                      print("Validating:  with value: $val");
                      if (val == null || val.isEmpty) {
                        return 'required'.tr;
                      }
                      return null;
                    };
                    setState(() {
                      _checkboxController.isChecked = value!;
                    });
                  },
                ),
                Flexible(
                  // Wrap the Text with Flexible
                  child: Text(
                    'Jag godkänner att Speedy Phone Fix (559026-6028) sparar och behandlar mina personuppgifter enligt dataskyddlagen (GDPR)',
                    style: TextStyle(
                        color: BlueColor, fontWeight: FontWeight.bold),
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('valid');
                              if (isEdite == false) {
                                Get.showOverlay(
                                    asyncFunction: () async =>
                                        await newCustomerCompanyController
                                            .newCustomerCompany(
                                                branchId: box.read('branchId'),
                                                username: box.read('username'),
                                                cusName: CustomersName.text,
                                                cusEmail:
                                                    CustomerEmailAddress.text,
                                                cusAddress:
                                                    CustomerAddress.text,
                                                cusMobile: Car.text,
                                                cus_Delegera: Delegate.text,
                                                cus_orgenization_no:
                                                    OrganizationNo.text,
                                                cus_invoice_address:
                                                    InvoiceAddress.text,
                                                cus_wesite: WebsiteAddress.text,
                                                gdpr: _checkboxController
                                                    .isChecked)
                                            .then((value) =>
                                                newCustomerCompanyController
                                                    .onInit()),
                                    loadingWidget: const Center(
                                        child: CircularProgressIndicator(
                                      color: BlueColor,
                                    )),
                                    opacityColor: BlueColor.withOpacity(0.1));
                                CustomCompanyController.clear();
                              } else if (isEdite == false) {
                                return null;
                              }
                            }
                          },
                          child: const Text("Save",
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ))),
                          onPressed: () {},
                          child: const Text("Save",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold))),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
