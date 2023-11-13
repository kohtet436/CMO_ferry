class ChangePasswordRequestModel{
   String currentPassword;
  String newPassword;
  ChangePasswordRequestModel({required this.currentPassword,required this.newPassword});
  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequestModel(
currentPassword:json['currentPassword'],
newPassword:json['newPassword']

      
      );

  Map<String, dynamic> toJson() {
    return {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
     

    };
}
}
