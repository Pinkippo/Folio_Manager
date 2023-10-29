import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterResponseModel {
  bool success;
  String jwtToken;
  String username;

  RegisterResponseModel({
    required this.success,
    required this.jwtToken,
    required this.username,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: true,
      jwtToken: json['jwtToken'],
      username: json['username'],
    );
  }
}