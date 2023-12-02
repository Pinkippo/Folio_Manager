import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../controller/folio_controller.dart';

class FolioDevStack extends GetView<FolioController> {
  const FolioDevStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();

    final scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '기술 스택',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '프로그래밍 언어, 프레임워크, 라이브러리 등을 추가하여 풍부한 이력서를 완성해보세요!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.6,
                  minWidth: Get.width * 0.6,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Obx(() {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: scrollController,
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              // 마우스 스크롤 이벤트 처리
                              scrollController.jumpTo(
                                scrollController.offset - details.delta.dx,
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller.folioSkillList.map((String name) {
                                return Row(
                                  children: [
                                    /// 기술 스택 정보 위젯
                                    Chip(
                                      label: Text(name),
                                      onDeleted: () {
                                        controller.folioSkillList.remove(name);
                                      },
                                      labelStyle: const TextStyle(
                                        fontSize: 20,
                                      ),
                                      padding: const EdgeInsets.all(20),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.1,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(30),
                        hintText: '이름',
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
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (nameController.text != '') {
                        controller.folioSkillList.add(nameController.text);
                      }
                      nameController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: const Size(80, 70),
                    ),
                    child: const Text('추가'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}