import 'dart:convert';
// To parse this JSON data, do
//
//     final baseRouteModel = baseRouteModelFromJson(jsonString);

import 'dart:convert';

BaseRouteModel baseRouteModelFromJson(String str) => BaseRouteModel.fromJson(json.decode(str));

String baseRouteModelToJson(BaseRouteModel data) => json.encode(data.toJson());

class BaseRouteModel {
    String? id;
    String? baseRouteName;
    List<FerryStopElement>? ferryStops;
    String? vehicleId;
    Vehicle? vehicle;
    String? vehicleTypeId;
    VehicleType? vehicleType;

    BaseRouteModel({
         this.id,
         this.baseRouteName,
         this.ferryStops,
         this.vehicleId,
         this.vehicle,
         this.vehicleTypeId,
         this.vehicleType,
    });

    factory BaseRouteModel.fromJson(Map<String, dynamic> json) => BaseRouteModel(
        id: json["id"]??"",
        baseRouteName: json["baseRouteName"]??"",
        ferryStops: List<FerryStopElement>.from(json["ferryStops"]?.map((x) => FerryStopElement?.fromJson(x))),
        vehicleId: json["vehicleId"]??"",
        vehicle: Vehicle?.fromJson(json["vehicle"]),
        vehicleTypeId: json["vehicleTypeId"]??"",
        vehicleType: VehicleType?.fromJson(json["vehicleType"]??""),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "baseRouteName": baseRouteName,
        "ferryStops": List<dynamic>.from(ferryStops!.map((x) => x.toJson())),
        "vehicleId": vehicleId,
        "vehicle": vehicle?.toJson(),
        "vehicleTypeId": vehicleTypeId,
        "vehicleType": vehicleType?.toJson(),
    };
}

class FerryStopElement {
    String? id;
    String? ferryStopId;
    FerryStopFerryStop? ferryStop;
    int? sequenceNumber;
    List<BaseRouteEmployee>? employees;

    FerryStopElement({
         this.id,
         this.ferryStopId,
         this.ferryStop,
         this.sequenceNumber,
         this.employees,
    });

    factory FerryStopElement.fromJson(Map<String, dynamic> json) => FerryStopElement(
        id: json["id"]??"",
        ferryStopId: json["ferryStopId"]??"",
        ferryStop: FerryStopFerryStop?.fromJson(json["ferryStop"]??""),
        sequenceNumber: json["sequenceNumber"]??0,
        employees: List<BaseRouteEmployee>.from(json["employees"]?.map((x) => BaseRouteEmployee?.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ferryStopId": ferryStopId,
        "ferryStop": ferryStop?.toJson(),
        "sequenceNumber": sequenceNumber,
        "employees": List<dynamic>.from(employees!.map((x) => x.toJson())),
    };
}

class BaseRouteEmployee {
    String? employeeId;
    String? employeeNumber;
    String? department;
    String? name;
    String? phoneNumber;
    String? photoPath;
    String? ferryStopId;
    String? ferryStopName;
    String? ferryStopMmName;
    String? roadName;
    String? roadMmName;
    String? townshipName;
    String? townshipMmName;

    BaseRouteEmployee({
         this.employeeId,
         this.employeeNumber,
         this.department,
         this.name,
         this.phoneNumber,
         this.photoPath,
         this.ferryStopId,
         this.ferryStopName,
         this.ferryStopMmName,
         this.roadName,
         this.roadMmName,
         this.townshipName,
         this.townshipMmName,
    });

    factory BaseRouteEmployee.fromJson(Map<String, dynamic> json) => BaseRouteEmployee(
        employeeId: json["employeeId"]??"",
        employeeNumber: json["employeeNumber"]??"",
        department: json["department"]??"",
        name: json["name"]??"",
        phoneNumber: json["phoneNumber"]??"",
        photoPath: json["photoPath"]??"",
        ferryStopId: json["ferryStopId"]??"",
        ferryStopName: json["ferryStopName"]??"",
        ferryStopMmName: json["ferryStopMmName"]??"",
        roadName: json["roadName"]??"",
        roadMmName: json["roadMmName"]??"",
        townshipName: json["townshipName"]??"",
        townshipMmName: json["townshipMmName"]??"",
    );

    Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employeeNumber": employeeNumber,
        "department": department,
        "name": name,
        "phoneNumber": phoneNumber,
        "photoPath": photoPath,
        "ferryStopId": ferryStopId,
        "ferryStopName": ferryStopName,
        "ferryStopMmName": ferryStopMmName,
        "roadName": roadName,
        "roadMmName": roadMmName,
        "townshipName": townshipName,
        "townshipMmName": townshipMmName,
    };
}

class FerryStopFerryStop {
    String? id;
    String? name;
    String? myanmarName;
    String? roadId;
    BaseRouteRoad? road;
    String? townshipId;
    BaseRouteRoad? township;

