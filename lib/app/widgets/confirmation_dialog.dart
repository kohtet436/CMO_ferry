import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? content;
  void Function()? onPressedOk;
  void Function()? onPressedCancel;
  final Color foregroundColor;

  ConfirmationDialog(
      {required this.foregroundColor,
      this.title,
      this.content,
      this.onPressedCancel,
      this.onPressedOk,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          title.toString(),
          style: getSemiBoldStyle(color: Colors.black),
        ),
        content: Text(
          content.toString(),
          style: getRegularStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(100, 40)),
                  backgroundColor: MaterialStatePropertyAll(Colors.grey[300]),
                  foregroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              onPressed: onPressedCancel,
              child: RegularText(
                text:AppStrings.cancel,
                textStyle: getRegularStyle(color: Colors.black),
              )),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(100, 40)),
                  backgroundColor:
                      MaterialStatePropertyAll(ColorManager.primaryColor)),
              onPressed: onPressedOk,
              child:RegularText(
                text:AppStrings.submit,
                textStyle: getRegularStyle(color: foregroundColor),
              ))
        ]);
  }
}
