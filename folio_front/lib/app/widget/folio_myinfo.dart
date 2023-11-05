import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:get/get.dart';

/// 포트폴리오 작성자의 개인 정보를 적는 위젯
class FolioMyInfo extends GetView<FolioController> {
  const FolioMyInfo({Key? key}) : super(key: key);

  /// 사용자 이름, 사용자 이메일, 사용자 전화번호, 사용자의 근무 년차 정보를 입력받는다.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 사용자 이름 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '이름',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioMyName,
          ),
        ),
        const SizedBox(height: 30),
        /// 사용자 이메일 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '이메일',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioMyEmail,
          ),
        ),
        const SizedBox(height: 30),
        /// 사용자 전화번호 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '전화번호',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioMyPhone,
          ),
        ),
        const SizedBox(height: 30),
        /// 사용자 근무 년차
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '근무 년차',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioMyCareer,
          ),
        ),
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '간단 소개',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            maxLines: 5, // 최대 라인 수
            minLines: 5, // 최소 라인 수
            onChanged: controller.updateFolioName,
          ),
        ),
      ],
    );
  }
}