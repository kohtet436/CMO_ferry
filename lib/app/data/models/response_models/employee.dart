// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

import 'package:cmo_ferry/app/core/helper/app_enum.dart';

import '../../../core/helper/helper.dart';
import 'ferry_stop.dart';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String id;
  String employeeNumber;
  String department;
  String name;
  String email;
  String nrc;
  String phoneNumber;
  DateTime dateOfBirth;
  String? photoPath;
  String gender;
  String address;
  String? ferryStopId;
  FerryStatus ferryStatus;
  String? baseRouteId;
  FerryStop? ferryStop;

  Employee({
    required this.id,
    required this.employeeNumber,
    required this.department,
    required this.name,
    required this.email,
    required this.nrc,
    required this.phoneNumber,
    required this.dateOfBirth,
    this.photoPath,
    required this.gender,
    required this.address,
    this.ferryStopId,
    required this.ferryStatus,
    this.baseRouteId,
    this.ferryStop,
  });

  factory Employee.fromJson(Map<String?, dynamic> json) => Employee(
        id: json["id"],
        employeeNumber: json["employeeNumber"],
        department: json["department"],
        name: json["name"],
        email: json["email"],
        nrc: json["nrc"],
        phoneNumber: json["phoneNumber"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        photoPath: json["photoPath"],
        gender: json["gender"],
        address: json["address"],
        ferryStopId: json["ferryStopId"],
        ferryStatus: _setFerryStatus(json["ferryStatus"]),
        baseRouteId: json["baseRouteId"],
        ferryStop: json['ferryStop'] != null
            ? FerryStop.fromJson(json['ferryStop'])
            : null,
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "employeeNumber": employeeNumber,
        "department": department,
        "name": name,
        "email": email,
        "nrc": nrc,
        "phoneNumber": phoneNumber,
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "photoPath": photoPath,
        "gender": gender,
        "address": address,
        "ferryStopId": ferryStopId,
        "ferryStatus": _getStatus(ferryStatus),
        "baseRouteId": baseRouteId,
        "ferryStop": ferryStop?.toJson(),
      };

  static FerryStatus _setFerryStatus(String ferryStatus) {
    Helper.console("Ferry Status before setting is ==> $ferryStatus");
    String uppercase = ferryStatus.toUpperCase();
    Helper.console("Ferry Status after setting is ==> $uppercase");
    switch (uppercase) {
      case "NONE":
        return FerryStatus.NONE;
      case "SUBMITTED":
        return FerryStatus.SUBMITTED;
      case "PENDING":
        return FerryStatus.PENDING;
      case "RIDING":
        return FerryStatus.RIDING;
      default:
        return FerryStatus.NONE;
    }
  }

  String _getStatus(FerryStatus ferryStatus) {
    switch(ferryStatus){
      case FerryStatus.NONE:
        Helper.console("Ferry Status after setting is ==> None.");
        return "None";
      case FerryStatus.SUBMITTED:
        Helper.console("Ferry Status after setting is ==> Submitted.");
        return "Submitted";
      case FerryStatus.PENDING:
        Helper.console("Ferry Status after setting is ==> Pending.");
        return "Pending";
      case FerryStatus.RIDING:
        Helper.console("Ferry Status after setting is ==> Riding.");
        return "Riding";
    }
  }
}
