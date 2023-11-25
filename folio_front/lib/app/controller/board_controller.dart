import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/data/model/board_response_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/model/comment_response_model.dart';
import '../../data/model/user_response_model.dart';
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
    addMockBoard();
    //addBoardList();
    super.onInit();
  }

  /// Test 데이터 추가
  Future<void> addMockBoard() async {
    for (int i = 0; i < 20; i++) {
      boardList.add(BoardResponseModel(
        bid: i,
        userResponseDTO: UserResponseModel(
          uid: i,
          nickname: '유저 $i',
          email: '이메일 $i',
        ),
        writeDate: DateTime.now(),
        title: '제목sfasdfasfasdfasfasdfasfdasdfaadfadfasdfasdfadfadfasfdasfdasfasdfasdfasfasdf $i',
        content: '내용 $i',
        view: i,
        comments: [
          CommentResponseModel(
            content: '댓글 $i',
            nickname: '유저 $i',
            writeDate: DateTime.now(),
          ),
          CommentResponseModel(
            content: '댓글 $i',
            nickname: '유저 $i',
            writeDate: DateTime.now(),
          ),
          CommentResponseModel(
            content: '댓글 $i',
            nickname: '유저 $i',
            writeDate: DateTime.now(),
          )
        ],
      ));
    }
  }

  /// 게시글 리스트 추가 -
  Future<void> addBoardList() async {

    print(pageNumber.value);
    print(pageSize.value);

    List<BoardResponseModel> tempList = await BoardRepository().getMainList(pageNumber.value, pageSize.value);
    boardList.addAll(tempList);

    print(boardList.length);

  }



}