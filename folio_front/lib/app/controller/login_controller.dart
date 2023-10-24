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
    print(response);
    registerResponse.value = response;
  }

}