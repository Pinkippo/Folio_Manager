class CommentResponseModel {
  final String nickname;
  final DateTime writeDate;
  final String content;

  CommentResponseModel({
    required this.nickname,
    required this.writeDate,
    required this.content,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) {
    return CommentResponseModel(
      nickname: json['nickname'],
      writeDate: DateTime.parse(json['writeDate']),
      content: json['content'],
    );
  }
}