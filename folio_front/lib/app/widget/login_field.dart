import 'package:flutter/material.dart';
import 'package:folio_front/common/app_colors.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  const LoginField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.mainColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.mainColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}