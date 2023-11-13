import 'package:cmo_ferry/app/core/values/strings_manager.dart';
import 'package:cmo_ferry/app/core/values/styles_manager.dart';
import 'package:flutter/material.dart';
import '../../data/models/response_models/base_routes_model.dart';
import '../util/widget_util.dart';
import '../values/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({
    super.key,
    required this.vehicle,
  });

  final Vehicle? vehicle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: WidgetUtil.defaultAllPaddingWithoutBottom(),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.r20)),
        child: Padding(
          padding: WidgetUtil.defaultAllPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText(
               text: AppStrings.vehicleInformation,
                textStyle: getBoldStyle(color: Colors.black),
              ),
              WidgetUtil.spaceVertical(AppPadding.defaultPadding),
              Column(
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.shapes,
                        size: AppPadding.p16,
                      ),
                      WidgetUtil.spaceHorizontal(16),
                      Text(
                        vehicle?.vehicleType?.model.toString()??"",
                        style: getRegularStyle(color: Colors.black),
                      )
                    ],
                  ),
                  WidgetUtil.spaceVertical(AppPadding.p8),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.palette,
                        size: AppPadding.p16,
                      ),
                      WidgetUtil.spaceHorizontal(16),
                      Text(
                        vehicle?.color.toString()??"",
                        style: getRegularStyle(color: Colors.black),
                      )
                    ],
                  ),
                  WidgetUtil.spaceVertical(AppPadding.p8),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.users,
                        size: AppPadding.p16,
                      ),
                      WidgetUtil.spaceHorizontal(16),
                      Text(
                        vehicle?.vehicleType?.numberOfSeats.toString()??"",
                        style: getRegularStyle(color: Colors.black),
                      )
                    ],
                  ),
                  WidgetUtil.spaceVertical(AppPadding.p8),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.bus,
                        size: AppPadding.p16,
                      ),
                      WidgetUtil.spaceHorizontal(16),
                      Text(
                        vehicle?.licensePlate.toString()??"",
                        style: getRegularStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
