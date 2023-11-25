class CommentRequestModel {
  final int uid;
  final int bid;
  final String content;
  final String jwtToken;

  CommentRequestModel({
    required this.uid,
    required this.bid,
    required this.content,
    required this.jwtToken,
  });

  factory CommentRequestModel.fromJson(Map<String, dynamic> json) {
    return CommentRequestModel(
      uid: json['uid'],
      bid: json['bid'],
      content: json['content'],
      jwtToken: json['jwtToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'bid': bid,
      'content': content,
      'jwtToken': jwtToken,
    };
  }

}