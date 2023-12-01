import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
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
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '학력 정보',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 10),
              // 학력 정보 입력 필드
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.2,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: '기관 이름',
                        contentPadding: const EdgeInsets.all(30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.1,
                    ),
                    child: TextFormField(
                      controller: periodController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(30),
                        hintText: '기간',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.mainColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.3 + 20,
                ),
                child: TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(30),
                    hintText: '학습 내용',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.3 + 20,
                ),
                child: TextFormField(
                  maxLength: 100,
                  maxLines: 3,
                  minLines: 3,
                  controller: specialController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(30),
                    hintText: '특이사항',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
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
                style: ElevatedButton.styleFrom(
                  primary: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(Get.width * 0.3 + 30, 60), // 버튼의 최소 크기 설정
                ),
                child: const Text('추가'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
