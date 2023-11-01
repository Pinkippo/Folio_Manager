import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

/// TODO : 왼쪽의 탭들로 오른쪽의 위젯들을 관리 / 오른쪽의 내용 위젯들은 GetView로 묶어서 상태를 관리
class CreatePortfolioPage extends StatefulWidget {
  const CreatePortfolioPage({super.key});

  @override
  State<CreatePortfolioPage> createState() => _CreatePortfolioPageState();
}

class _CreatePortfolioPageState extends State<CreatePortfolioPage> {

  final storage = const FlutterSecureStorage();
  String? jwtToken;

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  void checkToken() async {
    jwtToken = await storage.read(key: 'jwt');
    if(jwtToken == null) {
      Get.offAllNamed('/login');
      Get.snackbar(
          '로그인 필요',
          '로그인 후 이용해주세요.',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          /// 변수 명시
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.25,
                  height: constraints.maxHeight,
                  child: SingleChildScrollView(
                    // 이력서 제목 , 개인정보 , 학력 및 이수 교육 , 자격증 , 경력 , 수상 , 프로젝트 - 선택 부분
                    child: Column(
                      children: [
                        const Text("Folio 항목 선택",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container( /// 이력서 제목
                          width: constraints.maxWidth * 0.25,
                          height: 100,
                          color: Colors.red,
                        ),
                        Container( /// 개인정보
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.blue,
                        ),
                        Container( /// 학력 및 이수 교육
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.green,
                        ),
                        Container( /// 자격증
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.yellow,
                        ),
                        Container( /// 경력
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.orange,
                        ),
                        Container( /// 수상기록
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.purple,
                        ),
                        Container( /// 프로젝트
                          width: constraints.maxWidth * 0.25,
                          height: 100 ,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.75,
                  height: constraints.maxHeight,
                  color: Colors.black,
                ),
              ],
            ),
          );
        },
    );
  }
}
