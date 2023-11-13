import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo_ferry/app/core/values/assets_manager.dart';
import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import '../../../core/util/widget_util.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/values/styles_manager.dart';
import '../../../core/widget/base_route_ferry_stop_list.dart';
import '../../../core/widget/driver_info_card.dart';
import '../../../core/widget/vehicle_info_card.dart';
import '../controllers/base_route_detail_page_controller.dart';

class BaseRouteDetailPageView extends GetView<BaseRouteDetailPageController> {
  const BaseRouteDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading == true
            ?  Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              )
            : controller.baseRoute.value==null?const Center(child: FaIcon(Icons.error)): CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: RegularText(
                      text: AppStrings.informationPageLabel,
                      textStyle: getBoldStyle(
                        color: ColorManager.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    collapsedHeight: AppSize.appBarHeight,
                    automaticallyImplyLeading: false,
                    backgroundColor: ColorManager.primaryColor,
                    pinned: true,
                    expandedHeight: 240,
                    // flexibleSpace: FlexibleSpaceBar(
                    //   expandedTitleScale: 1,
                    //   background: OctoImage(
                    //     fit: BoxFit.cover,
                    //     placeholderBuilder:
                    //         OctoPlaceholder.circularProgressIndicator(),
                    //     errorBuilder: (context, error, stackTrace) =>
                    //         Image.asset(
                    //       ImageAssets.appLogo,
                    //     ),
                    //     image: CachedNetworkImageProvider(
                    //       controller.baseRoute.value!.vehicle.photoPath
                    //           .toString(),
                    //     ),
                    //   ),
                    ),
                  // ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    DriverInfoCard(
                        driver: controller
                            .baseRoute.value?.vehicle?.vehicleEmployee),
                    VehicleInfoCard(
                        vehicle: controller.baseRoute.value?.vehicle),
                    WidgetUtil.spaceVertical(AppPadding.defaultPadding),
                    BaseRouteFerryStopListCard(
                      ferryStops: controller.baseRoute.value?.ferryStops,
                    )
                  ])),
                ],
              ),
      ),
    );
  }
}
