import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:get/get.dart';

class GradientLoginButton extends StatelessWidget {
  const GradientLoginButton({Key? key}) : super(key: key);

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 227, 155, 1),
            Color.fromRGBO(255, 227, 155, 0.8),
            Color.fromRGBO(255, 227, 155, 0.6),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () async {
          // TODO : 로그인 기능 구현
          await Get.find<LoginController>().login().then((value){
            storage.write(key: 'jwt', value: value);
            // 다 지우고 다시 메인으로
            Get.offAllNamed('/');
          });
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          '로그인',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}


class GradientRegisterButton extends StatelessWidget {
  const GradientRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 227, 155, 1),
            Color.fromRGBO(255, 227, 155, 0.8),
            Color.fromRGBO(255, 227, 155, 0.6),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () {
          // TODO : 회원가입 페이지 이동

        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          '회원가입',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}