import 'package:flutter/material.dart';
import 'package:folio_front/data/model/folio_reqeust_model.dart';
import 'package:folio_front/data/model/folio_response_model.dart';
import 'package:folio_front/data/provider/api.dart';

class FolioRepository{

  /// TODO : 포트폴리오 저장
  Future<String> saveFolio(ResumeRequestDTO requestDTO, String jwtToken) async {
    return MyApiClient().saveFolio(requestDTO, jwtToken);
  }


  /// TODO : 포트폴리오 임시 저장 불러오기
  Future<ResumeResponseDTO> loadTempFolio(String email) async {
    return MyApiClient().loadFolio(email);
  }

}