import 'package:cmo_ferry/app/core/helper/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/models/response_models/employee.dart';
import '../util/widget_util.dart';
import '../values/color_manager.dart';
import '../values/strings_manager.dart';
import '../values/styles_manager.dart';
import '../values/values_manager.dart';

class OtherProfileDetailCard extends StatelessWidget {
  final Employee? employee;
  final void Function() onPressed;
  final bool isMM;

  const OtherProfileDetailCard(
      {Key? key, required this.employee, required this.onPressed, required this.isMM,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (employee == null) {
      return Card(
        elevation: AppElevation.defaultCardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.defaultRadius,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      Employee employee = this.employee!;
      return Card(
        elevation: AppElevation.defaultCardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.defaultRadius,
          ),
        ),
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText(
                    text: AppStrings.profileDetail.tr,
                    textAlign: TextAlign.start,
                    textStyle: getSemiBoldStyle(
                      color: ColorManager.black,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorManager.secondaryLightColor,
                    foregroundColor: ColorManager.white,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppRadius.defaultCardRadius,
                          ),
                        ),
                        backgroundColor: ColorManager.secondaryLightColor,
                      ),
                      onPressed: onPressed,
                      icon: const FaIcon(FontAwesomeIcons.pen, size: AppSize.s16),
                      // label: RegularText(
                      //   text: AppStrings.edit,
                      //   textStyle: TextStyle(color: ColorManager.textOnPrimary),
                      // ),
                    ),
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                mainAxisSize: MainAxisSize.max,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Phone",
                    child: Icon(
                      FontAwesomeIcons.squarePhone,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  RegularText(
                    text: employee.phoneNumber,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Email",
                    child: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  RegularText(
                    text: employee.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Department",
                    child: Icon(
                      FontAwesomeIcons.briefcase,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  RegularText(
                    text: employee.department,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Date of Birth",
                    child: Icon(
                      FontAwesomeIcons.solidCalendar,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  RegularText(
                    text: DateFormat.yMMMMd(Get.locale!.toLanguageTag()).format(employee.dateOfBirth),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "NRC Card",
                    child: Icon(
                      FontAwesomeIcons.idCard,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  RegularText(
                    text: employee.nrc,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Ferry Stop",
                    child: Icon(
                      FontAwesomeIcons.mapLocation,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.defaultPadding,
                  ),
                  RegularText(
                    text: isMM ? employee.ferryStop != null ?employee.ferryStop!.myanmarName : 'N/A' : employee.ferryStop != null ?employee.ferryStop!.name : 'N/A' ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  const Tooltip(
                    message: "Address",
                    child: Icon(
                      FontAwesomeIcons.solidBuilding,
                      size: AppSize.fontAwesomeIconSizeText,
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  Expanded(
                    child: RegularText(
                      text: employee.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
