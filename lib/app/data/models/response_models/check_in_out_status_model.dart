class CheckInOutStatusModel {
  final bool isAlreadyCheckedIn;
  final bool isAlreadyCheckedOut;
  CheckInOutStatusModel(
      {required this.isAlreadyCheckedIn, required this.isAlreadyCheckedOut});
factory CheckInOutStatusModel.fromJson(Map<String,dynamic> json)=>
CheckInOutStatusModel(isAlreadyCheckedIn: json['isAlreadyCheckedIn'], isAlreadyCheckedOut:json['isAlreadyCheckedOut']);
  Map<String, dynamic> toJson() => {
        "isAlreadyCheckedIn": isAlreadyCheckedIn,
        "isAlreadyCheckedOut": isAlreadyCheckedOut
      };
}
