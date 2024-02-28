// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import '../Utils/AppStyle.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.keyboardType,
      this.hint,
      this.controller,
      this.validator,
      this.focusNode,
      this.onChange,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.onTap});
  TextEditingController? controller = TextEditingController();
  TextInputType? keyboardType;
  String? hint;
  FocusNode? focusNode;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obscureText = false;
  final String? Function(String?)? validator;
  Function(String)? onChange;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: EdgeInsets.only(
        right: 15.0,
        left: 15.0,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChange,
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        onTap: onTap,
        keyboardType: keyboardType,
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
          prefixIcon: prefixIcon,
        ),
      ),
    ));
  }
}
