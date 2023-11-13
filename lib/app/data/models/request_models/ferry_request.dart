import 'package:cmo_ferry/app/core/helper/app_enum.dart';

class FerryRequest {
  final FerryRequestType requestType;
  final String ferryStopId;
  final String? reason;
  final DateTime requestDate;

  FerryRequest({
    required this.requestType,
    required this.ferryStopId,
    this.reason,
    required this.requestDate,
  });

  factory FerryRequest.fromJson(Map<String, dynamic> json) => FerryRequest(
        requestType: _setFerryRequestType(json["requestType"]),
        ferryStopId: json['ferryStopId'],
        reason: json['reason'],
        requestDate: DateTime.parse(json['requestDate']),
      );

  Map<String, dynamic> toJson() => {
        "requestType": _getFerryRequestType(requestType),
        "ferryStopId": ferryStopId,
        "reason": reason ?? " ",
        "requestDate": requestDate.toIso8601String(),
      };

  static FerryRequestType _setFerryRequestType(String ferryRequestType) {
    String uppercase = ferryRequestType.toUpperCase();
    switch (uppercase) {
      case "NEW":
        return FerryRequestType.NEW;
      case "CHANGE":
        return FerryRequestType.CHANGE;
      case "CANCEL":
        return FerryRequestType.CANCEL;
      default:
        return FerryRequestType.NEW;
    }
  }

  String _getFerryRequestType(FerryRequestType ferryRequestType) {
    switch (ferryRequestType) {
      case FerryRequestType.NEW:
        return "New";
      case FerryRequestType.CHANGE:
        return "Change";
      case FerryRequestType.CANCEL:
        return "Cancel";
    }
  }
}
