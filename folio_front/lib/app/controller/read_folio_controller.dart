import 'package:folio_front/data/model/board_response_model.dart';
import 'package:folio_front/data/model/comment_request_model.dart';
import 'package:folio_front/data/model/folio_response_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../data/repository/folio_repository.dart';

class FolioReadController extends GetxController{

  final FolioRepository folioRepository;

  FolioReadController({required this.folioRepository});

  Rx<ResumeResponseDTO> resume = ResumeResponseDTO(
    userNickName: '',
    resumeName: '',
    resumeSubtitle: '',
    resumeUserName: '',
    resumeUserEmail: '',
    resumeUserPhone: '',
    resumeUserYear: '',
    resumeUserSelf: '',
    resumeUserStack: '',
    resumeUserProject1: '',
    resumeUserProject1Date: '',
    resumeUserProject1Stack: '',
    resumeUserProject1Content: '',
    resumeUserProject2: '',
    resumeUserProject2Date: '',
    resumeUserProject2Stack: '',
    resumeUserProject2Content: '',
    resumeUserProject3: '',
    resumeUserProject3Date: '',
    resumeUserProject3Stack: '',
    resumeUserProject3Content: '',
    resumeUserProject4: '',
    resumeUserProject4Date: '',
    resumeUserProject4Stack: '',
    resumeUserProject4Content: '',
    resumeUserEtc1: '',
    resumeUserEtc1Date: '',
    resumeUserEtc1Content: '',
    resumeUserEtc2: '',
    resumeUserEtc2Date: '',
    resumeUserEtc2Content: '',
    resumeUserEtc3: '',
    resumeUserEtc3Date: '',
    resumeUserEtc3Content: '',
    resumeUserEtc4: '',
    resumeUserEtc4Date: '',
    resumeUserEtc4Content: '',
    resumeUserEducation1: '',
    resumeUserEducation1Date: '',
    resumeUserEducation1Content: '',
    resumeUserEducation1Special: '',
    resumeUserEducation2: '',
    resumeUserEducation2Date: '',
    resumeUserEducation2Content: '',
    resumeUserEducation2Special: '',
    resumeUserEducation3: '',
    resumeUserEducation3Date: '',
    resumeUserEducation3Content: '',
    resumeUserEducation3Special: '',
    resumeUserEducation4: '',
    resumeUserEducation4Date: '',
    resumeUserEducation4Content: '',
    resumeUserEducation4Special: '',
  ).obs;


  @override
  void onInit() async {
    await loadFolio();
    super.onInit();
  }

  Future<void> loadFolio() async {
    try {
      final Map<String, dynamic> parameters = Get.parameters;
      String email = parameters['email'] ?? '';

      resume.value = await FolioRepository().loadTempFolio(email);

    } catch (error) {
      print(error);
    }
  }



}