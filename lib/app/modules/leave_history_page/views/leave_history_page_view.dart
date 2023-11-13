import 'package:cmo_ferry/app/core/util/widget_util.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:cmo_ferry/app/core/widget/ferry_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/strings_manager.dart';
import '../../../routes/app_pages.dart';
import '../controllers/leave_history_page_controller.dart';

class LeaveHistoryPageView extends GetView<LeaveHistoryPageController> {
  const LeaveHistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.secondaryColor,
        child: const FaIcon(FontAwesomeIcons.plus),
        onPressed: () {
          Get.toNamed(Routes.LEAVE_PAGE);
        },
      ),
      appBar: FerryAppBar(title: AppStrings.leavePageLabel),
      body: Obx(()=>
      controller.isLoading?Center(child: CircularProgressIndicator(color: ColorManager.primaryColor,),):
      controller.leaveHistoryResponse.value==null?const Center(child: Icon(Icons.error),):
      controller.leaveHistoryResponse.value!.isEmpty? Center(child: Text("Empyt Leaves",style: getSemiBoldStyle(color: Colors.black),),):
       Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: ListView.builder(
            itemCount: controller.leaveHistoryResponse.value?.length,
            itemBuilder: (BuildContext context, int index) =>
            
            
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.defaultRadius)),
                    elevation: AppElevation.doubleCardElevation,
                    child: Padding(
                      padding: WidgetUtil.defaultAllPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText(
                              text: 
                              DateFormat('yyyy-MM-dd').format( DateTime.parse(

                                 controller.leaveHistoryResponse.value?[index].date.toString()??""
                              ))
                             ,
                              textStyle: getSemiBoldStyle(color: Colors.black)
                              //  TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                              ),
                          WidgetUtil.spaceVertical(AppPadding.p8),
                          Row(
                            children: [
                              RegularText(
                                  text: "Type : ",
                                  textStyle: getLightStyle(color: Colors.grey)),
                              RegularText(
                                  text:controller.leaveHistoryResponse.value?[index].routeType.toString()??"",
                                  textStyle: getMediumStyle(color: Colors.black)),
                            ],
                          ),
                          WidgetUtil.spaceVertical(AppPadding.p8),
      
                          RegularText(
                              text: AppStrings.leaveReason,
                              textStyle: getSemiBoldStyle(color: Colors.black)),
                          WidgetUtil.spaceVertical(AppPadding.p8),
      
                          RegularText(
                            text:
                                controller.leaveHistoryResponse.value?[index].reason.toString()??"",
                            textStyle: getRegularStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
              WidgetUtil.spaceVertical(16),
                  
                ],
              ),
              // WidgetUtil.spaceVertical(16),
              // Card(
              //   elevation: AppElevation.doubleCardElevation,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //        const Text("January 2nd 2023",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              //        const SizedBox(height: 5,),
              //         Row(children:const  [Text("Type : ",style: TextStyle(fontSize: 17,color: Colors.grey),),Text("Morning",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)],),
              //          const SizedBox(height: 5,),
      
              //         const Text("Reason Of Leave",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              //        const SizedBox(height: 5,),
      
              //        const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",style: TextStyle(fontSize: 17),),
      
              //       ],
              //     ),
              //   ),
              // )
            
          ),
        ),
      ),
    );
  }
}
