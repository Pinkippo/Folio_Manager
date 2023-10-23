import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/app_controller.dart';
import 'package:folio_front/app/screen/explain_page.dart';
import 'package:folio_front/app/screen/login_page.dart';
import 'package:folio_front/app/screen/portfolio_page.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(MainController());


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: Colors.yellowAccent,
          dividerColor: Colors.yellow,

          controller: controller.tabController,
          tabs: controller.myTabs,

        ),
        title: const Text(
          'Folio',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          ExplainPage(),
          PortfolioPage(),
          LoginPage(),
        ],
      ),
    );
  }
}
