import 'package:folio_front/data/model/board_response_model.dart';
import 'package:folio_front/data/model/comment_request_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/comment_response_model.dart';
import '../../data/model/user_response_model.dart';
import '../../data/repository/board_repository.dart';

class BoardController extends GetxController {

  /// 댓글 입력 컨트롤러
  RxString commentContent = ''.obs;

  /// 페이지 번호
  RxInt pageNumber = 0.obs;

  /// 페이지 여부
  RxBool hasMoreItems = true.obs;

  RxList<BoardResponseModel> boardList = <BoardResponseModel>[].obs;

  @override
  void onInit() async {
    addBoardList();
    super.onInit();
  }

  Future<void> loadMoreItems() async {
    try {
      pageNumber++;
      List<BoardResponseModel> newItems = await addBoardListMore();
      if (newItems.length < 20 ) {
        boardList.addAll(newItems);
        Get.snackbar(
          "알림",
          "더 이상 게시물이 없습니다",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 0, 100, 20),
        );
      } else {
        boardList.addAll(newItems);
        updateHasMoreItems(true);
      }
    } catch (error) {
      print(error);
    }
  }

  /// 새로고침 메서드
  Future<void> refreshItems() async {
    try {
      pageNumber = 0.obs;
      List<BoardResponseModel> newItems = await addBoardListMore();
      boardList.clear();
      boardList.addAll(newItems);
      updateHasMoreItems(true);
    } catch (error) {
      print(error);
    }
  }

  /// 게시물 리스트 bool 변화
  void updateHasMoreItems(bool value) {
    hasMoreItems.value = value;
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

    List<BoardResponseModel> tempList = await BoardRepository().getMainList(pageNumber.value, 20);
    boardList.addAll(tempList);

    print(boardList.length);

  }

  /// 게시물 추가 조회 메서드
  Future<List<BoardResponseModel>> addBoardListMore() async {
    List<BoardResponseModel> tempList = await BoardRepository().getMainList(pageNumber.value, 20);
    return tempList;
  }

  /// 댓글 등록 메서드
  Future<bool> addComment(int bid) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('uid') ?? '';
    String? jwt = prefs.getString('jwt') ?? '';

    if(commentContent.value == '') {
      Get.snackbar(
          '댓글 등록 실패',
          '댓글을 입력해주세요.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 0, 100, 20),
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
        margin: const EdgeInsets.fromLTRB(20, 0, 100, 20),
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
            nickname: prefs.getString('nickname') ?? '',
          )
      );
      // 댓글 리스트 초기화
      boardList.refresh();
    }

    return result;
  }


}