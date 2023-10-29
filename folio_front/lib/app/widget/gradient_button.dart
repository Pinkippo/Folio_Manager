import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {

  final String hintText;
  final Function() onPressed;

  const GradientButton(
      {
        Key? key,
        required this.hintText,
        required this.onPressed
      }) : super(key: key);

  static const storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          hintText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}
