import 'package:cmo_ferry/app/core/helper/helper.dart';
import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

import '../helper/helper.dart';
import '../values/strings_manager.dart';

class DialogEditProfile extends StatelessWidget {
  final TextEditingController phoneNumberTextController;
  final TextEditingController addressTextController;
  final FocusNode focusNode;
  final void Function(String phoneNumber, String address) updateProfile;
  final String phoneNumberHint;
  final String addressHint;

  const DialogEditProfile({Key? key,
    required this.phoneNumberTextController,
    required this.addressTextController,
    required this.focusNode,
    required this.updateProfile,
    required this.phoneNumberHint,
    required this.addressHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
      ),
      title: RegularText(
        text: AppStrings.dialogProfileEdit,
        textStyle: getSemiBoldStyle(
          color: ColorManager.black,
        ),
      ),
      scrollable: true,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const RegularText(
            text: AppStrings.phoneNumber,
          ),
          WidgetUtil.spaceVertical(
            AppPadding.p8,
          ),
          TextField(
            maxLines: 1,
            controller: phoneNumberTextController,
            autofocus: true,
            cursorColor: ColorManager.primaryColor,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: getRegularStyle(color: ColorManager.textColorVariant),
              hintText: phoneNumberHint,
            ),
          ),
          const RegularText(
            text: AppStrings.address,
          ),
          WidgetUtil.spaceVertical(
            AppPadding.p8,
          ),
          TextField(
            minLines: 1,
            maxLines: 5,
            controller: addressTextController,
            autofocus: true,
            maxLength: 240,
            cursorColor: ColorManager.primaryColor,
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: getRegularStyle(color: ColorManager.textColorVariant),
              hintText: addressHint,
            ),
            inputFormatters: [
              NoLeadingSpaceFormatter(),
              FilteringTextInputFormatter.deny(
                RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
              ),
            ],
          ),
        ],
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
          onPressed: () {
            Get.back();
            phoneNumberTextController.clear();
            addressTextController.clear();
          },
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
            if (phoneNumberTextController.text.length < 9 ||
                !phoneNumberTextController.text.startsWith('09')) {
              Helper.showQuickToast(
                AppStrings.validPhoneNumber.tr,
              );
            } else {
              Get.back();
              updateProfile(
                phoneNumberTextController.text.isEmpty
                    ? phoneNumberHint
                    : phoneNumberTextController.text,
                addressTextController.text.isEmpty
                    ? addressHint
                    : addressTextController.text,
              );
              phoneNumberTextController.clear();
              addressTextController.clear();
            }
          },
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
