import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:get/get.dart';

class FolioAwardItem extends GetView<FolioController> {
  const FolioAwardItem({
    required this.name,
    required this.period,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String name;
  final String period;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.3,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const Spacer(),
              Text(
                period,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.calendar_today,
                color: AppColors.mainColor,
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {
                  controller.folioLicenseList.removeWhere(
                        (element) => element.name == name,
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
