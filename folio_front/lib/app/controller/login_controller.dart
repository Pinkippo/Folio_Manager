import 'package:get/get.dart';

class LoginController extends GetxController{

  /// TODO : 로그인 관련 컨트롤러 기능 구현

  var id = '';
  var pw = '';

  void login(){
    print('id : $id, pw : $pw');
  }

}