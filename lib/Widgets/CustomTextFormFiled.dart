// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Utils/AppStyle.dart';
GlobalKey<FormState> formstate = GlobalKey();

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.keyboardType,
      this.hint,
      required this.controller,
      this.validator,
      this.focusNode,
      this.onChange,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines,
      this.obscureText = false,
      this.onTap,
      this.contentPadding});
  
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
  var maxLines;
  EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
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
            maxLines: maxLines,
            textInputAction: TextInputAction.next,
            onTap: onTap,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: contentPadding,
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
