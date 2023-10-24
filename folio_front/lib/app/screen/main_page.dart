import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/main_controller.dart';
import 'package:folio_front/app/screen/explain_page.dart';
import 'package:folio_front/app/screen/login_page.dart';
import 'package:folio_front/app/screen/my_page.dart';
import 'package:folio_front/app/screen/portfolio_page.dart';
import 'package:get/get.dart';

/// TODO : 로그인 버튼을 통한 로그인 화면 이동 및 마이페이지 연결 수정
class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(MainController());


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: Get.width * 0.02,
            ),
            const Text(
              'Folio',
              style: TextStyle(
                fontFamily: 'LS',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.grey[700],
            controller: controller.tabController,
            tabs: controller.myTabs,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[700]!,
                ),
              ),
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          SizedBox(
            width: Get.width * 0.05,
          )
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          ExplainPage(),
          PortfolioPage(),
          MyPage(),
        ],
      ),
    );

  }
}
