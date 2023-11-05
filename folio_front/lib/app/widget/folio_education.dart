import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:get/get.dart';
import 'folio_education_info.dart';

class FolioEducation extends GetView<FolioController> {
  const FolioEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final periodController = TextEditingController();
    final contentController = TextEditingController();
    final specialController = TextEditingController();

    final scrollController = ScrollController();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // 왼쪽 부분: 학력 정보 입력
          SizedBox(
            width: Get.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '학력 정보',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // 학력 정보 입력 필드
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '기관 이름'),
                ),
                TextField(
                  controller: periodController,
                  decoration: InputDecoration(labelText: '기간'),
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: '학습 내용'),
                ),
                TextField(
                  controller: specialController,
                  decoration: InputDecoration(labelText: '특이사항'),
                ),
                // 정보 추가 버튼
                ElevatedButton(
                  onPressed: () {
                    controller.updateFolioEducation(FolioEducationItem(
                      name: nameController.text,
                      period: periodController.text,
                      content: contentController.text,
                      special: specialController.text,
                    ));
                    // 입력 필드 초기화
                    nameController.clear();
                    periodController.clear();
                    contentController.clear();
                    specialController.clear();
                  },
                  child: Text('추가'),
                ),
              ],
            ),
          ),
          // 오른쪽 부분: 학력 정보 리스트뷰 (가로 스크롤)
          SizedBox(
            width: Get.width * 0.85,
            child: Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: scrollController, // 스크롤 컨트롤러 추가
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // 마우스 스크롤 이벤트 처리
                    scrollController.jumpTo(
                      scrollController.offset - details.delta.dx,
                    );
                  },
                  child: Row(
                    children: controller.folioEducationList.map((item) {
                      return Row(
                        children: [
                          const SizedBox(width: 20),
                          FolioEducationItem(
                            name: item.name,
                            period: item.period,
                            content: item.content,
                            special: item.special,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
