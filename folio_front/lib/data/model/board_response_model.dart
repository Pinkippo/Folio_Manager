import 'package:folio_front/data/model/comment_response_model.dart';
import 'package:folio_front/data/model/user_response_model.dart';

/// 글 리스트 응답 모델
class BoardResponseModel {
  final int bid;
  final UserResponseModel userResponseDTO;
  final DateTime writeDate;
  final String title;
  final String content;
  final int view;
  final List<CommentResponseModel> comments;

  BoardResponseModel({
    required this.bid,
    required this.userResponseDTO,
    required this.writeDate,
    required this.title,
    required this.content,
    required this.view,
    required this.comments,
  });

  factory BoardResponseModel.fromJson(Map<String, dynamic> json) {
    return BoardResponseModel(
      bid: json['bid'],
      userResponseDTO: UserResponseModel.fromJson(json['userResponseDTO']),
      writeDate: DateTime.parse(json['writeDate']),
      title: json['title'],
      content: json['content'],
      view: json['view'],
      comments: List<CommentResponseModel>.from(
        json['comments'].map((comment) => CommentResponseModel.fromJson(comment)),
      ),
    );
  }
}

