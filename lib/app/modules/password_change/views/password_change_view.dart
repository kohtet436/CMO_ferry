import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/widget/change_password_textfield.dart';
import '../controllers/password_change_controller.dart';

class PasswordChangePageView extends GetView<PasswordChangeController> {
  const PasswordChangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorManager.primaryColor,
        title: const RegularText(
          text: AppStrings.passwordChangeView,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Obx(
          ()=> Form(
            key: controller.key,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RegularText(
                          text: AppStrings.currentPassword,
                          textStyle: getRegularStyle(color: Colors.black)),
                      WidgetUtil.spaceVertical(11),
                      ChangePasswordTextField(
                        controller: controller.currentController,
                        validator: (_) => _?.isEmpty == true ? "Requried" : null,
                        onEditingComplete: () {
                          controller.newFocusNode.requestFocus();
                        },
                        focusNode: controller.currentFocusNode,
                        hint: AppStrings.currentPasswordHints.tr,
                      ),
                      WidgetUtil.spaceVertical(40),
                      RegularText(
                        text: AppStrings.newPassword,
                        textStyle: getRegularStyle(color: Colors.black),
                      ),
                      WidgetUtil.spaceVertical(11),
                      ChangePasswordTextField(
                        controller: controller.newPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field is required.";
                          }
                          String pattern =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'Password must be at least 8 characters,include an \nuppercase letter, number and symbol.';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          controller.retypeFocusNode.requestFocus();
                        },
                        focusNode: controller.newFocusNode,
                        hint: AppStrings.newPasswordHint.tr,
                      ),
                      WidgetUtil.spaceVertical(40),
                      RegularText(
                          text: AppStrings.retypeNewPassword,
                          textStyle: getRegularStyle(color: Colors.black)),
                      WidgetUtil.spaceVertical(11),
                      ChangePasswordTextField(
                        controller: controller.retypePasswordController,
                        validator: (a) {
                           
                          if (a == null || a.isEmpty) {
                            return "Field is required.";
                          }
        
                          if (controller.newPasswordController.text != a) {
                            return "password does not match";
                          } else {
                            return null;
                          }
                        },
                        focusNode: controller.retypeFocusNode,
                        
                        hint: AppStrings.newPasswordHintAgain.tr,
                      ),
                      WidgetUtil.spaceVertical(40),
                      SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorManager.primaryColor)),
                              onPressed: () {
                               controller.retypeFocusNode.unfocus();
                                
                                if (controller.key.currentState?.validate() ==
                                    true ){
 if(controller.currentController.text==controller.newPasswordController.text){
                                  Helper.showQuickToast(
          "Must Not Same Old Password And New Password",
        );}else{

                                controller.changePassword();}
                                
                                }
                              },
                              child: controller.isLoading?const Center(child: CircularProgressIndicator(color: Colors.white,),):const  RegularText(
                                text: AppStrings.submit,
                                textStyle: TextStyle(
                                    fontSize: AppSize.s18, color: Colors.white),
                              )))
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
