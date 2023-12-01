import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
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
        const SizedBox(height: 30),
        /// 사용자 이름 입력
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  /// 사용자 이름 입력
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.1,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '이름',
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
                      onChanged: controller.updateFolioMyName,
                    ),
                  ),
                  const SizedBox(width: 30),
                  /// 사용자 이메일 입력
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.2,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '이메일',
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
                      onChanged: controller.updateFolioMyEmail,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  /// 사용자 전화번호 입력
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.2,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '전화번호',
                        contentPadding: const EdgeInsets.all(30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: controller.updateFolioMyPhone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11), // 전화번호 길이 제한
                        PhoneNumberFormatter(), // 전화번호 형식 포맷팅
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  /// 근무 년차
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Get.width * 0.1,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '근무 년차',
                        contentPadding: const EdgeInsets.all(30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: controller.updateFolioMyCareer,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        /// 사용자 근무 년차
        const SizedBox(height: 30),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          child: TextFormField(
            maxLength: 255,
            decoration: InputDecoration(
              hintText: '간단한 자기소개',
              contentPadding: const EdgeInsets.all(30),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            maxLines: 7, // 최대 라인 수
            minLines: 7, // 최소 라인 수
            onChanged: controller.updateFolioName,
          ),
        ),
      ],
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length >= 3 && text.length <= 7) {
      return TextEditingValue(
        text: '${text.substring(0, 3)}-${text.substring(3)}',
        selection: TextSelection.collapsed(
          offset: text.length + 1,
        ),
      );
    } else if (text.length > 7) {
      return TextEditingValue(
        text: '${text.substring(0, 3)}-${text.substring(3, 7)}-${text.substring(7)}',
        selection: TextSelection.collapsed(
          offset: text.length + 2,
        ),
      );
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(
        offset: text.length,
      ),
    );
  }
}