import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Get.width * 0.05, Get.height * 0.05, Get.width * 0.05, Get.width * 0.05
      ),
      child: Container(
        color: const Color.fromRGBO(255, 227, 155, 1),
        child: const Center(
          child: Text('Portfolio Page'),
        ),
      ),
    );
  }
}
