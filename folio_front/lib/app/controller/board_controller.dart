import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/data/model/board_response_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/repository/board_repository.dart';

class BoardController extends GetxController {

  final storage = const FlutterSecureStorage();

  /// 페이지 번호
  RxInt pageNumber = 0.obs;

  /// 페이지 사이즈
  RxInt pageSize = 20.obs;

  RxList<BoardResponseModel> boardList = <BoardResponseModel>[].obs;

  @override
  void onInit() async {
    addBoardList();
    super.onInit();
  }

  /// 게시글 리스트 추가 -
  Future<void> addBoardList() async {
    String? token = await storage.read(key: 'jwt');

    print('토큰${token!}');
    print(pageNumber.value);
    print(pageSize.value);

    List<BoardResponseModel> tempList = await BoardRepository().getMainList(token! ,pageNumber.value, pageSize.value);
    boardList.addAll(tempList);

    print(boardList.length);
  }



}