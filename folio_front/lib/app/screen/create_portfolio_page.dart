import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/app/widget/folio_education.dart';
import 'package:folio_front/app/widget/folio_myinfo.dart';
import 'package:folio_front/app/widget/folio_name.dart';
import 'package:folio_front/app/widget/gradient_button.dart';
import 'package:folio_front/app/widget/toggle_selection.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

/// TODO : 왼쪽의 탭들로 오른쪽의 위젯들을 관리 / 오른쪽의 내용 위젯들은 GetView로 묶어서 상태를 관리
class CreatePortfolioPage extends StatefulWidget {
  const CreatePortfolioPage({Key? key}) : super(key: key);

  @override
  State<CreatePortfolioPage> createState() => _CreatePortfolioPageState();
}

class _CreatePortfolioPageState extends State<CreatePortfolioPage> {

  final storage = const FlutterSecureStorage();
  String? jwtToken;

  Map<String, bool> sectionVisibility = {
    '이력서 제목': true,
    '개인정보': true,
    '학력 및 이수 교육': true,
    // '자격증': true,
    // '경력': true,
    // '수상기록': true,
    // '프로젝트': true,
  };

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  void checkToken() async {
    jwtToken = await storage.read(key: 'jwt');
    if (jwtToken == null) {
      // JWT 토큰이 없을 때 로그인 페이지로 이동
      Get.offAllNamed('/login');
      Get.snackbar(
        '로그인 필요',
        '로그인 후 이용해주세요.',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 50)
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final FolioController folioController = Get.find<FolioController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.15,
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height : constraints.maxHeight * 0.7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            const Text(
                              "Folio Maker",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            // 이력서 항목 선택
                            for (var entry in sectionVisibility.entries)
                              ToggleSection(
                                title: entry.key,
                                isVisible: entry.value,
                                onToggle: (isVisible) {
                                  setState(() {
                                    sectionVisibility[entry.key] = isVisible;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height : constraints.maxHeight * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              10,
                            ),
                            child: GradientButton(
                                hintText: "임시저장",
                                onPressed: () {
                                  folioController.saveFolio();
                                }
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding:const EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              10,
                            ),
                            child: GradientButton(
                                hintText: "PDF 출력",
                                onPressed: () {
                                  folioController.saveFolio();
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.85,
                height: constraints.maxHeight,
                child: ListView.builder(
                  itemCount: sectionVisibility.entries
                      .where((entry) => entry.value)
                      .length,
                  itemBuilder: (context, index) {
                    final visibleEntries = sectionVisibility.entries.where((entry) => entry.value).toList();
                    final entry = visibleEntries[index];

                    // 7개의 스위치문을 통해서 각각 원하는 위젯 반환하게 만들어줘
                    switch (entry.key) {
                      case '이력서 제목':
                        return const FolioName();
                      case '개인정보':
                        return const FolioMyInfo();
                      case '학력 및 이수 교육':
                        return const FolioEducation();
                      case '자격증':
                        return const Placeholder();
                      case '경력':
                        return const Placeholder();
                      case '수상기록':
                        return const Placeholder();
                      case '프로젝트':
                        return const Placeholder();
                      default:
                        return const Placeholder();
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

