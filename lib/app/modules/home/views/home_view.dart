import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../core/widget/ferry_app_bar.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/confirmation_dialog.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FerryAppBar(
          title: AppStrings.routePageLabel,
          actions: [
            IconButton(
                splashRadius: AppRadius.r5,
                onPressed: () {
                  Get.toNamed(Routes.PASSWORD_CHANGE);
                },
                icon: const FaIcon(
                  MdiIcons.alarmLight,
                  color: Colors.white,
                ))
          ],
        ),
        floatingActionButton: Obx(() => controller.isLoading
            ? const SizedBox()
            : controller.ischeckoutStatusLoading
                ?const SizedBox():controller.isAlreadyCheckedInOutResponse.value==null?const SizedBox()
                : controller.isAlreadyCheckedInOutResponse.value!
                                .isAlreadyCheckedIn ==
                            false &&
                        controller.isAlreadyCheckedInOutResponse.value!
                                .isAlreadyCheckedOut ==
                            false
                    ? FloatingActionButton.extended(
                        backgroundColor: ColorManager.primaryColor,
                        onPressed: () {
                          Get.dialog(ConfirmationDialog(
                            onPressedCancel: () {
                              Get.back();
                            },
                            onPressedOk: () {
                              controller.checkIn();
                              Get.back();
                            },
                            foregroundColor: Colors.white,
                            title: AppStrings.checkIn,
                            content: AppStrings.areYouSureCheckIn.tr,
                          ));
                        },
                        label: const Text(AppStrings.checkIn))
                    : controller.isAlreadyCheckedInOutResponse.value!
                                    .isAlreadyCheckedIn ==
                                true &&
                            controller.isAlreadyCheckedInOutResponse.value!
                                    .isAlreadyCheckedOut ==
                                false
                        ? FloatingActionButton.extended(
                            backgroundColor: ColorManager.primaryColor,
                            onPressed: () {
                              Get.dialog(ConfirmationDialog(
                                onPressedCancel: () {
                                  Get.back();
                                },
                                onPressedOk: () {
                                  controller.checkOut();
                                  Get.back();
                                },
                                foregroundColor: Colors.white,
                                title: AppStrings.checkOut,
                                content: AppStrings.areYouSureCheckOut.tr,
                              ));
                            },
                            label: const Text(AppStrings.checkOut))
                        : const SizedBox()),
        body: Obx(
          () => controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                )
              : controller.dailyRoute.value == null
                  ? const Center(
                      child: Icon(Icons.error),
                    )
                  : SmartRefresher(
                      onRefresh: controller.getDailyRouteData,
                      header: WaterDropHeader(
                        complete: const Text(AppStrings.refreshCompleted),
                        failed: const Text(AppStrings.refreshFailed),
                        waterDropColor: ColorManager.primaryColor,
                      ),
                      controller: controller.refreshController,
                      child: ListView.separated(
                          padding: WidgetUtil.defaultAllPadding(),
                          itemBuilder: (context, index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      MdiIcons.bus,
                                      color: controller.dailyRoute.value!
                                              .ferryStops[index].isCurrent
                                          ? ColorManager.primaryColor
                                          : ColorManager.grey,
                                      size: AppSize.s47,
                                    ),
                                    WidgetUtil.spaceHorizontal(AppSize.s4),
                                    Expanded(
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppRadius.r10)),
                                        child: DottedBorder(
                                          color: controller.dailyRoute.value!
                                                  .ferryStops[index].isCurrent
                                              ? ColorManager.black
                                              : Colors.transparent,
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(
                                              AppRadius.r10),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: AppPadding.p20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RegularText(
                                                    text: GetStorage()
                                                            .read('isMM')
                                                        ? controller
                                                            .dailyRoute
                                                            .value!
                                                            .ferryStops[index]
                                                            .ferryStopMmName
                                                        : controller
                                                            .dailyRoute
                                                            .value!
                                                            .ferryStops[index]
                                                            .ferryStopName,
                                                    textStyle: getSemiBoldStyle(
                                                        color: controller
                                                                .dailyRoute
                                                                .value!
                                                                .ferryStops[
                                                                    index]
                                                                .isCurrent
                                                            ? Colors.black
                                                            : ColorManager
                                                                .grey)),
                                                RegularText(
                                                    text: DateFormat("HH:mm  a")
                                                        .format(DateTime.parse(
                                                            controller
                                                                .dailyRoute
                                                                .value!
                                                                .ferryStops[
                                                                    index]
                                                                .checkInTime
                                                                .toString())),
                                                    textStyle: getRegularStyle(
                                                        color: controller
                                                                .dailyRoute
                                                                .value!
                                                                .ferryStops[
                                                                    index]
                                                                .isCurrent
                                                            ? Colors.black
                                                            : ColorManager
                                                                .grey)),
                                                GetStorage().read('isMM')
                                                    ? RegularText(
                                                        text:
                                                            "${controller.dailyRoute.value?.ferryStops[index].roadMmName.toString()},  ${controller.dailyRoute.value?.ferryStops[index].townshipMmName}",
                                                        textStyle: getRegularStyle(
                                                            color: controller
                                                                    .dailyRoute
                                                                    .value!
                                                                    .ferryStops[
                                                                        index]
                                                                    .isCurrent
                                                                ? Colors.black
                                                                : ColorManager
                                                                    .grey),
                                                      )
                                                    : RegularText(
                                                        text:
                                                            "${controller.dailyRoute.value?.ferryStops[index].roadName.toString()},  ${controller.dailyRoute.value?.ferryStops[index].townshipName}",
                                                        textStyle: getRegularStyle(
                                                            color: controller
                                                                    .dailyRoute
                                                                    .value!
                                                                    .ferryStops[
                                                                        index]
                                                                    .isCurrent
                                                                ? Colors.black
                                                                : ColorManager
                                                                    .grey),
                                                      )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                          separatorBuilder: (context, index) => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: AppPadding.p16),
                                      child: SizedBox(
                                          height: AppSize.s50,
                                          child: VerticalDivider(
                                              thickness: 1,
                                              color: Colors.black)),
                                    )
                                  ]),
                          itemCount:
                              controller.dailyRoute.value!.ferryStops.length),
                    ),
        ));
  }
}
