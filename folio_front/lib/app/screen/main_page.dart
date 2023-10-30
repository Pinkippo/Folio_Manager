import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/screen/explain_page.dart';
import 'package:folio_front/app/screen/portfolio_page.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  late TabController tabController;

  final storage = const FlutterSecureStorage();

  String? jwtToken;

  List<Tab> myTabs = [
    const Tab(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '안내말',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
    const Tab(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '포트폴리오',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {

    getToken();
    tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();

  }

  getToken() async {
    jwtToken = await storage.read(key: 'jwt');
    print('jwtToken : $jwtToken');
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.08,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/');
              },
              child: const Text(
                'Folio',
                style: TextStyle(
                  fontFamily: 'LS',
                  fontSize: 54,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        actions: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.grey[700],
            controller: tabController,
            tabs: myTabs,
            labelStyle: const TextStyle(
              color: AppColors.mainColor,
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
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: const[
          ExplainPage(),
          PortfolioPage(),
        ],
      ),
    );
  }
}
