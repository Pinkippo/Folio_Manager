import 'package:flutter/material.dart';
import 'package:folio_front/app/widget/folio_award.dart';
import 'package:folio_front/app/widget/folio_award_info.dart';
import 'package:folio_front/app/widget/folio_education_info.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';

import '../../data/model/folio_reqeust_model.dart';
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
  Future<bool> saveFolio(String uid, String jwtToken) async {
    final ResumeRequestDTO requestDTO = ResumeRequestDTO(
      uid : uid,
      resumeName: folioName.value,
      resumeSubtitle: folioSummary.value,
      resumeUserName: folioMyName.value,
      resumeUserEmail: folioMyEmail.value,
      resumeUserPhone: folioMyPhone.value,
      resumeUserYear: folioMyCareer.value,
      resumeUserSelf: folioMyIntro.value,
      resumeUserStack: folioMySkill.join(','),
      resumeUserEducation1: folioEducationList.length > 0 ? folioEducationList[0].name : '',
      resumeUserEducation1Date: folioEducationList.length > 0 ? folioEducationList[0].period : '',
      resumeUserEducation1Content: folioEducationList.length > 0 ? folioEducationList[0].content : '',
      resumeUserEducation1Special: folioEducationList.length > 0 ? folioEducationList[0].special : '',

      resumeUserEducation2: folioEducationList.length > 1 ? folioEducationList[1].name : '',
      resumeUserEducation2Date: folioEducationList.length > 1 ? folioEducationList[1].period : '',
      resumeUserEducation2Content: folioEducationList.length > 1 ? folioEducationList[1].content : '',
      resumeUserEducation2Special: folioEducationList.length > 1 ? folioEducationList[1].special : '',
      resumeUserEducation3: folioEducationList.length > 2 ? folioEducationList[2].name : '',
      resumeUserEducation3Date:  folioEducationList.length > 2 ? folioEducationList[2].period : '',
      resumeUserEducation3Content: folioEducationList.length > 2 ? folioEducationList[2].content : '',
      resumeUserEducation3Special: folioEducationList.length > 2 ? folioEducationList[2].special : '',
      resumeUserEducation4: folioEducationList.length > 3 ? folioEducationList[3].name : '',
      resumeUserEducation4Date: folioEducationList.length > 3 ? folioEducationList[3].period : '',
      resumeUserEducation4Content: folioEducationList.length > 3 ? folioEducationList[3].content : '',
      resumeUserEducation4Special: folioEducationList.length > 3 ? folioEducationList[3].special : '',
      resumeUserEtc1: folioLicenseList.length > 0 ? folioLicenseList[0].name : '',
      resumeUserEtc1Date: folioLicenseList.length > 0 ? folioLicenseList[0].period : '',
      resumeUserEtc1Content: folioLicenseList.length > 0 ? folioLicenseList[0].content : '',
      resumeUserEtc2: folioLicenseList.length > 1 ? folioLicenseList[1].name : '',
      resumeUserEtc2Date: folioLicenseList.length > 1 ? folioLicenseList[1].period : '',
      resumeUserEtc2Content: folioLicenseList.length > 1 ? folioLicenseList[1].content : '',
      resumeUserEtc3: folioLicenseList.length > 2 ? folioLicenseList[2].name : '',
      resumeUserEtc3Date: folioLicenseList.length > 2 ? folioLicenseList[2].period : '',
      resumeUserEtc3Content: folioLicenseList.length > 2 ? folioLicenseList[2].content : '',
      resumeUserEtc4: folioLicenseList.length > 3 ? folioLicenseList[3].name : '',
      resumeUserEtc4Date: folioLicenseList.length > 3 ? folioLicenseList[3].period : '',
      resumeUserEtc4Content: folioLicenseList.length > 3 ? folioLicenseList[3].content : '',
      resumeUserProject1: folioProjectList.length > 0 ? folioProjectList[0].name : '',
      resumeUserProject1Date: folioProjectList.length > 0 ? folioProjectList[0].period : '',
      resumeUserProject1Stack: folioProjectList.length > 0 ? folioProjectList[0].devStack.join(',') : '',
      resumeUserProject1Content: folioProjectList.length > 0 ? folioProjectList[0].content : '',
      resumeUserProject2: folioProjectList.length > 1 ? folioProjectList[1].name : '',
      resumeUserProject2Date: folioProjectList.length > 1 ? folioProjectList[1].period : '',
      resumeUserProject2Stack: folioProjectList.length > 1 ? folioProjectList[1].devStack.join(',') : '',
      resumeUserProject2Content: folioProjectList.length > 1 ? folioProjectList[1].content : '',
      resumeUserProject3: folioProjectList.length > 2 ? folioProjectList[2].name : '',
      resumeUserProject3Date: folioProjectList.length > 2 ? folioProjectList[2].period : '',
      resumeUserProject3Stack: folioProjectList.length > 2 ? folioProjectList[2].devStack.join(',') : '',
      resumeUserProject3Content: folioProjectList.length > 2 ? folioProjectList[2].content : '',
      resumeUserProject4: folioProjectList.length > 3 ? folioProjectList[3].name : '',
      resumeUserProject4Date: folioProjectList.length > 3 ? folioProjectList[3].period : '',
      resumeUserProject4Stack: folioProjectList.length > 3 ? folioProjectList[3].devStack.join(',') : '',
      resumeUserProject4Content: folioProjectList.length > 3 ? folioProjectList[3].content : '',

    );

    return await folioRepository.saveFolio(requestDTO, jwtToken);

  }

}
