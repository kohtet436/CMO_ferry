import 'package:cmo_ferry/app/data/models/response_models/base_routes_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../util/widget_util.dart';
import '../values/strings_manager.dart';
import '../values/styles_manager.dart';
import '../values/values_manager.dart';

class BaseRouteFerryStopListCard extends StatelessWidget {
  List<FerryStopElement>? ferryStops;
BaseRouteFerryStopListCard({ this.ferryStops, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetUtil.defaultAllPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText(
           text: AppStrings.busStopList,
            textStyle: getSemiBoldStyle(color: Colors.black),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Icon(
                                  MdiIcons.bus,
                                  size: AppSize.s47,
                                  ),
                    // const FaIcon(
                    //   FontAwesomeIcons.bus,
                    //   size: AppSize.s32,
                    // ),
                    Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(AppRadius.r10)),
                      child: Container(
                        padding:
                        const EdgeInsets.only(left: AppPadding.p20),
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: MediaQuery.of(context).size.height / 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           RegularText(text:
                          GetStorage().read('isMM')?
                            
                            "${ferryStops?[index].ferryStop?.myanmarName.toString()}"
                               :
                                ferryStops?[index].ferryStop?.name??"",
                                textStyle:
                                getSemiBoldStyle(color: Colors.black))
                                
                                ,
                            RegularText(text:GetStorage().read('isMM')?
                              "${ferryStops?[index].ferryStop?.road?.myanmarName} , ${ferryStops?[index].ferryStop?.township?.myanmarName}":
                              "${ferryStops?[index].ferryStop?.road?.name} , ${ferryStops?[index].ferryStop?.township?.name}",

                              textStyle: getRegularStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
              separatorBuilder: (context, index) => 
 Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: AppPadding.p16),
                                  child: SizedBox(
                                      height: AppSize.s50,
                                      child: VerticalDivider(
                                          thickness: 1, color: Colors.black)),
                                )
                              ]),

            
              itemCount: ferryStops?.length??0),
        ],
      ),
    );}}