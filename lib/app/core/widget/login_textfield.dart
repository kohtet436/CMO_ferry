import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  String hintText;
  String? Function(String?) validator;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  int? maxLength;
  bool obscureText;
  IconData icon;
  void Function()? onEditingComplete;
  Widget? suffixIcon;
  FocusNode? focusNode;
  TextEditingController controller;
  
  LoginTextField({
    super.key,
    this.inputFormatters,
    required this.validator,
    this.focusNode,
    required this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.onEditingComplete,
    required this.hintText,
    required this.controller,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
        obscureText: obscureText,
        focusNode: focusNode,
        validator: validator,
        onEditingComplete: onEditingComplete,
        maxLength: maxLength,
        cursorColor: ColorManager.primaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon:suffixIcon ,
            isDense: true,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
                borderSide:
                    BorderSide(color: ColorManager.lightGrey, width: 0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
                borderSide:
                    BorderSide(color: ColorManager.lightGrey, width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
                borderSide:
                    BorderSide(color: ColorManager.lightGrey, width: 0)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
                borderSide:
                    BorderSide(color: ColorManager.lightGrey, width: 0)),
            hintText: hintText,
            hintStyle: getRegularStyle(
              color: ColorManager.lightGrey,
            ),
            prefixIcon: Icon(
              icon,
              color: ColorManager.lightGrey,
            ),
            fillColor: ColorManager.textFieldGrey,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.defaultRadius))));
  }
}
