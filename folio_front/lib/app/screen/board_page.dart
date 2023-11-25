import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/board_controller.dart';
import 'package:folio_front/common/app_colors.dart';
import 'package:folio_front/data/model/board_response_model.dart';
import 'package:get/get.dart';

class BoardPage extends GetView<BoardController> {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(BoardController(), permanent: true);

    return Center(
      child: Container(
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(() {
            if (controller.boardList.isEmpty) {
              return const Center(
                child: Text('요청사항이 존재하지 않습니다.'),
              );
            } else {
              return ListView.builder(
                itemCount: controller.boardList.length,
                itemBuilder: (context, index) {
                  BoardResponseModel board = controller.boardList[index];
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      ExpansionTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        leading: const Icon(Icons.question_answer_sharp),
                        title: Column(
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  board.title,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  maxLines: null,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Spacer(),
                                // 년월일만 보여주기
                                Text(board.writeDate.toString().substring(0, 10)),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 8),
                            Text(board.userResponseDTO.nickname)
                          ],
                        ),
                        backgroundColor: AppColors.mainColor,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        initiallyExpanded: false,
                        onExpansionChanged: (expanded) {
                          if (expanded) {
                            // TODO : 조회수 증가 로직
                          }
                        },
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(board.content, style: const TextStyle(fontSize: 16, color: Colors.white)),
                                  ],
                                ),
                              ),
                              // 댓글 및 댓글 작성
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    // 댓글 작성
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            autofocus: true,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white), // 윤곽선 색상을 흰색으로 지정
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white), // 포커스된 윤곽선 색상을 흰색으로 지정
                                              ),
                                              labelText: '댓글을 입력하세요',
                                              labelStyle: TextStyle(color: Colors.white), // 라벨 텍스트 색상을 흰색으로 지정
                                            ),
                                            style: const TextStyle(color: Colors.white), // 입력된 텍스트 색상을 흰색으로 지정
                                            controller: TextEditingController(text: controller.commentContent.value),
                                            onChanged: (text) {
                                              controller.updateCommentContent(text);
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        SizedBox(
                                          height: 40,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white
                                            ),
                                            onPressed: () async {
                                              controller.addComment(board.bid).then((value){
                                                if(value){
                                                  Get.snackbar(
                                                    '댓글 등록 성공',
                                                    '댓글이 등록되었습니다.',
                                                    snackPosition: SnackPosition.BOTTOM,
                                                    backgroundColor: Colors.greenAccent,
                                                    colorText: Colors.white,
                                                  );
                                                  controller.clearCommentContent();
                                                }
                                              });
                                            },
                                            child: const Text('작성', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    // 댓글 리스트
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: board.comments.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.only(bottom: 16),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(Icons.person, color: Colors.white),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    board.comments[index].nickname,
                                                    style: const TextStyle(color: Colors.white), // 텍스트 색상을 검정색으로 지정
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Text(
                                                    board.comments[index].content,
                                                    style: const TextStyle(color: Colors.white, fontSize: 16), // 텍스트 색상을 검정색으로 지정
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    board.comments[index].writeDate.toString().substring(0, 10),
                                                    style: const TextStyle(color: Colors.white), // 텍스트 색상을 검정색으로 지정
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                },
              );
            }
          }),
        ),
    );
  }
}