    FerryStopFerryStop({
         this.id,
         this.name,
         this.myanmarName,
         this.roadId,
         this.road,
         this.townshipId,
         this.township,
    });

    factory FerryStopFerryStop.fromJson(Map<String, dynamic> json) => FerryStopFerryStop(
        id: json["id"]??"",
        name: json["name"]??"",
        myanmarName: json["myanmarName"]??"",
        roadId: json["roadId"]??"",
        road: BaseRouteRoad?.fromJson(json["road"]??""),
        townshipId: json["townshipId"]??"",
        township: BaseRouteRoad?.fromJson(json["township"]??""),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "myanmarName": myanmarName,
        "roadId": roadId,
        "road": road?.toJson(),
        "townshipId": townshipId,
        "township": township?.toJson(),
    };
}

class BaseRouteRoad {
    String? id;
    String? name;
    String? myanmarName;

    BaseRouteRoad({
         this.id,
         this.name,
         this.myanmarName,
    });

    factory BaseRouteRoad.fromJson(Map<String, dynamic> json) => BaseRouteRoad(
        id: json["id"]??"",
        name: json["name"]??"",
        myanmarName: json["myanmarName"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "myanmarName": myanmarName,
    };
}

class Vehicle {
    String? id;
    String? licensePlate;
    String? plateExpiredDate;
    String? photoPath;
    VehicleType? vehicleType;
    String? color;
    VehicleEmployee? vehicleEmployee;
    String? vehicleStatus;

    Vehicle({
         this.id,
         this.licensePlate,
         this.plateExpiredDate,
         this.photoPath,
         this.vehicleType,
         this.color,
         this.vehicleEmployee,
         this.vehicleStatus,
    });

    factory Vehicle.fromJson(Map<String, dynamic>? json) => Vehicle(
        id: json?["id"]??"",
        licensePlate: json?["licensePlate"]??"",
        plateExpiredDate: json?["plateExpiredDate"]??"",
        photoPath: json?["photoPath"]??"",
        vehicleType: VehicleType.fromJson(json?["vehicleType"]),
        color: json?["color"]??"",
        vehicleEmployee: VehicleEmployee?.fromJson(json?["vehicleEmployee"]),
        vehicleStatus: json?["vehicleStatus"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "licensePlate": licensePlate,
        "plateExpiredDate":plateExpiredDate,
        //  "${plateExpiredDate?.year.toString().padLeft(4, '0')}-${plateExpiredDate?.month.toString().padLeft(2, '0')}-${plateExpiredDate?.day.toString().padLeft(2, '0')}",
        "photoPath": photoPath,
        "vehicleType": vehicleType?.toJson(),
        "color": color,
        "vehicleEmployee": vehicleEmployee?.toJson(),
        "vehicleStatus": vehicleStatus,
    };
}

class VehicleEmployee {
    String? id;
    int? vehicleEmployeeNumber;
    String? name;
    String? phoneNumber;
    String? photoPath;

    VehicleEmployee({
         this.id,
         this.vehicleEmployeeNumber,
         this.name,
         this.phoneNumber,
         this.photoPath,
    });

    factory VehicleEmployee.fromJson(Map<String, dynamic>? json) => VehicleEmployee(
        id: json?["id"]??"",
        vehicleEmployeeNumber: json?["vehicleEmployeeNumber"]??0,
        name: json?["name"]??"",
        phoneNumber: json?["phoneNumber"]??"",
        photoPath: json?["photoPath"]??"",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vehicleEmployeeNumber": vehicleEmployeeNumber,
        "name": name,
        "phoneNumber": phoneNumber,
        "photoPath": photoPath,
    };
}

class VehicleType {
    String? id;
    String? model;
    int? numberOfSeats;

    VehicleType({
         this.id,
         this.model,
         this.numberOfSeats,
    });

