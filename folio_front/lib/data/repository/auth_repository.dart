import 'package:folio_front/data/model/register_request_model.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:meta/meta.dart';

class AuthRepository{
  final MyApiClient apiClient;

  AuthRepository({required this.apiClient});

  register(RegisterRequestModel requestModel) {
    return apiClient.register(requestModel);
  }

}