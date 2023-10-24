import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterRequestModel {
  String email;
  String password;
  String nickname;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.nickname,
  });

  // 이메일과 비밀번호만 가지는 생성자
  RegisterRequestModel.emailPassword({
    required this.email,
    required this.password,
  }) : nickname = '';


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickname': nickname,
    };
  }
}