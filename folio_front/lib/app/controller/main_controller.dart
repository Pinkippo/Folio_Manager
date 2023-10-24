import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController with GetSingleTickerProviderStateMixin {
  //탭 클릭 감지시 표시될 탭바 UI.
  final List<Tab> myTabs = <Tab>[
    const Tab(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            '안내말',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
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
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
    Tab(
      child: Stack(
        children: [
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
               Center(
                child: Text(
                  '마이페이지',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                print('로그인 페이지로 이동');
                if(Get.find<MainController>().isLoggedIn.value == false) {
                  Get.toNamed('/login');
                }
              },
            ),
          ),
        ],
      ),
    ),
  ];

  //탭 컨트롤러 선언
  late TabController tabController;

  /// TODO : 로그인 여부 관리 로직 구현

  RxBool isLoggedIn = false.obs;



  // 탭 컨트롤러 초기화
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  // MainController 클래스가 해제될 때 탭 컨트롤러를 dispose 해야 합니다.
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}