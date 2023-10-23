import 'package:get/get.dart';

class LoginController extends GetxController{

  var id = '';
  var pw = '';

  void login(){
    print('id : $id, pw : $pw');
  }

}