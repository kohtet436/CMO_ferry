
class LoginRequestModel{

final String username;
final String password;
LoginRequestModel({required this.username,required this.password});
factory LoginRequestModel.fromJson(Map<String,dynamic> json)=>LoginRequestModel(username: json['username'], password: json['password']);
Map<String,dynamic> toJson(){
  return {
    'username':username,
    'password':password,
  };
}





}