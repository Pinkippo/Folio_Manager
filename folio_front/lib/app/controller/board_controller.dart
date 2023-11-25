import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folio_front/data/model/board_response_model.dart';
import 'package:folio_front/data/model/comment_request_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/model/comment_response_model.dart';
import '../../data/model/user_response_model.dart';
import '../../data/repository/board_repository.dart';

class BoardController extends GetxController {

  final storage = const FlutterSecureStorage();

  /// 댓글 입력 컨트롤러
  RxString commentContent = ''.obs;

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

  /// 댓글 스트링 업데이트 메서드
  void updateCommentContent(String value) {
    commentContent.value = value;
  }

  /// 댓글 스트링 초기화 메서드
  void clearCommentContent() {
    commentContent.value = '';
    commentContent.refresh();
  }

  /// 게시글 조회 메서드
  Future<void> addBoardList() async {

    print(pageNumber.value);
    print(pageSize.value);

    List<BoardResponseModel> tempList = await BoardRepository().getMainList(pageNumber.value, pageSize.value);
    boardList.addAll(tempList);

    print(boardList.length);

  }

  /// 댓글 등록 메서드
  Future<bool> addComment(int bid) async {

    String? uid = await storage.read(key: 'uid') ?? '';
    String? jwt = await storage.read(key: 'jwt') ?? '';

    if(commentContent.value == '') {
      Get.snackbar(
        '댓글 등록 실패',
        '댓글을 입력해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }

    if(uid == '' || jwt == '') {
      Get.snackbar(
        '댓글 등록 실패',
        '로그인이 필요합니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      Get.toNamed('/login');
      return false;
    }

    CommentRequestModel requestModel = CommentRequestModel(uid: int.parse(uid), bid: bid, content: commentContent.value, jwtToken: jwt!);
    bool result = await BoardRepository().addComment(requestModel);
    if(result) {
      // 보드 내부에 댓글 리스트에 댓글 객체를 추가
      boardList.where((element) => element.bid == bid).first.comments.add(
          CommentResponseModel(
            content: commentContent.value,
            writeDate: DateTime.now(),
            nickname: await storage.read(key: 'nickname') as String,
          )
      );
      // 댓글 리스트 초기화
      boardList.refresh();
    }

    return result;
  }



}