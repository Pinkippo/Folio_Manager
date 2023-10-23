import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:get/get.dart';

/// TODO : 로그인 페이지 기능 및 디자인 구현
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Login Page'),
      ),
    );
  }
}
