// To parse this JSON data, do
//
//     final ferryStop = ferryStopFromJson(jsonString);

import 'dart:convert';

FerryStop ferryStopFromJson(String str) => FerryStop.fromJson(json.decode(str));

String ferryStopToJson(FerryStop data) => json.encode(data.toJson());

class FerryStop {
  String id;
  String name;
  String myanmarName;
  String roadId;
  Road? road;
  String townshipId;
  Township? township;

  FerryStop({
    required this.id,
    required this.name,
    required this.myanmarName,
    required this.roadId,
    this.road,
    required this.townshipId,
    this.township,
  });

  factory FerryStop.fromJson(Map<String?, dynamic> json) => FerryStop(
        id: json["id"],
        name: json["name"],
        myanmarName: json["myanmarName"],
        roadId: json["roadId"],
        road: json["road"] != null ? Road.fromJson(json["road"]) : null,
        townshipId: json["townshipId"],
        township: json["township"] != null
            ? Township.fromJson(json["township"])
            : null,
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "myanmarName": myanmarName,
        "roadId": roadId,
        "road": road?.toJson(),
        "townshipId": townshipId,
        "township": township?.toJson(),
      };
}

class Road{
  String name;
  String myanmarName;
  String id;

  Road({
    required this.name,
    required this.myanmarName,
    required this.id,
  });

  factory Road.fromJson(Map<String?, dynamic> json) => Road(
        name: json["name"],
        myanmarName: json["myanmarName"],
        id: json["id"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name,
        "myanmarName": myanmarName,
        "id": id,
      };
}

class Township{
  String name;
  String myanmarName;
  String id;

  Township({
    required this.name,
    required this.myanmarName,
    required this.id,
  });

  factory Township.fromJson(Map<String, dynamic> json) => Township(
        name: json["name"],
        myanmarName: json["myanmarName"],
        id: json["id"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name,
        "myanmarName": myanmarName,
        "id": id,
      };
}