    factory VehicleType.fromJson(Map<String, dynamic>? json) => VehicleType(
        id: json?["id"]??"",
        model: json?["model"]??"",
        numberOfSeats: json?["numberOfSeats"]??0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model": model,
        "numberOfSeats": numberOfSeats,
    };
}






//////////////////////////////////////////////////////////

// List<BaseRouteModel> baseRouteModelFromJson(String str) => List<BaseRouteModel>.from(json.decode(str).map((x) => BaseRouteModel.fromJson(x)));

// String baseRouteModelToJson(List<BaseRouteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class BaseRouteModel {
//     String id;
//     String baseRouteName;
//     List<FerryStopElement> ferryStops;
//     String vehicleId;
//     Vehicle vehicle;
//     String vehicleTypeId;
//     VehicleType vehicleType;

//     BaseRouteModel({
//         required this.id,
//         required this.baseRouteName,
//         required this.ferryStops,
//         required this.vehicleId,
//         required this.vehicle,
//         required this.vehicleTypeId,
//         required this.vehicleType,
//     });

//     factory BaseRouteModel.fromJson(Map<String, dynamic> json) => BaseRouteModel(
//         id: json["id"],
//         baseRouteName: json["baseRouteName"],
//         ferryStops: List<FerryStopElement>.from(json["ferryStops"].map((x) => FerryStopElement.fromJson(x))),
//         vehicleId: json["vehicleId"],
//         vehicle: Vehicle.fromJson(json["vehicle"]),
//         vehicleTypeId: json["vehicleTypeId"],
//         vehicleType: VehicleType.fromJson(json["vehicleType"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "baseRouteName": baseRouteName,
//         "ferryStops": List<dynamic>.from(ferryStops.map((x) => x.toJson())),
//         "vehicleId": vehicleId,
//         "vehicle": vehicle.toJson(),
//         "vehicleTypeId": vehicleTypeId,
//         "vehicleType": vehicleType.toJson(),
//     };
// }

// class FerryStopElement {
//     String id;
//     String ferryStopId;
//     FerryStopFerryStop ferryStop;
//     int sequenceNumber;
//     List<RouteEmployee> employees;

//     FerryStopElement({
//         required this.id,
//         required this.ferryStopId,
//         required this.ferryStop,
//         required this.sequenceNumber,
//         required this.employees,
//     });

//     factory FerryStopElement.fromJson(Map<String, dynamic> json) => FerryStopElement(
//         id: json["id"],
//         ferryStopId: json["ferryStopId"],
//         ferryStop: FerryStopFerryStop.fromJson(json["ferryStop"]),
//         sequenceNumber: json["sequenceNumber"],
//         employees: List<RouteEmployee>.from(json["employees"].map((x) => RouteEmployee.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "ferryStopId": ferryStopId,
//         "ferryStop": ferryStop.toJson(),
//         "sequenceNumber": sequenceNumber,
//         "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
//     };
// }

// class RouteEmployee {
//     String employeeId;
//     String employeeNumber;
//     String department;
//     String name;
//     String phoneNumber;
//     String photoPath;
//     String ferryStopId;
//     String ferryStopName;
//     String ferryStopMmName;
//     String roadName;
//     String roadMmName;
//     String townshipName;
//     String townshipMmName;

//     RouteEmployee({
//         required this.employeeId,
//         required this.employeeNumber,
//         required this.department,
//         required this.name,
//         required this.phoneNumber,
//         required this.photoPath,
//         required this.ferryStopId,
//         required this.ferryStopName,
//         required this.ferryStopMmName,
//         required this.roadName,
//         required this.roadMmName,
//         required this.townshipName,
//         required this.townshipMmName,
//     });

//     factory RouteEmployee.fromJson(Map<String, dynamic> json) => RouteEmployee(
//         employeeId: json["employeeId"],
//         employeeNumber: json["employeeNumber"],
//         department: json["department"],
//         name: json["name"],
//         phoneNumber: json["phoneNumber"],
//         photoPath: json["photoPath"],
//         ferryStopId: json["ferryStopId"],
//         ferryStopName: json["ferryStopName"],
//         ferryStopMmName: json["ferryStopMmName"],
//         roadName: json["roadName"],
//         roadMmName: json["roadMmName"],
//         townshipName: json["townshipName"],
//         townshipMmName: json["townshipMmName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "employeeId": employeeId,
//         "employeeNumber": employeeNumber,
//         "department": department,
//         "name": name,
//         "phoneNumber": phoneNumber,
//         "photoPath": photoPath,
//         "ferryStopId": ferryStopId,
//         "ferryStopName": ferryStopName,
//         "ferryStopMmName": ferryStopMmName,
//         "roadName": roadName,
//         "roadMmName": roadMmName,
//         "townshipName": townshipName,
//         "townshipMmName": townshipMmName,
//     };
// }

// class FerryStopFerryStop {
//     String id;
//     String name;
//     String myanmarName;
//     String roadId;
//     BaseRouteRoad road;
//     String townshipId;
//     BaseRouteRoad township;

//     FerryStopFerryStop({
//         required this.id,
//         required this.name,
//         required this.myanmarName,
//         required this.roadId,
//         required this.road,
//         required this.townshipId,
//         required this.township,
//     });

//     factory FerryStopFerryStop.fromJson(Map<String, dynamic> json) => FerryStopFerryStop(
//         id: json["id"],
//         name: json["name"],
//         myanmarName: json["myanmarName"],
//         roadId: json["roadId"],
//         road: BaseRouteRoad.fromJson(json["road"]),
//         townshipId: json["townshipId"],
//         township: BaseRouteRoad.fromJson(json["township"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "myanmarName": myanmarName,
//         "roadId": roadId,
//         "road": road.toJson(),
//         "townshipId": townshipId,
//         "township": township.toJson(),
//     };
// }

// class BaseRouteRoad {
//     String id;
//     String name;
//     String myanmarName;

//     BaseRouteRoad({
//         required this.id,
//         required this.name,
//         required this.myanmarName,
//     });

//     factory BaseRouteRoad.fromJson(Map<String, dynamic> json) => BaseRouteRoad(
//         id: json["id"],
//         name: json["name"],
//         myanmarName: json["myanmarName"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "myanmarName": myanmarName,
//     };
// }

// class Vehicle {
//     String id;
//     String licensePlate;
//     DateTime plateExpiredDate;
//     String photoPath;
//     VehicleType vehicleType;
//     String color;
//     Driver vehicleEmployee;
//     String vehicleStatus;

//     Vehicle({
//         required this.id,
//         required this.licensePlate,
//         required this.plateExpiredDate,
//         required this.photoPath,
//         required this.vehicleType,
//         required this.color,
//         required this.vehicleEmployee,
//         required this.vehicleStatus,
//     });

//     factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
//         id: json["id"],
//         licensePlate: json["licensePlate"],
//         plateExpiredDate: DateTime.parse(json["plateExpiredDate"]),
//         photoPath: json["photoPath"],
//         vehicleType: VehicleType.fromJson(json["vehicleType"]),
//         color: json["color"],
//         vehicleEmployee: Driver.fromJson(json["vehicleEmployee"]),
//         vehicleStatus: json["vehicleStatus"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "licensePlate": licensePlate,
//         "plateExpiredDate": "${plateExpiredDate.year.toString().padLeft(4, '0')}-${plateExpiredDate.month.toString().padLeft(2, '0')}-${plateExpiredDate.day.toString().padLeft(2, '0')}",
//         "photoPath": photoPath,
//         "vehicleType": vehicleType.toJson(),
//         "color": color,
//         "vehicleEmployee": vehicleEmployee.toJson(),
//         "vehicleStatus": vehicleStatus,
//     };
// }

// class Driver {
//     String id;
//     String vehicleEmployeeNumber;
//     String name;
//     String phoneNumber;
//     String photoPath;

//     Driver({
//         required this.id,
//         required this.vehicleEmployeeNumber,
//         required this.name,
//         required this.phoneNumber,
//         required this.photoPath,
//     });

//     factory Driver.fromJson(Map<String, dynamic> json) => Driver(
//         id: json["id"],
//         vehicleEmployeeNumber: json["vehicleEmployeeNumber"],
//         name: json["name"],
//         phoneNumber: json["phoneNumber"],
//         photoPath: json["photoPath"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "vehicleEmployeeNumber": vehicleEmployeeNumber,
//         "name": name,
//         "phoneNumber": phoneNumber,
//         "photoPath": photoPath,
//     };
// }

// class VehicleType {
//     String id;
//     String model;
//     int numberOfSeats;

//     VehicleType({
//         required this.id,
//         required this.model,
//         required this.numberOfSeats,
//     });

//     factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
//         id: json["id"],
//         model: json["model"],
//         numberOfSeats: json["numberOfSeats"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "model": model,
//         "numberOfSeats": numberOfSeats,
//     };
// }

//////////////////////////////////////

// class BaseRouteModel {
//   String? id;
//   String? baseRouteName;
//   List<FerryStops>? ferryStops;
//   String? vehicleId;
//   Vehicle? vehicle;
//   String? vehicleTypeId;
//   VehicleType? vehicleType;

//   BaseRouteModel(
//       {this.id,
//       this.baseRouteName,
//       this.ferryStops,
//       this.vehicleId,
//       this.vehicle,
//       this.vehicleTypeId,
//       this.vehicleType});

//   BaseRouteModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     baseRouteName = json['baseRouteName'];
//     if (json['ferryStops'] != null) {
//       ferryStops = <FerryStops>[];
//       json['ferryStops'].forEach((v) {
//         ferryStops!.add(new FerryStops.fromJson(v));
//       });
//     }
//     vehicleId = json['vehicleId'];
//     vehicle =
//         json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
//     vehicleTypeId = json['vehicleTypeId'];
//     vehicleType = json['vehicleType'] != null
//         ? new VehicleType.fromJson(json['vehicleType'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['baseRouteName'] = this.baseRouteName;
//     if (this.ferryStops != null) {
//       data['ferryStops'] = this.ferryStops!.map((v) => v.toJson()).toList();
//     }
//     data['vehicleId'] = this.vehicleId;
//     if (this.vehicle != null) {
//       data['vehicle'] = this.vehicle!.toJson();
//     }
//     data['vehicleTypeId'] = this.vehicleTypeId;
//     if (this.vehicleType != null) {
//       data['vehicleType'] = this.vehicleType!.toJson();
//     }
//     return data;
//   }
// }

// class FerryStops {
//   String? id;
//   String? ferryStopId;
//   FerryStop? ferryStop;
//   int? sequenceNumber;
//   List<Employees>? employees;

//   FerryStops(
//       {this.id,
//       this.ferryStopId,
//       this.ferryStop,
//       this.sequenceNumber,
//       this.employees});

//   FerryStops.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     ferryStopId = json['ferryStopId'];
//     ferryStop = json['ferryStop'] != null
//         ? new FerryStop.fromJson(json['ferryStop'])
//         : null;
//     sequenceNumber = json['sequenceNumber'];
//     if (json['employees'] != null) {
//       employees = <Employees>[];
//       json['employees'].forEach((v) {
//         employees!.add(new Employees.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['ferryStopId'] = this.ferryStopId;
//     if (this.ferryStop != null) {
//       data['ferryStop'] = this.ferryStop!.toJson();
//     }
//     data['sequenceNumber'] = this.sequenceNumber;
//     if (this.employees != null) {
//       data['employees'] = this.employees!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class FerryStop {
//   String? id;
//   String? name;
//   String? myanmarName;
//   String? roadId;
//   Road? road;
//   String? townshipId;
//   Road? township;

//   FerryStop(
//       {this.id,
//       this.name,
//       this.myanmarName,
//       this.roadId,
//       this.road,
//       this.townshipId,
//       this.township});

//   FerryStop.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     myanmarName = json['myanmarName'];
//     roadId = json['roadId'];
//     road = json['road'] != null ? new Road.fromJson(json['road']) : null;
//     townshipId = json['townshipId'];
//     township =
//         json['township'] != null ? new Road.fromJson(json['township']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['myanmarName'] = this.myanmarName;
//     data['roadId'] = this.roadId;
//     if (this.road != null) {
//       data['road'] = this.road!.toJson();
//     }
//     data['townshipId'] = this.townshipId;
//     if (this.township != null) {
//       data['township'] = this.township!.toJson();
//     }
//     return data;
//   }
// }

// class Road {
//   String? id;
//   String? name;
//   String? myanmarName;

//   Road({this.id, this.name, this.myanmarName});

//   Road.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     myanmarName = json['myanmarName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['myanmarName'] = this.myanmarName;
//     return data;
//   }
// }

// class Employees {
//   String? employeeId;
//   String? employeeNumber;
//   String? department;
//   String? name;
//   String? phoneNumber;
//   String? photoPath;
//   String? ferryStopId;
//   String? ferryStopName;
//   String? ferryStopMmName;
//   String? roadName;
//   String? roadMmName;
//   String? townshipName;
//   String? townshipMmName;

//   Employees(
//       {this.employeeId,
//       this.employeeNumber,
//       this.department,
//       this.name,
//       this.phoneNumber,
//       this.photoPath,
//       this.ferryStopId,
//       this.ferryStopName,
//       this.ferryStopMmName,
//       this.roadName,
//       this.roadMmName,
//       this.townshipName,
//       this.townshipMmName});

//   Employees.fromJson(Map<String, dynamic> json) {
//     employeeId = json['employeeId'];
//     employeeNumber = json['employeeNumber'];
//     department = json['department'];
//     name = json['name'];
//     phoneNumber = json['phoneNumber'];
//     photoPath = json['photoPath'];
//     ferryStopId = json['ferryStopId'];
//     ferryStopName = json['ferryStopName'];
//     ferryStopMmName = json['ferryStopMmName'];
//     roadName = json['roadName'];
//     roadMmName = json['roadMmName'];
//     townshipName = json['townshipName'];
//     townshipMmName = json['townshipMmName'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['employeeId'] = this.employeeId;
//     data['employeeNumber'] = this.employeeNumber;
//     data['department'] = this.department;
//     data['name'] = this.name;
//     data['phoneNumber'] = this.phoneNumber;
//     data['photoPath'] = this.photoPath;
//     data['ferryStopId'] = this.ferryStopId;
//     data['ferryStopName'] = this.ferryStopName;
//     data['ferryStopMmName'] = this.ferryStopMmName;
//     data['roadName'] = this.roadName;
//     data['roadMmName'] = this.roadMmName;
//     data['townshipName'] = this.townshipName;
//     data['townshipMmName'] = this.townshipMmName;
//     return data;
//   }
// }

// class Vehicle {
//   String? id;
//   String? licensePlate;
//   String? plateExpiredDate;
//   String? photoPath;
//   VehicleType? vehicleType;
//   String? color;
//   VehicleEmployee? vehicleEmployee;
//   String? vehicleStatus;

//   Vehicle(
//       {this.id,
//       this.licensePlate,
//       this.plateExpiredDate,
//       this.photoPath,
//       this.vehicleType,
//       this.color,
//       this.vehicleEmployee,
//       this.vehicleStatus});

//   Vehicle.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     licensePlate = json['licensePlate'];
//     plateExpiredDate = json['plateExpiredDate'];
//     photoPath = json['photoPath'];
//     vehicleType = json['vehicleType'] != null
//         ? new VehicleType.fromJson(json['vehicleType'])
//         : null;
//     color = json['color'];
//     vehicleEmployee = json['vehicleEmployee'] != null
//         ? new VehicleEmployee.fromJson(json['vehicleEmployee'])
//         : null;
//     vehicleStatus = json['vehicleStatus'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['licensePlate'] = this.licensePlate;
//     data['plateExpiredDate'] = this.plateExpiredDate;
//     data['photoPath'] = this.photoPath;
//     if (this.vehicleType != null) {
//       data['vehicleType'] = this.vehicleType!.toJson();
//     }
//     data['color'] = this.color;
//     if (this.vehicleEmployee != null) {
//       data['vehicleEmployee'] = this.vehicleEmployee!.toJson();
//     }
//     data['vehicleStatus'] = this.vehicleStatus;
//     return data;
//   }
// }

// class VehicleType {
//   String? id;
//   String? model;
//   int? numberOfSeats;

//   VehicleType({this.id, this.model, this.numberOfSeats});

//   VehicleType.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     model = json['model'];
//     numberOfSeats = json['numberOfSeats'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['model'] = this.model;
//     data['numberOfSeats'] = this.numberOfSeats;
//     return data;
//   }
// }

// class VehicleEmployee {
//   String? id;
//   String? vehicleEmployeeNumber;
//   String? name;
//   String? phoneNumber;
//   String? photoPath;

//   VehicleEmployee(
//       {this.id,
//       this.vehicleEmployeeNumber,
//       this.name,
//       this.phoneNumber,
//       this.photoPath});

//   VehicleEmployee.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     vehicleEmployeeNumber = json['vehicleEmployeeNumber'];
//     name = json['name'];
//     phoneNumber = json['phoneNumber'];
//     photoPath = json['photoPath'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['vehicleEmployeeNumber'] = this.vehicleEmployeeNumber;
//     data['name'] = this.name;
//     data['phoneNumber'] = this.phoneNumber;
//     data['photoPath'] = this.photoPath;
//     return data;
//   }
