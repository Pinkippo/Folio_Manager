class ResumeRequestDTO {

  String uid;
  String resumeName;
  String resumeSubtitle;
  String resumeUserName;
  String resumeUserEmail;
  String resumeUserPhone;
  String resumeUserYear;
  String resumeUserSelf;
  String resumeUserStack;

  String resumeUserProject1;
  String resumeUserProject1Date;
  String resumeUserProject1Stack;
  String resumeUserProject1Content;

  String resumeUserProject2;
  String resumeUserProject2Date;
  String resumeUserProject2Stack;
  String resumeUserProject2Content;

  String resumeUserProject3;
  String resumeUserProject3Date;
  String resumeUserProject3Stack;
  String resumeUserProject3Content;

  String resumeUserProject4;
  String resumeUserProject4Date;
  String resumeUserProject4Stack;
  String resumeUserProject4Content;

  String resumeUserEtc1;
  String resumeUserEtc1Date;
  String resumeUserEtc1Content;

  String resumeUserEtc2;
  String resumeUserEtc2Date;
  String resumeUserEtc2Content;

  String resumeUserEtc3;
  String resumeUserEtc3Date;
  String resumeUserEtc3Content;

  String resumeUserEtc4;
  String resumeUserEtc4Date;
  String resumeUserEtc4Content;

  String resumeUserEducation1;
  String resumeUserEducation1Date;
  String resumeUserEducation1Content;
  String resumeUserEducation1Special;

  String resumeUserEducation2;
  String resumeUserEducation2Date;
  String resumeUserEducation2Content;
  String resumeUserEducation2Special;

  String resumeUserEducation3;
  String resumeUserEducation3Date;
  String resumeUserEducation3Content;
  String resumeUserEducation3Special;

  String resumeUserEducation4;
  String resumeUserEducation4Date;
  String resumeUserEducation4Content;
  String resumeUserEducation4Special;


  ResumeRequestDTO({
    required this.uid,
    required this.resumeName,
    required this.resumeSubtitle,
    required this.resumeUserName,
    required this.resumeUserEmail,
    required this.resumeUserPhone,
    required this.resumeUserYear,
    required this.resumeUserSelf,
    required this.resumeUserStack,
    required this.resumeUserProject1,
    required this.resumeUserProject1Date,
    required this.resumeUserProject1Stack,
    required this.resumeUserProject1Content,
    required this.resumeUserProject2,
    required this.resumeUserProject2Date,
    required this.resumeUserProject2Stack,
    required this.resumeUserProject2Content,
    required this.resumeUserProject3,
    required this.resumeUserProject3Date,
    required this.resumeUserProject3Stack,
    required this.resumeUserProject3Content,
    required this.resumeUserProject4,
    required this.resumeUserProject4Date,
    required this.resumeUserProject4Stack,
    required this.resumeUserProject4Content,
    required this.resumeUserEtc1,
    required this.resumeUserEtc1Date,
    required this.resumeUserEtc1Content,
    required this.resumeUserEtc2,
    required this.resumeUserEtc2Date,
    required this.resumeUserEtc2Content,
    required this.resumeUserEtc3,
    required this.resumeUserEtc3Date,
    required this.resumeUserEtc3Content,
    required this.resumeUserEtc4,
    required this.resumeUserEtc4Date,
    required this.resumeUserEtc4Content,
    required this.resumeUserEducation1,
    required this.resumeUserEducation1Date,
    required this.resumeUserEducation1Content,
    required this.resumeUserEducation1Special,
    required this.resumeUserEducation2,
    required this.resumeUserEducation2Date,
    required this.resumeUserEducation2Content,
    required this.resumeUserEducation2Special,
    required this.resumeUserEducation3,
    required this.resumeUserEducation3Date,
    required this.resumeUserEducation3Content,
    required this.resumeUserEducation3Special,
    required this.resumeUserEducation4,
    required this.resumeUserEducation4Date,
    required this.resumeUserEducation4Content,
    required this.resumeUserEducation4Special,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'resumeName': resumeName,
      'resumeSubtitle': resumeSubtitle,
      'resumeUserName': resumeUserName,
      'resumeUserEmail': resumeUserEmail,
      'resumeUserPhone': resumeUserPhone,
      'resumeUserYear': resumeUserYear,
      'resumeUserSelf': resumeUserSelf,
      'resumeUserStack': resumeUserStack,
      'resumeUserProject1': resumeUserProject1,
      'resumeUserProject1Date': resumeUserProject1Date,
      'resumeUserProject1Stack': resumeUserProject1Stack,
      'resumeUserProject1Content': resumeUserProject1Content,
      'resumeUserProject2': resumeUserProject2,
      'resumeUserProject2Date': resumeUserProject2Date,
      'resumeUserProject2Stack': resumeUserProject2Stack,
      'resumeUserProject2Content': resumeUserProject2Content,
      'resumeUserProject3': resumeUserProject3,
      'resumeUserProject3Date': resumeUserProject3Date,
      'resumeUserProject3Stack': resumeUserProject3Stack,
      'resumeUserProject3Content': resumeUserProject3Content,
      'resumeUserProject4': resumeUserProject4,
      'resumeUserProject4Date': resumeUserProject4Date,
      'resumeUserProject4Stack': resumeUserProject4Stack,
      'resumeUserProject4Content': resumeUserProject4Content,
      'resumeUserEtc1': resumeUserEtc1,
      'resumeUserEtc1Date': resumeUserEtc1Date,
      'resumeUserEtc1Content': resumeUserEtc1Content,
      'resumeUserEtc2': resumeUserEtc2,
      'resumeUserEtc2Date': resumeUserEtc2Date,
      'resumeUserEtc2Content': resumeUserEtc2Content,
      'resumeUserEtc3': resumeUserEtc3,
      'resumeUserEtc3Date': resumeUserEtc3Date,
      'resumeUserEtc3Content': resumeUserEtc3Content,
      'resumeUserEtc4': resumeUserEtc4,
      'resumeUserEtc4Date': resumeUserEtc4Date,
      'resumeUserEtc4Content': resumeUserEtc4Content,
      'resumeUserEducation1': resumeUserEducation1,
      'resumeUserEducation1Date': resumeUserEducation1Date,
      'resumeUserEducation1Content': resumeUserEducation1Content,
      'resumeUserEducation1Special': resumeUserEducation1Special,
      'resumeUserEducation2': resumeUserEducation2,
      'resumeUserEducation2Date': resumeUserEducation2Date,
      'resumeUserEducation2Content': resumeUserEducation2Content,
      'resumeUserEducation2Special': resumeUserEducation2Special,
      'resumeUserEducation3': resumeUserEducation3,
      'resumeUserEducation3Date': resumeUserEducation3Date,
      'resumeUserEducation3Content': resumeUserEducation3Content,
      'resumeUserEducation3Special': resumeUserEducation3Special,
      'resumeUserEducation4': resumeUserEducation4,
      'resumeUserEducation4Date': resumeUserEducation4Date,
      'resumeUserEducation4Content': resumeUserEducation4Content,
      'resumeUserEducation4Special': resumeUserEducation4Special,
    };
  }

}
