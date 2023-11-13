import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/widget/ferry_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/util/disallow_emoji.dart';
import '../../../core/values/values_manager.dart';
import '../controllers/leave_page_controller.dart';

class LeavePageView extends GetView<LeavePageController> {
  const LeavePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FerryAppBar(title: AppStrings.leavePageLabel),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: WidgetUtil.defaultAllPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                    text: AppStrings.chooseDateAndTime,
                    textStyle: getMediumStyle(color: Colors.black)),
                WidgetUtil.spaceVertical(AppSize.s10),
                GestureDetector(
                    onTap: () {
                      controller.chooseDate();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.containerBackground,
                            borderRadius:
                                BorderRadius.circular(AppRadius.defaultRadius)),
                        height: 90,
                        width: double.infinity,
                        child: Padding(
                          padding: WidgetUtil.defaultAllPadding(),
                          child: controller.isload == false
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RegularText(
                                        text: AppStrings.enterDate,
                                        textStyle: getRegularStyle(
                                            color: ColorManager.primaryColor)),
                                    Text("mm/dd/yy",
                                        style: getRegularStyle(
                                            color: ColorManager.grey)),
                                  ],
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      DateFormat.yMMMMEEEEd()
                                          .format(controller.selectedDate.value)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: ColorManager.primaryColor))),
                        ))),
                RadioListTile(
                  activeColor: ColorManager.primaryColor,
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  title: RegularText(
                    text: AppStrings.fullDay,
                    textStyle: getRegularStyle(color: Colors.black),
                  ),
                  value: "Full Day",
                  groupValue: controller.select,
                  onChanged: (value) {
                    controller.radioSelect(value);
                  },
                ),
                RadioListTile(
                  activeColor: ColorManager.primaryColor,
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  title: RegularText(
                    text: AppStrings.morning,
                    textStyle: getRegularStyle(color: Colors.black),
                  ),
                  value: "Morning",
                  groupValue: controller.select,
                  onChanged: (value) {
                    controller.radioSelect(value);
                  },
                ),
                RadioListTile(
                  activeColor: ColorManager.primaryColor,
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  title: RegularText(
                    text: AppStrings.evening,
                    textStyle: getRegularStyle(color: Colors.black),
                  ),
                  value: "Evening",
                  groupValue: controller.select,
                  onChanged: (value) {
                    controller.radioSelect(value);
                  },
                ),
                TextFormField(
                  controller: controller.leaveTextEditingController,
                  cursorColor: ColorManager.primaryColor,
                  inputFormatters: [EmojiInputFormatter()],
                  //  [
                  //   FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
                  //   LengthLimitingTextInputFormatter(500)
                  // ],
                  maxLines: 3,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppRadius.defaultRadius),
                        borderSide:
                            BorderSide(color: ColorManager.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppRadius.defaultRadius),
                        borderSide:
                            BorderSide(color: ColorManager.primaryColor),
                      ),
                      hintText: AppStrings.reasonOfLeave.tr,
                      hintStyle:
                          getRegularStyle(color: ColorManager.textColorVariant),
                      filled: true,
                      fillColor: ColorManager.containerBackground,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppRadius.defaultRadius))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black87),
                        onPressed: () {
                          Get.back();
                        },
                        child: const RegularText(
                            text: AppStrings.cancel,
                            textStyle: TextStyle(fontSize: AppSize.s20))),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primaryColor,
                            foregroundColor: Colors.white),
                        onPressed: () async {
                          await controller.leaveSubmit();
                        },
                        child: controller.isLoading == false
                            ? const RegularText(
                                text: AppStrings.submit,
                                textStyle: TextStyle(
                                    fontSize: AppSize.s20, color: Colors.white),
                              )
                            : const Center(
                                child: SizedBox(
                                  height: AppSize.s18,
                                  width: AppSize.s18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
