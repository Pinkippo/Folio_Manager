import 'package:flutter/material.dart';
import 'package:folio_front/common/app_colors.dart';


class ToggleSection extends StatelessWidget {
  final String title;
  final bool isVisible;
  final ValueChanged<bool> onToggle;

  const ToggleSection({super.key,
    required this.title,
    required this.isVisible,
    required this.onToggle,
  });

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
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Switch(
            value: isVisible,
            onChanged: onToggle,
            activeColor: AppColors.mainColor, // 토글 켜질 때의 색상
            inactiveTrackColor: AppColors.beigeColor, // 토글 꺼질 때의 트랙 색상
          ),
        ],
      ),
    );
  }
}