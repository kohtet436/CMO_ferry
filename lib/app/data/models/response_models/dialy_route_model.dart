// To parse this JSON data, do
//
//     final dailyRouteModel = dailyRouteModelFromJson(jsonString);

import 'dart:convert';
import '../../../core/helper/app_enum.dart';
import '../../../core/util/method_util.dart';

DailyRouteModel dailyRouteModelFromJson(String str) =>
    DailyRouteModel.fromJson(json.decode(str));

String dailyRouteModelToJson(DailyRouteModel data) =>
    json.encode(data.toJson());

class DailyRouteModel {
  String id;
  String baseRouteId;
  String baseRouteName;
  DateTime date;
  DailyRouteType routeType;
  List<FerryStop> ferryStops;
  String assignedVehicleId;
  Vehicle vehicle;
  // DateTime
  DateTime startTime;
  DateTime endTime;
  bool isFail;
  String lastFerryStopId;
  dynamic lastFerryStop;

  DailyRouteModel({
    required this.id,
    required this.baseRouteId,
    required this.baseRouteName,
    required this.date,
    required this.routeType,
    required this.ferryStops,
    required this.assignedVehicleId,
    required this.vehicle,
    required this.startTime,
    required this.endTime,
    required this.isFail,
    required this.lastFerryStopId,
    this.lastFerryStop,
  });

  factory DailyRouteModel.fromJson(Map<String, dynamic> json) =>
      DailyRouteModel(
        id: json["id"],
        baseRouteId: json["baseRouteId"],
        baseRouteName: json["baseRouteName"],
        date: DateTime.parse(json["date"]),
        // routeType: json["routeType"],
        routeType: MethodUtil.stringToRouteType(json["routeType"]),
        ferryStops: List<FerryStop>.from(
            json["ferryStops"].map((x) => FerryStop.fromJson(x))),
        assignedVehicleId: json["assignedVehicleId"],
        vehicle: Vehicle.fromJson(json["vehicle"]),
        startTime: DateTime.parse(json['startTime']),
        // DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["endTime"]),
        isFail: json["isFail"],
        lastFerryStopId: json["lastFerryStopId"],
        lastFerryStop: json["lastFerryStop"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseRouteId": baseRouteId,
        "baseRouteName": baseRouteName,
        "date": date.toIso8601String(),
        "routeType": MethodUtil.routeTypeToString(routeType),
        "ferryStops": List<dynamic>.from(ferryStops.map((x) => x.toJson())),
        "assignedVehicleId": assignedVehicleId,
        "vehicle": vehicle.toJson(),
        // "startTime": startTime,
        'startTime': startTime.toIso8601String(),
        "endTime": endTime.toIso8601String(),
        "isFail": isFail,
        "lastFerryStopId": lastFerryStopId,
        "lastFerryStop": lastFerryStop,
      };
}

class FerryStop {
  String id;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;
  DateTime checkInTime;
  DateTime checkOutTime;
  String roadName;
  String roadMmName;
  String townshipName;
  String townshipMmName;
  int sequenceNumber;
  bool isCurrent;
  List<Employee> employees;

  FerryStop(
      {required this.id,
      required this.ferryStopId,
      required this.ferryStopName,
      required this.ferryStopMmName,
      required this.checkInTime,
      required this.checkOutTime,
      required this.sequenceNumber,
      required this.isCurrent,
      required this.employees,
      required this.roadMmName,
      required this.roadName,
      required this.townshipMmName,
      required this.townshipName});

  factory FerryStop.fromJson(Map<String, dynamic> json) => FerryStop(
        id: json["id"],
        roadMmName: json['roadMmName'],
        roadName: json['roadName'],
        townshipMmName: json['townshipMmName'],
        townshipName: json['townshipName'],
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
        checkInTime: DateTime.parse(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        sequenceNumber: json["sequenceNumber"],
        isCurrent: json["isCurrent"],
        employees: List<Employee>.from(
            json["employees"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
       "roadMmName": roadMmName,
       "roadName":roadName,
      "townshipMmName": townshipMmName,
      "townshipName":townshipName,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
        "checkInTime": checkInTime.toIso8601String(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "sequenceNumber": sequenceNumber,
        "isCurrent": isCurrent,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };
}

class Employee {
  String employeeId;
  String employeeName;
  String dailyRouteId;
  String status;
  String ferryStopDailyRouteId;
  DateTime checkInTime;
  DateTime checkOutTime;
  dynamic photoPath;
  String ferryStopId;
  String ferryStopName;
  String ferryStopMmName;

  Employee({
    required this.employeeId,
    required this.employeeName,
    required this.dailyRouteId,
    required this.status,
    required this.ferryStopDailyRouteId,
    required this.checkInTime,
    required this.checkOutTime,
    this.photoPath,
    required this.ferryStopId,
    required this.ferryStopName,
    required this.ferryStopMmName,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        dailyRouteId: json["dailyRouteId"],
        status: json["status"],
        ferryStopDailyRouteId: json["ferryStopDailyRouteId"],
        checkInTime: DateTime.parse(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        photoPath: json["photoPath"],
        ferryStopId: json["ferryStopId"],
        ferryStopName: json["ferryStopName"],
        ferryStopMmName: json["ferryStopMmName"],
      );

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeName": employeeName,
        "dailyRouteId": dailyRouteId,
        "status": status,
        "ferryStopDailyRouteId": ferryStopDailyRouteId,
        "checkInTime": checkInTime.toIso8601String(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "photoPath": photoPath,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
      };
}

class Vehicle {
  String id;
  String licensePlate;
  DateTime plateExpiredDate;
  dynamic photoPath;
  VehicleType vehicleType;
  String color;
  dynamic vehicleEmployee;
  String vehicleStatus;

  Vehicle({
    required this.id,
    required this.licensePlate,
    required this.plateExpiredDate,
    this.photoPath,
    required this.vehicleType,
    required this.color,
    this.vehicleEmployee,
    required this.vehicleStatus,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        id: json["id"],
        licensePlate: json["licensePlate"],
        plateExpiredDate: DateTime.parse(json["plateExpiredDate"]),
        photoPath: json["photoPath"],
        vehicleType: VehicleType.fromJson(json["vehicleType"]),
        color: json["color"],
        vehicleEmployee: json["vehicleEmployee"],
        vehicleStatus: json["vehicleStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "licensePlate": licensePlate,
        "plateExpiredDate": plateExpiredDate.toIso8601String(),
        "photoPath": photoPath,
        "vehicleType": vehicleType.toJson(),
        "color": color,
        "vehicleEmployee": vehicleEmployee,
        "vehicleStatus": vehicleStatus,
      };
}

class VehicleType {
  String id;
  String model;
  int numberOfSeats;

  VehicleType({
    required this.id,
    required this.model,
    required this.numberOfSeats,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        id: json["id"],
        model: json["model"],
        numberOfSeats: json["numberOfSeats"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model": model,
        "numberOfSeats": numberOfSeats,
      };
}
