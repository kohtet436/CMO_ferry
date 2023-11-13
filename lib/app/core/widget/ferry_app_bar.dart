import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../values/color_manager.dart';
import '../values/styles_manager.dart';

class FerryAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget>? actions;
  final String title;

  FerryAppBar(
      {Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSize.appBarHeight,
      elevation: 4,
      actions: actions,
      title: RegularText(
        text:title,
        textStyle: getSemiBoldStyle(color: ColorManager.white),
      ),
      centerTitle: false,
      backgroundColor: ColorManager.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appBarHeight);
}
