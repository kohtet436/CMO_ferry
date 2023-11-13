class LeaveRequestModel {
  String? reason;
  String date;
  String routeType;
  LeaveRequestModel({this.reason, required this.date, required this.routeType});
  factory LeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      LeaveRequestModel(
          date: json['date'],
          routeType: json['routeType'],
          reason: json['reason'] ?? "");
           Map<String, dynamic> toJson() {
    return {
      "reason":reason,
      "date": date,
      "routeType":routeType,
    };

}
}