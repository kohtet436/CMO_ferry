import 'package:flutter/material.dart';

class ChangePasswordTextField extends StatelessWidget {
 final String hint;
//  final String? label;
 final FocusNode? focusNode;
 final TextEditingController? controller;
 String? Function(String?)? validator;
 final Function()? onEditingComplete;
 void Function(String)? onChanged;
   ChangePasswordTextField({super.key,required this.hint,this.controller,this.focusNode,this.onEditingComplete,this.validator,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
onEditingComplete: onEditingComplete,
    controller:controller,
    validator: validator,
      decoration: InputDecoration(
        
        isDense: true,
        // label: Text(label),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        // border:const  OutlineInputBorder()
        ),
    );
  }
}