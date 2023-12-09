import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/app/widget/gradient_button.dart';
import 'package:folio_front/app/widget/login_field.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<LoginController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height : Get.height * 0.25),
              const Text(
                'Folio Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 50),
              LoginField(hintText: 'Email', obscureText: false, onChanged: Get.find<LoginController>().updateUsername),
              const SizedBox(height: 15),
              LoginField(hintText: 'Name', obscureText: false, onChanged: Get.find<LoginController>().updateName),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password', obscureText: true, onChanged: Get.find<LoginController>().updatePassword),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password Check', obscureText: true, onChanged: Get.find<LoginController>().updatePasswordCheck),
              const SizedBox(height: 35),
              GradientButton(
                hintText: "회원가입",
                onPressed: register,
              ),
              SizedBox(height : Get.height * 0.25),
            ],
          ),
        ),
      ),
    );
  }

  register() async {

    if(Get.find<LoginController>().email == RxString('') || Get.find<LoginController>().password == RxString('') || Get.find<LoginController>().name == RxString('')) {
      Get.snackbar(
          '회원가입 요청 실패',
          '아이디와 비밀번호를 입력했는지 확인해주세요.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      return;
    }
    if(!Get.find<LoginController>().checkPassword()) {
      Get.snackbar(
          '회원가입 요청 실패',
          '비밀번호가 일치하지 않습니다.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      return;
    }

    await Get.find<LoginController>().register(
        RegisterRequestModel(
            email: Get.find<LoginController>().email.value,
            password: Get.find<LoginController>().password.value,
            name: Get.find<LoginController>().name.value)).then((value) {
      if (value != '') {
        Get.offAllNamed('/');
      } else {
        Get.snackbar(
            '회원가입 실패',
            '회원가입에 실패하였습니다. 다시 시도해주세요.',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        );
      }
    });

  }
}
