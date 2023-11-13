import 'package:cmo_ferry/ferry_app.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:cmo_ferry/app/core/widget/ferry_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/helper/constant.dart';
import '../../../core/helper/helper.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/strings_manager.dart';
import '../controllers/ferry_request_page_controller.dart';

class FerryRequestPageView extends GetView<FerryRequestPageController> {
  const FerryRequestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAllTownships();
    controller.getAllRoads();
    return Scaffold(
      appBar: FerryAppBar(
        title: AppStrings.requestFerryPageLabel,
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: WidgetUtil.defaultAllPadding(),
              child: RegularText(
                text: AppStrings.requestFerry,
                textStyle: getSemiBoldStyle(
                  color: ColorManager.black,
                ),
              ),
            ),
            Padding(
              padding: WidgetUtil.defaultAllHorizontalPadding(),
              child: const RegularText(text: AppStrings.chooseTownship),
            ),
            WidgetUtil.spaceVertical(AppPadding.p8),
            Padding(
              padding: WidgetUtil.defaultAllHorizontalPadding(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.cardColor,
                  borderRadius: BorderRadius.circular(
                    AppRadius.defaultRadius,
                  ),
                  border: Border.all(
                    color: ColorManager.primaryColor,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: AppSize.dropDownHeight,
                    ),
                    value: controller.townshipValue.value,
                    items: controller.townshipsDropDownList,
                    hint: RegularText(
                      text: AppStrings.chooseTownship,
                      textStyle: getRegularStyle(color: ColorManager.textColorVariant),
                    ),
                    onChanged: (value) async {
                      controller.updateTownshipValue(value);
                      if (controller.roadValue.value != null) {
                        await controller.getAllFerryStops(controller.roadValue.value!, controller.townshipValue.value!);
                        if (controller.ferryStops.isEmpty) {
                          Helper.showQuickToast(AppStrings.noFerryStop);
                        }
                      } else {
                        _showNullError(AppStrings.road);
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
              child: const RegularText(text: AppStrings.chooseRoad),
            ),
            WidgetUtil.spaceVertical(AppPadding.p8),
            Padding(
              padding: WidgetUtil.defaultAllHorizontalPadding(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.cardColor,
                  borderRadius: BorderRadius.circular(
                    AppRadius.defaultRadius,
                  ),
                  border: Border.all(
                    color: ColorManager.primaryColor,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: AppSize.dropDownHeight,
                    ),
                    value: controller.roadValue.value,
                    items: controller.roadsDropDownList,
                    hint: RegularText(
                      text: AppStrings.chooseRoad,
                      textStyle: getRegularStyle(color: ColorManager.textColorVariant),
                    ),
                    onChanged: (value) async {
                      controller.updateRoadValue(value);
                      if (controller.townshipValue.value != null) {
                        await controller.getAllFerryStops(controller.roadValue.value!, controller.townshipValue.value!).then((value) {
                          if (controller.ferryStops.isEmpty) {
                            Helper.showQuickToast(AppStrings.noFerryStop);
                          }
                        });
                      } else {
                        _showNullError(AppStrings.township);
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
              child: const RegularText(text: AppStrings.chooseFerryStop),
            ),
            WidgetUtil.spaceVertical(AppPadding.p8),
            Padding(
              padding: WidgetUtil.defaultAllHorizontalPadding(),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.cardColor,
                  borderRadius: BorderRadius.circular(
                    AppRadius.defaultRadius,
                  ),
                  border: Border.all(
                    color: ColorManager.primaryColor,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: AppSize.dropDownHeight,
                    ),
                    value: controller.ferryStopValue.value,
                    items: controller.ferryStopsDropDownList,
                    hint: RegularText(
                      text: AppStrings.chooseFerryStop,
                      textStyle: getRegularStyle(color: ColorManager.textColorVariant),
                    ),
                    onChanged: (value) {
                      controller.updateFerryStopValue(value);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
              child: const RegularText(text: AppStrings.chooseDate),
            ),
            Padding(
              padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppRadius.defaultRadius,
                    ),
                  ),
                  side: BorderSide(
                    color: ColorManager.primaryColor,
                  ),
                  alignment: Alignment.centerLeft,
                  minimumSize: const Size.fromHeight(AppSize.s56),
                  backgroundColor: ColorManager.cardColor,
                  textStyle: getRegularStyle(
                    color: ColorManager.textColorVariant,
                  ),
                ),
                onPressed: () => Get.dialog(
                  Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SfDateRangePicker(
                          showActionButtons: true,
                          initialDisplayDate: controller.initialDate.value,
                          initialSelectedDate: controller.initialDate.value,
                          minDate: controller.minDate.value,
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: getRegularStyle(
                              color: ColorManager.black,
                            ),
                          ),
                          toggleDaySelection: false,
                          onCancel: () => Get.back(),
                          onSubmit: (date) {
                            Get.back();
                            controller.updatePickedDate(date as DateTime);
                          },
                          selectionColor: ColorManager.primaryColor,
                          todayHighlightColor: ColorManager.primaryColor,
                          selectionTextStyle: getRegularStyle(color: ColorManager.textOnPrimary),
                          headerStyle: DateRangePickerHeaderStyle(
                            backgroundColor: ColorManager.primaryColor,
                            textStyle: getSemiBoldStyle(
                              color: ColorManager.textOnPrimary,
                            ),
                          ),
                          selectionMode: DateRangePickerSelectionMode.single,
                        ),
                      ],
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularAutoSizeText(
                      text: DateFormat('dd / MMMM / yyyy',Get.locale!.toLanguageTag()).format(
                        controller.pickedDate.value,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.calendar,
                      color: ColorManager.textColorVariant,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.clearDataOnClicked(),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(
                          AppSize.s45,
                        ),
                        backgroundColor: ColorManager.textFieldGrey,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppRadius.defaultRadius,
                          ),
                        ),
                      ),
                      child: const FittedBox(
                        child: RegularAutoSizeText(
                          text: AppStrings.dialogCancel,
                        ),
                      ),
                    ),
                  ),
                  WidgetUtil.spaceHorizontal(
                    AppPadding.p16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.ferryStopValue.value == null) {
                          Helper.showQuickToast("${AppStrings.ferryStop.tr}${AppStrings.cannotBeNull.tr}");
                        } else {
                          controller.requestFerry(controller.ferryStopValue.value!);
                        }
                        controller.clearDataOnClicked();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(
                          AppSize.s45,
                        ),
                        backgroundColor: ColorManager.primaryColor,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppRadius.defaultRadius,
                          ),
                        ),
                      ),
                      child: FittedBox(
                        child: RegularAutoSizeText(
                          text: AppStrings.dialogConfirm,
                          textStyle: getRegularStyle(
                            color: ColorManager.textOnPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showNullError(String nullPlace) {
    Helper.console('$nullPlace ${AppStrings.cannotBeNull}');
  }
}
