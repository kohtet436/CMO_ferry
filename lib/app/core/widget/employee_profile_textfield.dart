import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:flutter/material.dart';

class EmployeeProfileTextField extends StatelessWidget {
  final String? name;
  final int? maxLines;
  final String? label;
  void Function(String)? onChanged;
  final IconData? icon;
  Function()? onEditingComplete;
  final FocusNode? focusNode;
  final bool enabled;

  EmployeeProfileTextField(
      {super.key,
      required this.name,
      required this.label,
      this.icon,
      this.maxLines = 1,
      this.focusNode,
      required this.enabled,
      this.onEditingComplete,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label.toString(),
        style: const TextStyle(color: Colors.grey),
      ),
      WidgetUtil.spaceVertical(8),
      TextFormField(
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        controller: TextEditingController(text: name),
        maxLines: maxLines,
        enabled: enabled,
        decoration: InputDecoration(
            focusColor: ColorManager.darkGrey,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: ColorManager.darkGrey)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: ColorManager.darkGrey)),
            suffixIcon: Icon(icon),
            isDense: true,
            border: const OutlineInputBorder()),
      ),
    ]);
  }
}
