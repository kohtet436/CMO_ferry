// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../../../core/helper/helper.dart';
// import '../../../core/values/font_manager.dart';
// import '../../../core/util/widget_util.dart';
// import '../../../core/values/assets_manager.dart';
// import '../../../core/values/styles_manager.dart';
// import '../../../core/values/values_manager.dart';
// import '../../../core/values/color_manager.dart';
// import '../../../core/values/strings_manager.dart';
// import '../controllers/log_in_page_controller.dart';

// class LogInPageView extends StatelessWidget {
//   final LogInPageController controller = Get.put(LogInPageController());

//   LogInPageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     FocusNode textSecondFocusNode = FocusNode();
//     return Obx(
//       () => Scaffold(
//         body: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 300,
//               decoration: BoxDecoration(
//                 color: ColorManager.primaryColor,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(AppRadius.r30),
//                   bottomRight: Radius.circular(AppRadius.r30),
//                 ),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Hero(
//                     tag: 'AppLogo',
//                     child: Image.asset(
//                       ImageAssets.loginLogo,
//                       height: AppSize.s200,
//                       width: AppSize.s200,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: WidgetUtil.defaultHorizontalPadding(),
//                   child: ListView(
//                     physics: const BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     children: [
//                       RegularText(
//                         text: AppStrings.greetings,
//                         textStyle: getSemiBoldStyle(
//                           color: ColorManager.primaryColor,
//                           fontSize: FontSize.s30,
//                         ),
//                       ),
//                       WidgetUtil.spaceVertical(AppPadding.defaultPadding),
//                       _buildTextField(
//                         hintText: AppStrings.employeeId,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(8),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                         keyboardType: TextInputType.number,
//                         maxLength: 8,
//                         validator: (input) {
//                           if (input != null && input.isNotEmpty && input.length >= 8) {
//                             return null;
//                           } else {
//                             return AppStrings.driverIdErrorText.tr;
//                           }
//                         },
//                         prefixIcon: Icon(
//                           Icons.person,
//                           color: ColorManager.lightGrey,
//                         ),
//                         controller: controller.userIdTextController.value,
//                         onSubmitted: (String value) {
//                           FocusScope.of(context).requestFocus(textSecondFocusNode);
//                         },
//                       ),
//                       WidgetUtil.spaceVertical(AppPadding.defaultPadding),
//                       _buildTextField(
//                         focusNode: textSecondFocusNode,
//                         hintText: AppStrings.password,
//                         obscureText: controller.isPasswordHide.value,
//                         validator: (input) {
//                           if (input != null && input.isNotEmpty && input.length >= 8) {
//                             return null;
//                           } else {
//                             return AppStrings.passwordErrorText.tr;
//                           }
//                         },
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           color: ColorManager.lightGrey,
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             controller.isPasswordHide(!controller.isPasswordHide.value);
//                           },
//                           icon: FaIcon(
//                             controller.isPasswordHide.value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
//                             size: AppSize.s18,
//                             color: ColorManager.secondaryColor,
//                           ),
//                         ),
//                         controller: controller.passwordTextController.value,
//                         // onSubmitted: (String value) => handleLogIn(),
//                         onSubmitted: (String value) {},
//                       ),
//                       WidgetUtil.spaceVertical(AppPadding.defaultPadding),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               AppRadius.defaultRadius,
//                             ),
//                           ),
//                           fixedSize: const Size.fromHeight(AppSize.s56),
//                           backgroundColor: ColorManager.primaryColor,
//                         ),
//                         onPressed: () {
//                           if (controller.userIdTextController.value.text.isEmpty || controller.passwordTextController.value.text.isEmpty) {
//                             Helper.showQuickToast(AppStrings.dataBlankErrorText.tr);
//                           } else {
//                             // showDialog(
//                             //   context: context,
//                             //   barrierDismissible: false,
//                             //   builder: (_) {
//                             //     return Center(
//                             //       child: Container(
//                             //         width: AppSize.s100,
//                             //         height: AppSize.s100,
//                             //         decoration: const ShapeDecoration(
//                             //           color: Colors.white,
//                             //           shape: RoundedRectangleBorder(
//                             //             borderRadius: BorderRadius.all(
//                             //               Radius.circular(AppRadius.r15),
//                             //             ),
//                             //           ),
//                             //         ),
//                             //         child: Center(
//                             //           child: CircularProgressIndicator(
//                             //             valueColor: AlwaysStoppedAnimation<Color>(ColorManager.secondaryColor),
//                             //           ),
//                             //         ),
//                             //       ),
//                             //     );
//                             //   },
//                             // );
//                             controller.logIn(
//                               controller.userIdTextController.value.text,
//                               controller.passwordTextController.value.text,
//                             );
//                           }
//                         },
//                         child: const RegularText(
//                           text: AppStrings.login,
//                         ),
//                       ),
//                       Padding(
//                         padding: WidgetUtil.defaultAllPadding(),
//                         child: Align(
//                           alignment: Alignment.bottomRight,
//                           child: RegularText(
//                             textAlign: TextAlign.center,
//                             text: 'Version: ${controller.appVersion.value}',
//                             textStyle: const TextStyle(
//                               fontWeight: FontWeightManager.semiBold,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                       ),
//                       WidgetUtil.spaceVertical(AppPadding.defaultPadding),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String hintText,
//     List<TextInputFormatter>? inputFormatters,
//     TextInputType? keyboardType,
//     int? maxLength,
//     FocusNode? focusNode,
//     bool obscureText = false,
//     String? Function(String?)? validator,
//     Icon? prefixIcon,
//     IconButton? suffixIcon,
//     required TextEditingController controller,
//     required void Function(String)? onSubmitted,
//   }) {
//     return TextFormField(
//       style: getRegularStyle(color: ColorManager.black),
//       focusNode: focusNode,
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       decoration: InputDecoration(
//         suffixIcon: suffixIcon,
//         filled: true,
//         fillColor: ColorManager.textFieldGrey,
//         counterText: '',
//         prefixIcon: prefixIcon,
//         focusColor: ColorManager.secondaryColor,
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: ColorManager.textFieldGrey,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(AppRadius.defaultRadius),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: ColorManager.textFieldGrey,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(
//             AppRadius.defaultRadius,
//           ),
//         ),
//         hintText: hintText.tr,
//         hintStyle: getRegularStyle(
//           color: ColorManager.lightGrey,
//         ),
//       ),
//       inputFormatters: inputFormatters,
//       obscureText: obscureText,
//       keyboardType: keyboardType,
//       maxLength: maxLength,
//       cursorColor: ColorManager.secondaryColor,
//       controller: controller,
//       onFieldSubmitted: (String value) {
//         return onSubmitted!(value);
//       },
//     );
//   }
// }
import 'package:cmo_ferry/app/core/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../core/widget/login_textfield.dart';
import '../../../routes/app_pages.dart';
import '../controllers/log_in_page_controller.dart';

import '../../../core/util/widget_util.dart';
import '../../../core/values/assets_manager.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/font_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/values/values_manager.dart';
import '../../../routes/app_pages.dart';
import '../controllers/log_in_page_controller.dart';

class LoginPageView extends GetView<LogInPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppRadius.r30),
                bottomRight: Radius.circular(AppRadius.r30),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'AppLogo',
                  child: Image.asset(
                    ImageAssets.loginLogo,
                    height: AppSize.s200,
                    width: AppSize.s200,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: WidgetUtil.defaultAllPadding(),
                child: Form(
                  // key: controller.key,
                  child: 
                  // Obx(
                    // () => 
                    ListView(
                      children: [
                        Text(
                          AppStrings.welcome,
                          style: getBoldStyle(
                              color: ColorManager.primaryColor,
                              fontSize: FontSize.s30),
                        ),
                        WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                        LoginTextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8)
                          ],
                          controller: controller.userIdTextController,
                          validator: (val) =>
                              val!.isEmpty == true && val.length < 8
                                  ? "Required"
                                  : null,
                          onEditingComplete: () {
                            // controller.textSecondFocusNode.requestFocus();
                          },
                          icon: Icons.person,
                          // focusNode: controller.textFirstFocusNode,
                          hintText: AppStrings.employeeId,
                          keyboardType: TextInputType.number,
                        ),
                        WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                        LoginTextField(
                          // focusNode:controller.textSecondFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          // suffixIcon: IconButton(
                              // onPressed: () {
                                // controller.changeObscureText();
                              // },

                              // icon: FaIcon(controller.obscureText
                              //     ? FontAwesomeIcons.eye
                              //     : FontAwesomeIcons.eyeSlash),color: ColorManager.primaryColor,),
                          // obscureText:
                          //     controller.obscureText,
                          // validator: (value) =>
                          //     value?.isEmpty == true ? "Required" : null,
                          onEditingComplete: () {
                            // controller.textSecondFocusNode.unfocus();
                            // controller.key.currentState?.validate() == true
                                // ? controller.logIn()
                                // : null;
                                // controller.logIn(controller.userIdTextController
                                // .text
                                // , controller.passwordTextController.text);
                          },
                          icon: Icons.lock,
                          hintText: AppStrings.password,
                          controller: controller.passwordTextController, validator: (String? e) {  },
                        ),
                        WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10)),
                              backgroundColor: ColorManager.primaryColor,
                            ),
                            onPressed: () {
// controller.textSecondFocusNode.unfocus();
                              // if (controller.key.currentState?.validate() ==
                                  // true) {
                                controller.logIn();
                              },
                            // },
                            child:
                            //  controller.isLoading
                            //     ? const Center(
                            //         child: CircularProgressIndicator(
                            //           color: Colors.white,
                            //           strokeWidth: 2,
                            //         ),
                            //       )
                                // : 
                                Text(
                                    AppStrings.login,
                                    style: getRegularStyle(
                                        color: ColorManager.white),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // ),
        ],
      ),
    );
  }
}