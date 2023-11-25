import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/board_response_model.dart';
import '../model/comment_request_model.dart';

const baseUrl = 'http://localhost:80';

class MyApiClient {

  Future<RegisterResponseModel> register(RegisterRequestModel requestModel) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );


    if (response.statusCode == 200) {
      RegisterResponseModel responseModel = RegisterResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return responseModel;
    } else {
      throw Exception('Failed to register');
      // TODO : 에러 처리
    }
  }

  Future<RegisterResponseModel> login (RegisterRequestModel requestModel) async{
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200) {
      return  RegisterResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else if(response.statusCode == 401){
      return RegisterResponseModel(success: false, jwtToken: '', nickname: '', uid: 0);
    } else {
      throw Exception('Failed to register');
      // TODO : 추후 에러 처리
    }
  }

  /// 메인 리스트 조회
  Future<List<BoardResponseModel>> getMainList(int pageNumber, int pageSize) async {
    final url = Uri.parse('$baseUrl/board/read?page=$pageNumber&size=$pageSize');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List<BoardResponseModel> boardList = [];
      final Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      if (jsonResponse.containsKey('data')) {
        final List<dynamic> jsonList = jsonResponse['data'];

        for (final item in jsonList) {
          boardList.add(BoardResponseModel.fromJson(item));
        }

        return boardList;
      } else {
        Get.snackbar(
          '요청사항 리스트 조회 실패',
          '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        throw Exception('Failed to get main list');
      }
    } else {
      Get.snackbar(
        '메인 리스트 조회 실패',
        '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      throw Exception('Failed to get main list');
    }
  }

  /// 댓글 등록
  Future<bool> addComment (CommentRequestModel commentRequestModel) async {
    final url = Uri.parse('$baseUrl/comment/write');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${commentRequestModel.jwtToken}',
      },
      body: jsonEncode(commentRequestModel.toJson()),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      if (jsonResponse['data'] == true) {
        return jsonResponse['data'];
      } else {
        Get.snackbar(
          '댓글 등록 실패',
          jsonResponse['responseMessage'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return jsonResponse['data'];
      }
    } else {
      Get.snackbar(
        '댓글 등록 실패',
        '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
  }

}