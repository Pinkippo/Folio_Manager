import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:folio_front/data/model/register_reponse_model.dart';
import 'package:folio_front/data/model/register_request_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/board_request_model.dart';
import '../model/board_response_model.dart';
import '../model/comment_request_model.dart';
import '../model/folio_reqeust_model.dart';
import '../model/folio_response_model.dart';

const baseUrl = 'http://52.78.19.37:8080';
// const baseUrl = 'http://localhost:80';
// aws = http://52.78.19.37:8080;

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
      print(responseModel);
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
      return RegisterResponseModel( jwtToken: '', nickname: '', uid: 0);
    } else {
      throw Exception('Failed to register');
      // TODO : 추후 에러 처리
    }
  }

  /// 요청사항 작성
  Future<bool> writeBoard(BoardRequestModel boardRequestModel, String jwtToken) async {
    final url = Uri.parse('$baseUrl/board/write');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      },
      body: jsonEncode(boardRequestModel.toJson()),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      if (jsonResponse['data'] == true) {
        return jsonResponse['data'];
      } else {
        Get.snackbar(
          '요청사항 작성 실패',
          jsonResponse['responseMessage'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        );
        return jsonResponse['data'];
      }
    } else {
      Get.snackbar(
        '요청사항 작성 실패',
        '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      return false;
    }
  }

  /// 메인 리스트 조회
  Future<List<BoardResponseModel>> getMainList(int pageNumber, int pageSize) async {
    final url = Uri.parse('$baseUrl/board/read?page=$pageNumber&size=$pageSize');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      return false;
    }
  }

  /// 포트폴리오 저장
  Future<String> saveFolio(ResumeRequestDTO requestDTO, String jwtToken) async {
    final url = Uri.parse('$baseUrl/resume/write');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      },
      body: jsonEncode(requestDTO.toJson()),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      if (jsonResponse['data'] != "") {
        return jsonResponse['data'];
      } else {
        Get.snackbar(
          '포트폴리오 저장 실패',
          jsonResponse['responseMessage'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        );
        return jsonResponse['data'];
      }
    } else {
      Get.snackbar(
        '포트폴리오 저장 실패',
        '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      return "";
    }
  }

  // loadFolio
  Future<ResumeResponseDTO> loadFolio(String email) async {
    final url = Uri.parse('$baseUrl/resume/read/$email');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      print(jsonResponse);

      if (jsonResponse['data'] != null) {
        final Map<String, dynamic> jsonMap = jsonResponse['data'];
        return ResumeResponseDTO.fromJson(jsonMap);
      } else {
        Get.offAllNamed('/');
        Get.snackbar(
          '포트폴리오 불러오기 실패',
          '존재하지 않는 이메일의 이력서 입니다. 다시 확인해주세요.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        );
        throw Exception('Failed to get main list');
      }
    } else {
      Get.offAllNamed('/');
      Get.snackbar(
        '포트폴리오 불러오기 실패',
        '서버 상태가 불안정합니다. 잠시 후 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      );
      throw Exception('Failed to get main list');
    }
  }


}