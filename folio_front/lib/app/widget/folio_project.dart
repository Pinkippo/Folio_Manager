import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import 'folio_project_into.dart';

class FolioProject extends GetView<FolioController> {
  const FolioProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController();
    final periodController = TextEditingController();
    final detailController = TextEditingController();

    final scrollController = ScrollController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                '프로젝트',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '진행했던 프로젝트에 대한 정보를 추가하여 이력서를 완성하세요!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
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
                          controller: scrollController, // 스크롤 컨트롤러 추가
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              // 마우스 스크롤 이벤트 처리
                              scrollController.jumpTo(
                                scrollController.offset - details.delta.dx,
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller.folioProjectList.map((item) {
                                return Row(
                                  children: [
                                    FolioProjectItem(
                                      name: item.name,
                                      period: item.period,
                                      devStack: item.devStack,
                                      content: item.content,
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
              const SizedBox(height: 10),
              // Form for adding new project details
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.2,
                    ),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: '프로젝트 이름',
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
                        hintText: '프로젝트 기간',
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
              /// 프로젝트 기술 스택을 chip으로 추가하는 부분
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.15,
                    ),
                    child: TextFormField(
                      controller: controller.devStackController,
                      onFieldSubmitted: (text) {
                        if (text.isNotEmpty) {
                          controller.folioMySkill.add(text);
                          controller.devStackController.clear();
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(30),
                        hintText: '기술 스택 입력 후 엔터',
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
                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      children: controller.folioMySkill.map((item) {
                        return Chip(
                          label: Text(item),
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          padding: const EdgeInsets.all(20),
                          onDeleted: () {
                            controller.folioMySkill.remove(item);
                          },
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 10),
              // Project Tech Stack Input
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Get.width * 0.3 + 20,
                ),
                child: TextFormField(
                  maxLines: 10,
                  minLines: 10,
                  maxLength: 255,
                  controller: detailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(30),
                    hintText: '상세 내용',
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
                  if (titleController.text.isNotEmpty &&
                      periodController.text.isNotEmpty &&
                      detailController.text.isNotEmpty &&
                      controller.folioMySkill.isNotEmpty &&
                      controller.folioProjectList.length < 4) {
                    controller.folioProjectList.add(
                      FolioProjectItem(
                        name: titleController.text,
                        period: periodController.text,
                        devStack: controller.folioMySkill.toList(),
                        content: detailController.text,
                      ),
                    );
                    titleController.clear();
                    periodController.clear();
                    detailController.clear();
                    controller.folioMySkill.clear();
                  } else if( controller.folioProjectList.length >= 4){
                    Get.snackbar(
                      '항목 추가 실패',
                      '항목은 최대 4개까지 추가할 수 있습니다.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    );
                  } else {
                    Get.snackbar(
                      '항목 추가 실패',
                      '모든 항목을 입력해주세요.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    );
                  }
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}