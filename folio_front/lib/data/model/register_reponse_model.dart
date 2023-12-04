import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterResponseModel {
  String jwtToken;
  String nickname;
  int uid;

  RegisterResponseModel({
    required this.jwtToken,
    required this.nickname,
    required this.uid,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      jwtToken: json['jwtToken'],
      nickname: json['nickname'] ?? '',
      uid: json['uid'] ?? 0,
    );
  }
}