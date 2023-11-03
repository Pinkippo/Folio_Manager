import 'package:flutter/material.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';


class FolioController extends GetxController{

  final FolioRepository folioRepository;

  FolioController({required this.folioRepository});

  /// 포트폴리오 내용 컨트롤러
  final RxString folioName = ''.obs; // 포트폴리오 이름

  final RxString folioSummary = ''.obs; // 포트폴리오 요약

  final RxString folioMyName = ''.obs; // 포트폴리오 작성자 이름

  final RxString folioMyEmail = ''.obs; // 포트폴리오 작성자 이메일

  final RxString folioMyPhone = ''.obs; // 포트폴리오 작성자 전화번호

  final RxString folioMyCareer = ''.obs; // 포트폴리오 작성자 근무 년차

  // 본인 간단 소개
  final RxString folioMyIntro = ''.obs;


  /// 포트폴리오 내용 변경 메서드
  void updateFolioName(String value) {
    folioName.value = value;
  }

  void updateFolioSummary(String value) {
    folioSummary.value = value;
  }

  void updateFolioMyName(String value) {
    folioMyName.value = value;
  }

  void updateFolioMyEmail(String value) {
    folioMyEmail.value = value;
  }

  void updateFolioMyPhone(String value) {
    folioMyPhone.value = value;
  }

  void updateFolioMyCareer(String value) {
    folioMyCareer.value = value;
  }

  void updateFolioMyIntro(String value) {
    folioMyIntro.value = value;
  }

  /// 포트폴리오 저장 메서드
  void saveFolio() async {

    print('포트폴리오 저장');
  }


}
