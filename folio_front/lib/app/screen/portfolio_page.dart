import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final storage = const FlutterSecureStorage();

  String jwtToken = '';

  @override
  void initState() {

    getToken();
    super.initState();
  }

  getToken() async {
    jwtToken = await storage.read(key: 'jwt') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(Get.width * 0.05, Get.height * 0.05, Get.width * 0.05, Get.width * 0.05),
          child: Container(
            color: AppColors.backgroundColor,
            height: Get.height * 0.7,
            width: Get.width * 0.3,
            child: ElevatedButton(
              onPressed: () {
                // TODO : 로그인 유지 확인 후 로그인 or 글 작성 페이지 이동
                if(jwtToken == '') {
                  Get.snackbar('로그인 필요', '로그인 후 이용해주세요.');
                  Get.toNamed('/login');
                } else {
                  Get.toNamed('/write');
                }
              },
              child: const Text('포트폴리오 작성하기'),
            ),
          ),
        ),
      ],

    );
  }
}
