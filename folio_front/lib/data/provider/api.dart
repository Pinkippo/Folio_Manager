import 'dart:convert';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'http://localhost:80';

class MyApiClient {
  final http.Client httpClient;
  MyApiClient({required this.httpClient});

  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await httpClient.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200) {
      RegisterResponseModel responseModel = RegisterResponseModel.fromJson(jsonDecode(response.body));
      return responseModel;
    } else {
      throw Exception('Failed to register');
      // TODO : 에러 처리
    }
  }

  Future<RegisterResponseModel> login (RegisterRequestModel requestModel) async{
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await httpClient.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200) {
      return  RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 401){
      return RegisterResponseModel(success: false, jwtToken: '', username: '');
    } else {
      throw Exception('Failed to register');
      // TODO : 추후 에러 처리
    }
  }

}