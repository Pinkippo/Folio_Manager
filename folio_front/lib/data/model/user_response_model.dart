// uid, email, nickname 의 값을 가지는 DTO

class UserResponseModel {

  int uid;
  String email;
  String nickname;


UserResponseModel({
    required this.uid,
    required this.email,
    required this.nickname,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      uid: json['uid'] as int,
      email: json['email'] as String,
      nickname: json['nickname'] as String,
    );
  }

}