import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/app/widget/gradient_button.dart';
import 'package:folio_front/app/widget/login_field.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:folio_front/data/repository/auth_repository.dart';
import 'package:get/get.dart';

/// TODO : 로그인 페이지 기능 및 디자인 구현
class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  RegisterRequestModel requestModel = RegisterRequestModel(email: 'test@test.com', password: '000211', nickname: '테스트');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height : Get.height * 0.25),
              const Text(
                'Folio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              LoginField(hintText: 'Email', obscureText: false, onChanged: Get.find<LoginController>().updateUsername),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password', obscureText: true, onChanged: Get.find<LoginController>().updatePassword),
              const SizedBox(height: 20),
              const SizedBox(height: 15),
              const GradientLoginButton(),
              const SizedBox(height: 15),
              const GradientRegisterButton(),
              SizedBox(height : Get.height * 0.25),
            ],
          ),
        ),
      ),
    );
  }
}
