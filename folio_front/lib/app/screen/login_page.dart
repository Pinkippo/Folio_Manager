import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/app/screen/main_page.dart';
import 'package:folio_front/app/widget/gradient_button.dart';
import 'package:folio_front/app/widget/login_field.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:folio_front/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  final storage = const FlutterSecureStorage();

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
                'Folio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 50),
              LoginField(hintText: 'Email', obscureText: false, onChanged: Get.find<LoginController>().updateUsername),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password', obscureText: true, onChanged: Get.find<LoginController>().updatePassword),
              const SizedBox(height: 20),
              const SizedBox(height: 15),
              GradientButton(
                hintText: "로그인",
                onPressed: login,
              ),
              const SizedBox(height: 15),
              GradientButton(
                hintText: "회원가입",
                onPressed: registerMove,
              ),
              SizedBox(height : Get.height * 0.25),
            ],
          ),
        ),
      ),
    );
  }

  login() async {

    if(Get.find<LoginController>().email == RxString('') || Get.find<LoginController>().password == RxString('')) {
      Get.snackbar(
          '로그인 요청 실패',
          '아이디와 비밀번호를 확인해주세요.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    await Get.find<LoginController>().login().then((value) async {
      if (value.jwtToken != '') {
        await storage.write(key: 'jwt', value: value.jwtToken);
        await storage.write(key: 'uid', value : value.uid.toString());
        await storage.write(key: 'nickname', value : value.nickname);
        Get.off(() => const MainPage());
      } else {
        Get.snackbar(
            '로그인 실패',
            '아이디와 비밀번호를 확인해주세요.',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM);
      }
    });
  }

  registerMove() async{
    Get.toNamed('/register');
  }

}