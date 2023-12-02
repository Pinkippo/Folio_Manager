import 'package:flutter/material.dart';
import 'package:folio_front/app/widget/folio_award.dart';
import 'package:folio_front/app/widget/folio_award_info.dart';
import 'package:folio_front/app/widget/folio_education_info.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';

import '../widget/folio_project_into.dart';


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

  final RxString folioMyIntro = ''.obs; // 포트폴리오 소개

  final RxList<String> folioMySkill = <String>[].obs; // 포트폴리오 기술 스택

  final TextEditingController devStackController = TextEditingController();

  final RxList<FolioEducationItem> folioEducationList = <FolioEducationItem>[].obs; // 포트폴리오 학력 정보

  final RxList<FolioAwardItem> folioLicenseList = <FolioAwardItem>[].obs; // 포트폴리오 자격증 정보

  final RxList<FolioProjectItem> folioProjectList = <FolioProjectItem>[].obs; // 포트폴리오 프로젝트 정보

  /// 기술 스택 리스트 String
  final RxList<String> folioSkillList = <String>[].obs;

  /// 이력서 이름과 요약이 모두 채워졌는지 확인
  bool get isFolioNameSummaryFilled => folioName.value != '' && folioSummary.value != '';

  /// 이력서 개인 정보 모두 채워졌는지 확인
  bool get isFolioMyInfoFilled => folioMyName.value != '' && folioMyEmail.value != '' && folioMyPhone.value != '' && folioMyCareer.value != '' && folioMyIntro.value != '';

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

  void updateFolioEducation(FolioEducationItem value) {
    folioEducationList.add(value);
  }

  void removeFolioEducation(FolioEducationItem value) {
    folioEducationList.remove(value);
  }

  void updateFolioLicense(FolioAwardItem value) {
    folioLicenseList.add(value);
  }

  void removeFolioLicense(FolioAwardItem value) {
    folioLicenseList.remove(value);
  }

  void updateFolioSkill(String value) {
    folioSkillList.add(value);
  }

  void removeFolioSkill(String value) {
    folioSkillList.remove(value);
  }

  void updateFolioMySkill(String value) {
    folioMySkill.add(value);
  }

  void removeFolioMySkill(String value) {
    folioMySkill.remove(value);
  }

  void updateFolioProject(FolioProjectItem value) {
    folioProjectList.add(value);
  }

  void removeFolioProject(FolioProjectItem value) {
    folioProjectList.remove(value);
  }

  /// 포트폴리오 저장 메서드
  void saveFolio() async {

    print('포트폴리오 저장');
  }


}
