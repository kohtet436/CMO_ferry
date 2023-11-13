import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DialogLogOut extends StatelessWidget {
  const DialogLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetUtil.defaultAllPadding(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          RegularText(
            text: 'Log out',
            textStyle: getSemiBoldStyle(color: ColorManager.black),
          ),
          WidgetUtil.spaceVertical(
            AppPadding.defaultPadding,
          ),
          const RegularText(
            text: 'Are you sure you want to log out?',
          ),
        ],
      ),
    );
  }
}
