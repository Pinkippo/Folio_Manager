import 'package:flutter/material.dart';
import 'package:folio_front/data/model/folio_reqeust_model.dart';
import 'package:folio_front/data/provider/api.dart';

class FolioRepository{
  final MyApiClient apiClient;

  FolioRepository({required this.apiClient});

  /// TODO : 포트폴리오 저장
  Future<bool> saveFolio(ResumeRequestDTO requestDTO, String jwtToken) async {
    return apiClient.saveFolio(requestDTO, jwtToken);
  }


  /// TODO : 포트폴리오 임시 저장 불러오기

}