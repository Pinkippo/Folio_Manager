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

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nickname': nickname,
    };
  }
}