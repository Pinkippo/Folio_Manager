import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/screen/board_page.dart';
import 'package:folio_front/app/screen/explain_page.dart';
import 'package:folio_front/app/screen/portfolio_page.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/board_request_model.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  TextEditingController titleText = TextEditingController();
  TextEditingController content = TextEditingController();

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
              fontSize: 20,
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
              fontSize: 20,
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
            '요청사항',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 20,
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
        toolbarHeight: 64,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/');
              },
              child: Image.asset(
                'assets/image/foliologo.png',
                height: 74,
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
        children: const [
          ExplainPage(),
          PortfolioPage(),
          BoardPage(),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          hoverElevation: 10,
          backgroundColor: AppColors.mainColor,
          onPressed: () async {
            /// 토큰이 없을 경우 로그인이 필요하다고 알림
            if (jwtToken == null) {
              Get.snackbar(
                "알림",
                "로그인이 필요합니다",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 0, 100, 20),
              );
            } else {
              // 요청사항 작성 다이얼로그 생성
              /// TODO : 요청사항 작성 연결
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('관리자 요청사항 작성'),
                    content: SizedBox(
                      height: 300,
                      width: 800,
                      child: Column(
                        children: [
                          TextField(
                            maxLines: 1,
                            maxLength: 30,
                            controller: titleText,
                            onChanged: (value) {

                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '제목',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: content,
                            onChanged: (value) {

                            },
                            maxLines: 10,
                            maxLength: 256,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '내용',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('취소'),
                      ),
                      TextButton(
                        onPressed: () async {
                          String? uid = await storage.read(key: 'uid') ?? '';
                          MyApiClient().writeBoard(
                            BoardRequestModel(uid: int.parse(uid), title: titleText.text, content: content.text), jwtToken!,
                          ).then((value){
                            Get.snackbar(
                              '요청사항 등록 성공',
                              '요청사항이 등록되었습니다.',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.greenAccent,
                              colorText: Colors.white,
                              margin: const EdgeInsets.fromLTRB(20, 0, 100, 20),
                            );
                          });
                          Get.back();
                        },
                        child: const Text('작성'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          elevation: 10, // Adjust the elevation as needed
          mini: false, // Set to true if you want a smaller version
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)), // Adjust the border radius as needed
          ),
          child: const Icon(Icons.post_add, color: AppColors.backgroundColor, size: 40.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
