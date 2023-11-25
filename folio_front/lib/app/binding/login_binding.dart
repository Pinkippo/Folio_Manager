import 'package:folio_front/app/controller/login_controller.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:folio_front/data/repository/auth_repository.dart';
import 'package:get/get.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          authRepository:
          AuthRepository(apiClient: MyApiClient()));
    });
  }
}