import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/widget_util.dart';
import '../values/assets_manager.dart';
import '../values/strings_manager.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final Image image;
  const CustomRadioButton({Key? key, required this.label, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageAssets.engFlag,width: 48,height: 48,),
        RegularText(text: label,),
      ],
    );
  }
}
