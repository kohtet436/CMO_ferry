import 'package:cmo_ferry/app/core/values/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../util/widget_util.dart';
import '../values/color_manager.dart';
import '../values/values_manager.dart';

class Helper {
  static bool showLog = true;

  static console(String message) {
    var logger = Logger(printer: PrettyPrinter());
    logger.d(message);
  }

  static void showQuickToast(String message) {
    Fluttertoast.showToast(
      msg: message.tr,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: FontSize.s16,
    );
  }

  static showToast() {
    throw UnimplementedError();
  }

  static showLoadingDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
        ),
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              const RegularText(text: 'Loading ...'),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen!) Get.back();
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }
    return newValue;
  }
}
