import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/read_folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/folio_response_model.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';

import '../widget/gradient_button.dart';

class ReadPortFolioPage extends GetView<FolioReadController> {
  const ReadPortFolioPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.resume.value.userNickName}님의",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const Text(
                          "Folio",
                          style: TextStyle(
                            fontSize: 40,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    //메인가기 버튼
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: GradientButton(
                        hintText: "메인으로 돌아가기",
                        onPressed: () {
                          Get.offAllNamed('/');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        0,
                        20,
                        20,
                      ),
                      child: GradientButton(
                          hintText: "PDF 저장하기", onPressed: () async {

                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.1,
                height: constraints.maxHeight,
              ),
              Obx(
                () => SizedBox(
                  width: constraints.maxWidth * 0.65,
                  height: constraints.maxHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        const Text(
                          '이력서 제목',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.article_outlined,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              controller.resume.value.resumeName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.resume.value.resumeSubtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),

                        /// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 이력서 제목

                        const SizedBox(height: 80),
                        const Text(
                          '개인 정보',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: AppColors.mainColor,
                              size: 30,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              controller.resume.value.resumeUserName,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "   [${controller.resume.value.resumeUserYear}]",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              controller.resume.value.resumeUserEmail,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "전화번호 : ${controller.resume.value.resumeUserPhone}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 60),
                        Text(
                          controller.resume.value.resumeUserSelf,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),

                        /// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 개인 정보

                        const SizedBox(height: 80),
                        const Text(
                          '기술 스택',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        // 쉼표를 기준으로 나눠서 리스트로 Row로 예쁘게 반환
                        ...controller.resume.value.resumeUserStack
                            .split(",")
                            .map(
                              (e) => Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),

                        /// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 기술 스택

                        const SizedBox(height: 80),
                        const Text(
                          '학력 및 이수 교육',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.resume.value.resumeUserEducation1.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEducation1,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEducation1Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEducation1Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserEducation1Special,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEducation2.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEducation2,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEducation2Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEducation2Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserEducation2Special,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEducation3.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEducation3,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEducation3Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEducation3Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserEducation3Special,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEducation4.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEducation4,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEducation4Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEducation4Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserEducation4Special,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                          ],
                        ),

                        /// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 학력 및 이수 교육

                        const SizedBox(height: 80),
                        const Text(
                          '프로젝트',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.resume.value.resumeUserProject1.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserProject1,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserProject1Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserProject1Stack,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserProject1Content,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserProject2.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserProject2,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserProject2Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserProject2Stack,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserProject2Content,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                      // 더해줘
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                                ),
                            if (controller.resume.value.resumeUserProject3.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserProject3,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserProject3Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserProject3Stack,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserProject3Content,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserProject4.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserProject4,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserProject4Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserProject4Stack,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    controller.resume.value.resumeUserProject4Content,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ],
                          ),
                        const SizedBox(height: 80),
                        const Text(
                          '기타사항',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.mainColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.resume.value.resumeUserEtc1.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEtc1,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEtc1Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEtc1Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEtc2.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEtc2,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEtc2Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEtc2Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEtc3.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEtc3,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEtc3Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEtc3Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            if (controller.resume.value.resumeUserEtc4.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller.resume.value.resumeUserEtc4,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        controller.resume.value.resumeUserEtc4Date,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    controller.resume.value.resumeUserEtc4Content,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.1,
                height: constraints.maxHeight,
              ),
            ],
          ),
        );
      },
    );
  }
}
