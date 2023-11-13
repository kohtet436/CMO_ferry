// class BaseRouteIdModel {
//   String id;
//   BaseRouteIdModel({required this.id});
//   factory BaseRouteIdModel.fromJson(Map<String, dynamic> json) =>
//       BaseRouteIdModel(id: json['id']);
//   Map<String, dynamic> toJson() => {
//         "id": id,
//       };
// }
class BaseRouteIdModel {
  final String id;

  BaseRouteIdModel({required this.id});

  factory BaseRouteIdModel.fromJson(Map<String, dynamic> json) =>
      BaseRouteIdModel(
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
