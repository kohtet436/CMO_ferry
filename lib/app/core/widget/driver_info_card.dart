import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmo_ferry/app/core/values/color_manager.dart';
import 'package:cmo_ferry/app/core/values/values_manager.dart';
import 'package:flutter/material.dart';
import '../../data/models/response_models/base_routes_model.dart';
import '../util/widget_util.dart';
import 'package:octo_image/octo_image.dart';

class DriverInfoCard extends StatelessWidget {
  final VehicleEmployee? driver;

  const DriverInfoCard({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppRadius.defaultProfileCardRadius)),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OctoImage(
              width: AppSize.s100,
              height: AppSize.s100,
              fit: BoxFit.cover,
              imageBuilder: OctoImageTransformer.circleAvatar(),
              image: CachedNetworkImageProvider(
                  driver?.photoPath.toString() ?? ""),
              placeholderBuilder: (context) => Center(
                  child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              )),
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RegularText(text: driver?.name ?? ""),
                WidgetUtil.spaceVertical(AppPadding.p8),
                RegularText(text: driver?.phoneNumber ?? ""),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
