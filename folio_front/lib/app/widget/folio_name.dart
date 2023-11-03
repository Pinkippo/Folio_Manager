import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

/// 이력서 이름과 한줄 요약을 입력받고 보여주는 위젯 - folioController를 통해 folioName과 folioSummary를 관리한다.
class FolioName extends GetView<FolioController> {
  const FolioName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 이력서 이름 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '이력서 이름',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioName,
          ),
        ),
        const SizedBox(height: 30),
        /// 이력서 한줄 요약 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: '자신을 가장 잘 표현할 수 있는 한줄',
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: controller.updateFolioSummary,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}