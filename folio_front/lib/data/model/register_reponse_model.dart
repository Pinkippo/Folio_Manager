import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterResponseModel {
  bool success;
  String jwtToken;
  String nickname;
  int uid;

  RegisterResponseModel({
    required this.success,
    required this.jwtToken,
    required this.nickname,
    required this.uid,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      success: true,
      jwtToken: json['jwtToken'],
      nickname: json['nickname'],
      uid: json['uid'],
    );
  }
}