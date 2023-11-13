class LeaveHistoryModel {
  final String reason;
  final String date;
  final String routeType;

  LeaveHistoryModel(
      {required this.reason, required this.date, required this.routeType});

  factory LeaveHistoryModel.fromJson(Map<String, dynamic> json) =>
      LeaveHistoryModel(
          date: json['date'],
          reason: json['reason'],
          routeType: json['routeType']);

  Map<String, dynamic> toJson() =>
      {"date": date, "reason": reason, "routeType": routeType};
}
