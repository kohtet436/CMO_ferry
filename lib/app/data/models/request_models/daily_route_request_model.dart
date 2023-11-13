import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';

class DailyRouteRequestModel {
  String baseRouteId;
  String date;
  DailyRouteType routeType;

  DailyRouteRequestModel({
    required this.baseRouteId,
    required this.date,
    required this.routeType,
  });

  factory DailyRouteRequestModel.fromJson(Map<String, dynamic> json) =>
      DailyRouteRequestModel(
        baseRouteId: json["baseRouteId"],
        date: json["date"],
        routeType: MethodUtil.stringToRouteType(json["routeType"]),
      );

  Map<String, dynamic> toJson() {
    return {
      "baseRouteId": baseRouteId,
      "date": date,
      "routeType": MethodUtil.routeTypeToString(routeType),
    };
  }
}
