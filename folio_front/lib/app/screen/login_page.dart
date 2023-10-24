import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/login_controller.dart';
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
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Row(
              children: [
                IconButton(
                  // LoginController 에서 register 함수를 호출하도록 수정
                  onPressed: () async {
                    controller.register(requestModel);

                  },
                  icon: const Icon(Icons.login),
                ),
                Obx(() {
                  if (controller.registerResponse.value == null) {
                    return const Text('null');
                  } else {
                    return Text(controller.registerResponse.value!.jwtToken);
                  }
                }),
              ],
            )
        ),
      ),
    );
  }
}
