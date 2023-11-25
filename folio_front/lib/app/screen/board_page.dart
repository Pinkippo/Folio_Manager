import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/board_controller.dart';
import 'package:get/get.dart';

class BoardPage extends GetView<BoardController> {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(BoardController(), permanent: true);

    return Container(
      color:  Colors.white,
    );
  }
}
