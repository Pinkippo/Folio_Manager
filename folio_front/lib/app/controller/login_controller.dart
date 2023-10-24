import 'package:flutter/cupertino.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:folio_front/data/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  final Rx<RegisterResponseModel?> registerResponse = Rx<RegisterResponseModel?>(null);


  Future<void> register(RegisterRequestModel requestModel) async {
    final response = await authRepository.register(requestModel);
    registerResponse.value = response;
  }

  Future<String> login() async {
    final response = await authRepository.login(RegisterRequestModel.emailPassword(email: username.value, password: password.value));
    registerResponse.value = response;
    return registerResponse.value!.jwtToken;
  }

  String? get jwtToken => registerResponse.value?.jwtToken;

  final RxString username = RxString(''); // 사용자명 상태를 저장
  final RxString password = RxString(''); // 비밀번호 상태를 저장

  void updateUsername(String value) {
    username.value = value; // 사용자명 업데이트
  }

  void updatePassword(String value) {
    password.value = value; // 비밀번호 업데이트
  }

}