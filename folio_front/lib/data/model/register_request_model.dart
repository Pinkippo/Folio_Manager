import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterRequestModel {
  String email;
  String password;
  String name;

  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.name,
  });

  // 이메일과 비밀번호만 가지는 생성자
  RegisterRequestModel.emailPassword({
    required this.email,
    required this.password,
  }) : name = '';


  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickname': name,
    };
  }
}