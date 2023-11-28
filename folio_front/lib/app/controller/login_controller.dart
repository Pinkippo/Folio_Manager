import 'package:flutter/cupertino.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:folio_front/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  // 유저 로그인 상태
  final Rx<RegisterResponseModel?> registerResponse = Rx<RegisterResponseModel?>(null);

  // 유저 로그인 상태 -> jwtToken
  String? get jwtToken => registerResponse.value?.jwtToken;

  // 유저 로그인 상태 - ID / PW
  final RxString email = RxString('');
  final RxString password = RxString('');

  // 회원가입 상태 - NAME / PW Check
  final RxString name = RxString('');
  final RxString passwordCheck = RxString('');


  // 로그인
  Future<RegisterResponseModel> login() async {
    final RegisterResponseModel response = await authRepository.login(RegisterRequestModel.emailPassword(email: email.value, password: password.value));
    registerResponse.value = response;
    return (response.jwtToken.isNotEmpty) ? response : RegisterResponseModel(jwtToken: '', nickname: '', uid: 0);
  }

  // 회원가입
  Future<String> register(RegisterRequestModel requestModel) async {
    final response = await authRepository.register(requestModel);
    registerResponse.value = response;
    return (response.success) ? response.jwtToken : '';
  }

  // ID 변경
  void updateUsername(String value) {
    email.value = value;
  }

  // PW 변경
  void updatePassword(String value) {
    password.value = value;
  }

  // NAME 변경
  void updateName(String value) {
    name.value = value;
  }

  // PW Check 변경
  void updatePasswordCheck(String value) {
    passwordCheck.value = value;
  }

  // PW Check
  bool checkPassword() {
    return password.value == passwordCheck.value;
  }

}