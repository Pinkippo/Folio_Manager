import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterResponseModel {
  String jwtToken;
  String username;

  RegisterResponseModel({
    required this.jwtToken,
    required this.username,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      jwtToken: json['jwtToken'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jwtToken': jwtToken,
      'username': username,
    };
  }
}