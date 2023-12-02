import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

class ToggleSection extends GetView<FolioController> {
  final String title;
  final bool isVisible;
  final ValueChanged<bool> onToggle;

  const ToggleSection({
    Key? key, // 수정된 부분
    required this.title,
    required this.isVisible,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
          20,
          0,
          0,
          20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: (() {
                          switch (title) {
                            case '이력서 제목':
                              return Colors.red;
                            case '개인정보':
                              return Colors.red;
                            default:
                              return Colors.green;
                          }
                        })(),
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
            Switch(
              value: isVisible,
              onChanged: onToggle,
              activeColor: AppColors.mainColor,
              inactiveTrackColor: AppColors.beigeColor,
            ),
          ],
        ),
    );
  }
}
