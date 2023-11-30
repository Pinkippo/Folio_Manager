class BoardRequestModel {
  final int uid;
  final String title;
  final String content;

  BoardRequestModel({
    required this.uid,
    required this.title,
    required this.content,
  });

  // Factory method to convert a Map to BoardRequestModel
  factory BoardRequestModel.fromJson(Map<String, dynamic> json) {
    return BoardRequestModel(
      uid: json['uid'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
    );
  }

  // Method to convert BoardRequestModel to Map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'content': content,
    };
  }
}
