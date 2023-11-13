import 'package:flutter/material.dart';
class LogInModel {
  final String token;

  LogInModel({required this.token});

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        token: json["jwtToken"],
      );

  Map<String, dynamic> toJson() => {
        "jwtToken": token,
      };
}