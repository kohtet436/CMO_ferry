import 'package:cmo_ferry/app/core/helper/app_enum.dart';

class FerryRequestResponse {
  String id;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMyanmarName;
  DateTime requestDate;
  FerryRequestType requestType;
  String? rejectReason;
  FerryRequestStatus ferryRequestStatus;

  FerryRequestResponse({
    required this.id,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMyanmarName,
    required this.requestDate,
    required this.requestType,
    this.rejectReason,
    required this.ferryRequestStatus,
  });

  factory FerryRequestResponse.fromJson(Map<String, dynamic> json) =>
      FerryRequestResponse(
        id: json['id'],
        ferryStopId: json['ferryStopId'],
        ferryStopName: json['ferryStopName'],
        ferryStopMyanmarName: json['ferryStopMyanmarName'],
        requestDate: DateTime.parse(json['requestDate']),
        requestType: _setFerryRequestType(json['requestType']),
        rejectReason: json['rejectReason'],
        ferryRequestStatus: _setFerryRequestStatus(json['ferryRequestStatus']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMyanmarName": ferryStopMyanmarName,
        "requestDate": requestDate.toIso8601String(),
        "requestType": _getFerryRequestType(requestType),
        "rejectReason": rejectReason,
        "ferryRequestStatus": _getFerryRequestStatus(ferryRequestStatus),
      };

  static FerryRequestStatus _setFerryRequestStatus(String ferryRequestType) {
    String uppercase = ferryRequestType.toUpperCase();
    switch (uppercase) {
      case "PENDING":
        return FerryRequestStatus.PENDING;
      case "APPROVED":
        return FerryRequestStatus.APPROVED;
      case "REJECTED":
        return FerryRequestStatus.REJECTED;
      default:
        return FerryRequestStatus.PENDING;
    }
  }

  String _getFerryRequestStatus(FerryRequestStatus ferryRequestStatus) {
    switch (ferryRequestStatus) {
      case FerryRequestStatus.PENDING:
        return "Pending";
      case FerryRequestStatus.APPROVED:
        return "Approved";
      case FerryRequestStatus.REJECTED:
        return "Rejected";
    }
  }

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
