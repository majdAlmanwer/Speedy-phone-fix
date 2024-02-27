import 'package:flutter/material.dart';
import '../Utils/AppStyle.dart';

class CustomDropdownFormField extends StatelessWidget {
  CustomDropdownFormField({
    Key? key,
    this.keyboardType,
    this.hint,
    this.controller,
    this.validator,
    this.focusNode,
    this.onChange,
    this.suffixIcon,
    this.obscureText = false,
    this.onTap,
    required this.items, // أضيفت قائمة العناصر هنا
    this.selectedValue, // قيمة افتراضية
    required this.onChanged, // دالة للتحكم في القيمة المختارة
  }) : super(key: key);

  TextEditingController? controller = TextEditingController();
  TextInputType? keyboardType;
  String? hint;
  FocusNode? focusNode;
  Widget? suffixIcon;
  bool obscureText = false;
  final String? Function(String?)? validator;
  Function(String)? onChange;
  Function()? onTap;

  // قائمة العناصر
  final List<DropdownMenuItem<dynamic>> items;

  // القيمة المختارة
  final String? selectedValue;

  // دالة للتحديث عند تغيير القيمة
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 15.0,
        left: 15.0,
      ),
      child: DropdownButtonFormField(
        value: selectedValue, // القيمة المختارة
        items: items, // قائمة العناصر
        onChanged: (value) {
          onChanged(value as String?); // دالة التحديث
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: FormBackGraund.withOpacity(.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: TextGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: TextGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: BorderGrey),
          ),
          hintText: hint,
          hintStyle: FormTextStyle,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
