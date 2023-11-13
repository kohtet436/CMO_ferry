import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo_ferry/app/core/helper/app_prefs.dart';
import 'package:cmo_ferry/app/core/helper/constant.dart';
import 'package:cmo_ferry/app/core/helper/helper.dart';
import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/font_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:cmo_ferry/app/core/widget/dialog_edit_profile.dart';
import 'package:cmo_ferry/app/core/widget/other_profile_detail_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavorizr/parser/models/config/app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:octo_image/octo_image.dart';
import '../../../core/helper/app_enum.dart';
import '../../../core/helper/di.dart';
import '../../../core/values/assets_manager.dart';
import '../../../routes/app_pages.dart';
import '../controllers/other_page_controller.dart';

class OtherPageView extends StatelessWidget {
  final controller = Get.put(OtherPageController());

  OtherPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getEmployeeData(),
        child: const FaIcon(
          FontAwesomeIcons.arrowsRotate,
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(color: ColorManager.primaryColor),
              )
            : controller.employee.value == null
                ? Center(
                    child: FaIcon(
                      FontAwesomeIcons.triangleExclamation,
                      size: AppSize.s100,
                      color: ColorManager.error,
                    ),
                  )
                : NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          title: RegularText(
                            text: AppStrings.otherPageLabel,
                            textStyle: getSemiBoldStyle(
                              color: ColorManager.white,
                            ),
                          ),
                          backgroundColor: ColorManager.primaryColor,
                          collapsedHeight: AppSize.appBarHeight,
                          expandedHeight: 200.0,
                          toolbarHeight: AppSize.appBarHeight,
                          actions: [
                            IconButton(
                              padding: WidgetUtil.defaultAllPadding(),
                              icon: Icon(MdiIcons.imageEdit),
                              iconSize: AppSize.navigationBarIconSize,
                              onPressed: () {
                              },
                            ),
                          ],
                          floating: true,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Padding(
                              padding: WidgetUtil.defaultAllPadding(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  OctoImage(
                                    image: CachedNetworkImageProvider(
                                      controller.employee.value!.photoPath ?? 'null',
                                    ),
                                    height: AppSize.s100,
                                    width: AppSize.s100,
                                    imageBuilder: OctoImageTransformer.circleAvatar(),
                                    fit: BoxFit.cover,
                                    placeholderBuilder: OctoPlaceholder.circularProgressIndicator(),
                                    errorBuilder: (context, error, stackTrace) => Image.asset(ImageAssets.profilePlaceholder),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: WidgetUtil.defaultAllPadding(),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                color: ColorManager.textOnPrimary,
                                                FontAwesomeIcons.solidUser,
                                                size: AppSize.fontAwesomeIconSizeText,
                                              ),
                                              WidgetUtil.spaceHorizontal(
                                                AppPadding.p10,
                                              ),
                                              Flexible(
                                                child: FittedBox(
                                                  child: RegularAutoSizeText(
                                                    text: controller.employee.value!.name,
                                                    minFontSize: AppSize.s20,
                                                    textStyle: TextStyle(
                                                      color: ColorManager.textOnPrimary,
                                                      fontWeight: FontWeightManager.semiBold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          WidgetUtil.spaceVertical(AppPadding.p8),
                                          Row(
                                            children: [
                                              Tooltip(
                                                message: "E ID",
                                                child: Icon(
                                                  color: ColorManager.textOnPrimary,
                                                  FontAwesomeIcons.hashtag,
                                                  size: AppSize.fontAwesomeIconSizeText,
                                                ),
                                              ),
                                              WidgetUtil.spaceHorizontal(
                                                AppPadding.p10,
                                              ),
                                              Flexible(
                                                child: FittedBox(
                                                  child: RegularAutoSizeText(
                                                    text: controller.employee.value!.employeeNumber,
                                                    minFontSize: AppSize.s20,
                                                    textStyle: TextStyle(
                                                      color: ColorManager.textOnPrimary,
                                                      fontWeight: FontWeightManager.semiBold,
                                                      fontSize: AppSize.s20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ];
                    },
                    body: ListView(
                      padding: WidgetUtil.defaultAllPadding(),
                      children: [
                        Obx(
                          () => OtherProfileDetailCard(
                            employee: controller.employee.value,
                            onPressed: () {
                              onEditPressed();
                            },
                            isMM: false,
                          ),
                        ),
                        WidgetUtil.spaceVertical(
                          AppPadding.defaultPadding,
                        ),
                        Card(
                          elevation: AppElevation.defaultCardElevation,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppRadius.defaultCardRadius,
                            ),
                          ),
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: WidgetUtil.defaultAllPadding(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RegularText(
                                  text: AppStrings.ferryStatus,
                                  textStyle: getSemiBoldStyle(
                                    color: ColorManager.black,
                                  ),
                                ),
                                WidgetUtil.spaceVertical(AppPadding.p8),
                                _showFerryStatus(
                                  controller.ferryStatus.value,
                                  controller.employee.value!.id,
                                )
                              ],
                            ),
                          ),
                        ),
                        WidgetUtil.spaceVertical(
                          AppPadding.defaultPadding,
                        ),
                        Card(
                          elevation: AppElevation.defaultCardElevation,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppRadius.defaultCardRadius,
                            ),
                          ),
                          child: Padding(
                            padding: WidgetUtil.defaultAllPadding(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RegularText(
                                  text: AppStrings.services,
                                  textAlign: TextAlign.start,
                                  textStyle: getSemiBoldStyle(color: ColorManager.black),
                                ),
                                WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () => Get.dialog(
                                            _getDialog(),
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                controller.language.value == AppLanguage.ENG ? ImageAssets.engFlag : ImageAssets.myanmarFlag,
                                                width: AppSize.otherPageIconSize,
                                                height: AppSize.otherPageIconSize,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  maxFontSize: FontSize.s14,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  text: AppStrings.language,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () {
                                            if (controller.ferryStatus.value != FerryStatus.RIDING) {
                                              Helper.console('You must be riding ferry to change ferry stop');
                                            } else {
                                              Get.toNamed(Routes.FERRY_REQUEST_PAGE);
                                            }
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.mapPin,
                                                color: ColorManager.primaryColor,
                                                size: AppSize.otherPageIconSize,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  maxFontSize: FontSize.s14,
                                                  minFontSize: FontSize.s12,
                                                  text: AppStrings.changeFerryStop,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () => Get.dialog(
                                            _getDialog(),
                                          ),
                                          child: Column(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.palette,
                                                size: AppSize.otherPageIconSize,
                                                color: ColorManager.primaryColor,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  maxFontSize: FontSize.s14,
                                                  minFontSize: FontSize.s12,
                                                  text: AppStrings.theme,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () => showDialog(context: context, builder: (BuildContext context) => _getDialog()),
                                          child: Column(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.solidCommentDots,
                                                size: AppSize.otherPageIconSize,
                                                color: ColorManager.primaryColor,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  minFontSize: FontSize.s12,
                                                  maxFontSize: FontSize.s14,
                                                  text: AppStrings.feedback,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () => showDialog(context: context, builder: (BuildContext context) => _getDialog()),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.circleInfo,
                                                color: ColorManager.primaryColor,
                                                size: AppSize.otherPageIconSize,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  maxFontSize: FontSize.s14,
                                                  minFontSize: FontSize.s12,
                                                  text: AppStrings.aboutUs,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(AppPadding.p4),
                                        child: InkWell(
                                          onTap: () => Get.dialog(
                                            _showLogOutDialog(),
                                          ),
                                          child: Column(
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.rightFromBracket,
                                                color: ColorManager.primaryColor,
                                                size: AppSize.otherPageIconSize,
                                              ),
                                              WidgetUtil.spaceVertical(AppPadding.p8),
                                              const FittedBox(
                                                child: RegularAutoSizeText(
                                                  maxFontSize: FontSize.s14,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  minFontSize: FontSize.s12,
                                                  text: AppStrings.logOut,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  String _showFerryStop(String ferryStop, FerryStatus ferryStatus) {
    switch (ferryStatus) {
      case FerryStatus.NONE:
        return AppStrings.noFerryStop;
      case FerryStatus.SUBMITTED:
        return '$ferryStop (Submitted)';
      case FerryStatus.PENDING:
        return '$ferryStop (Pending)';
      case FerryStatus.RIDING:
        return ferryStop;
    }
  }

  Widget _getDialog() {
    AppLanguage? language = controller.language.value;
    return Dialog(
      child: Padding(
        padding: WidgetUtil.defaultAllPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RegularText(
              text: AppStrings.changeLanguage.tr,
              textStyle: getBoldStyle(color: ColorManager.black),
            ),
            Obx(
              () => RadioListTile(
                activeColor: ColorManager.primaryColor,
                selected: controller.language.value == AppLanguage.ENG,
                value: AppLanguage.ENG,
                title: const RegularText(
                  text: AppStrings.eng,
                ),
                groupValue: language,
                onChanged: (value) {
                  language = value;
                  Get.back();
                  Future.delayed(
                    const Duration(milliseconds: 300),
                  );
                  instance<AppPreference>().setAppLanguage(AppLanguage.ENG);
                  controller.updateLocale();
                  // Get.updateLocale(
                  //   controller.language.value == Language.ENG ? const Locale('en', 'MM') : const Locale('my', 'MM'),
                  // );
                  // GetStorage().write('isMM', false);
                },
              ),
            ),
            Obx(
              () => RadioListTile(
                activeColor: ColorManager.primaryColor,
                selected: controller.language.value == AppLanguage.MM,
                value: AppLanguage.MM,
                title: const RegularText(
                  text: AppStrings.myanmar,
                ),
                groupValue: language,
                onChanged: (value) {
                  language = value;
                  Get.back();
                  Future.delayed(
                    const Duration(milliseconds: 300),
                  );
                  instance<AppPreference>().setAppLanguage(AppLanguage.MM);
                  controller.updateLocale();
                  // Get.updateLocale(
                  //   controller.language.value == Language.MM ? const Locale('my', 'MM') : const Locale('en', 'MM'),
                  // );
                  // GetStorage().write('isMM', true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showFerryStatus(FerryStatus ferryStatus, String employeeId) {
    Helper.console(controller.ferryStatus.value.toString());
    Helper.console(ferryStatus.toString());
    switch (ferryStatus) {
      case FerryStatus.NONE:
        return Text.rich(
          TextSpan(
            text: AppStrings.ferryStatusNone.tr,
            style: getRegularStyle(
              color: ColorManager.black,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(
                      Routes.FERRY_REQUEST_PAGE,
                      parameters: {'employeeId': employeeId},
                    )!
                        .then((value) => Get.delete<OtherPageController>());
                  },
                text: AppStrings.ferryStatusNoneSpanTap.tr,
                style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontFamily: FontConstants.engFontFamily,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        );
      case FerryStatus.SUBMITTED:
        return const RegularText(text: AppStrings.ferryStatusSubmitted);
      case FerryStatus.PENDING:
        return const RegularText(text: AppStrings.ferryStatusPending);
      case FerryStatus.RIDING:
        return Text.rich(
          TextSpan(
            text: AppStrings.ferryStatusRiding.tr,
            style: getRegularStyle(
              color: ColorManager.black,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    controller.cancelFerryRequest(DateTime.now());
                  },
                text: AppStrings.ferryStatusRidingSpanTap.tr,
                style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontFamily: FontConstants.engFontFamily,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        );
    }
  }

  void onEditPressed() {
    Get.dialog(
      Obx(
        () => DialogEditProfile(
          phoneNumberTextController: controller.phoneNumberTextController.value,
          addressTextController: controller.addressTextController.value,
          focusNode: controller.addressNode,
          updateProfile: controller.updateEmployeeProfile,
          phoneNumberHint: controller.employee.value!.phoneNumber,
          addressHint: controller.employee.value!.address,
        ),
      ),
    );
  }

  Widget _showLogOutDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
      ),
      title: RegularText(
        text: AppStrings.logOut,
        textStyle: getSemiBoldStyle(
          color: ColorManager.black,
        ),
        textAlign: TextAlign.left,
      ),
      titlePadding: const EdgeInsets.only(
        top: AppPadding.defaultPadding,
        left: AppPadding.defaultPadding,
        right: AppPadding.defaultPadding,
        bottom: AppPadding.defaultPadding,
      ),
      content: const RegularText(
        text: AppStrings.logOutConfirmation,
      ),
      contentPadding: const EdgeInsets.only(
        left: AppPadding.defaultPadding,
        right: AppPadding.defaultPadding,
        bottom: AppPadding.defaultPadding,
      ),
      actionsPadding: const EdgeInsets.only(
        bottom: AppPadding.defaultPadding,
        left: AppPadding.defaultPadding,
        right: AppPadding.defaultPadding,
      ),
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r10),
            ),
          ),
          onPressed: () => Get.back(),
          child: RegularText(
            text: AppStrings.dialogCancel,
            textStyle: getRegularStyle(
              color: ColorManager.black,
            ),
          ),
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: () {
            AppPreference appPrefs = instance();
            appPrefs.deleteAppData();
            Get.offAllNamed(Routes.LOGIN);
          },
          //Get.offAllNamed(Routes.LOGIN),
          child: RegularText(
            text: AppStrings.dialogConfirm,
            textStyle: getRegularStyle(
              color: ColorManager.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
