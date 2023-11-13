class CheckInRequestModel{
final String? dailyRouteId;
 final String? status ;
  final String? checkInLatitude;
  final String? checkInLongitude;
  final String? checkOutLatitude;
  final String? checkOutLongitude;
  CheckInRequestModel({this.checkInLatitude,this.checkInLongitude,this.checkOutLatitude,this.checkOutLongitude,this.dailyRouteId,this.status});

 factory CheckInRequestModel.fromJson(Map<String, dynamic> json) =>
      CheckInRequestModel(
        dailyRouteId: json["dailyRouteId"],
       status: json['status'],
       checkInLatitude: json['checkInLatitude'],
       checkInLongitude: json['checkInLongitude'],
       checkOutLatitude: json['checkOutLatitude'],
       checkOutLongitude: json['checkOutLongitude']
       ,
      );

  Map<String, dynamic> toJson() {
    return {
      "dailyRouteId": dailyRouteId,
      "status": status,
      "checkInLatitude": checkInLatitude,
      "checkInLongitude":checkInLongitude,
      "checkOutLatitude":checkOutLatitude,
      "checkOutLongitude":checkOutLongitude

    };
}}