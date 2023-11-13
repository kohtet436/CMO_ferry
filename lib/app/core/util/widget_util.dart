import 'package:auto_size_text/auto_size_text.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui show TextHeightBehavior;

import '../helper/constant.dart';
import '../values/assets_manager.dart';
import '../values/color_manager.dart';
import '../values/font_manager.dart';
import '../values/values_manager.dart';

class WidgetUtil {
  static WidgetUtil? _instance;

  WidgetUtil._();

  factory WidgetUtil() {
    _instance ??= WidgetUtil._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  static int rotateH() {
    return 1;
  }

  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceHorizontal2(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(height: height);
  }

  static Widget spaceVertical2(double height) {
    return SizedBox(height: height);
  }

  static Widget horizontalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), height: 0.5);
  }
  
  static EdgeInsets defaultAllPadding() {
    return const EdgeInsets.all(AppPadding.p16);
  }

  static EdgeInsets defaultAllHorizontalPadding(){
    return const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding,);
  }

  static EdgeInsets defaultAllVerticalPadding(){
    return const EdgeInsets.symmetric(vertical: AppPadding.defaultPadding,);
  }

  static EdgeInsets defaultAllPaddingWithoutBottom(){
    return const EdgeInsets.only(top: AppPadding.p16,left: AppPadding.p16,right: AppPadding.p16);
    
  }

  static EdgeInsets defaultHorizontalPadding() {
    return const EdgeInsets.symmetric(horizontal: AppPadding.p16);
  }

  static EdgeInsets defaultVerticalPadding() {
    return const EdgeInsets.symmetric(vertical: AppPadding.p16);
  }

  static Widget verticalLine1() {
    return Container(color: Colors.black.withOpacity(0.2), width: 0.5);
  }

  static Widget verticalGreyLine1() {
    return Container(color: Colors.grey, width: 0.5);
  }

  // Widget getPopUpDialog(BuildContext context, List<Widget> children) {
  //   return Dialog(
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(AppSize.s14)),
  //     elevation: AppSize.s1_5,
  //     backgroundColor: Colors.transparent,
  //     child: Container(
  //         decoration: BoxDecoration(
  //             color: ColorManager.white,
  //             shape: BoxShape.rectangle,
  //             borderRadius: BorderRadius.circular(AppSize.s14),
  //             boxShadow: const [
  //               BoxShadow(
  //                   color: Colors.black26,
  //                   blurRadius: AppSize.s12,
  //                   offset: Offset(AppSize.s0, AppSize.s12))
  //             ]),
  //         child: getDialogContent(context,children[]),
  //   );
  // }

  Widget getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  static Widget getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), //json image
    );
  }

  static EdgeInsets defaultCardPadding() {
    return const EdgeInsets.all(AppPadding.p16);
  }

  static Text labelBurmeseText(String? text) {
    return Text(
      text ?? "",
      style: labelBurmeseFontStyle,
    );
  }

  static Text regularText({required String text, TextStyle? style}) {
    return Text(
      text,
      style: getRegularStyle(color: ColorManager.black).merge(style),
    );
  }

  
//
// static void actionOpenDialog() {
//   Get.dialog(
//       Center(
//         child: WillPopScope(
//           onWillPop: () async => false,
//           child: /*Card(
//             elevation: 5,
//             child: Container(
//               width: 200,
//               height: 200,
//               padding: const EdgeInsets.all(30),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
//               child:  getAnimatedImage(JsonAssets.loading),
//             ),
//           )*/
//         ),
//       ),
//       barrierDismissible: false,
//       barrierColor: const Color(0x26000000));
// }
}

class RegularText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  const RegularText({
    required this.text,
    Key? key,
    this.textStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: getTextStyle().merge(textStyle),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}

class RegularAutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final double? minFontSize;
  final double? maxFontSize;
  final double? stepGranularity;
  final List<double>? presetFontSizes;
  final AutoSizeGroup? group;
  final bool? wrapWords;
  final Widget? overflowReplacement;

  const RegularAutoSizeText({
    required this.text,
    Key? key,
    this.textStyle,
    this.strutStyle,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.group,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.tr,
      style: getRegularStyle(
        color: ColorManager.black,
      ).merge(textStyle),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      minFontSize: minFontSize ?? 12,
      maxFontSize: maxFontSize ?? 18,
      group: group,
      overflowReplacement: overflowReplacement,
      presetFontSizes: presetFontSizes,
      stepGranularity: stepGranularity ?? 1,
      wrapWords: wrapWords ?? true,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
    );
  }
}
