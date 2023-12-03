package com.spring.folio_back.dto.resume;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class ResumeRequestDTO {

        private long uid;

        private String resumeName;

        private String resumeSubtitle;

        private String resumeUserName;

        private String resumeUserEmail;

        private String resumeUserPhone;

        private String resumeUserYear;

        private String resumeUserSelf;

        private String resumeUserStack;


        private String resumeUserProject1;
        private String resumeUserProject1Date;
        private String resumeUserProject1Stack;
        private String resumeUserProject1Content;

        private String resumeUserProject2;
        private String resumeUserProject2Date;
        private String resumeUserProject2Stack;
        private String resumeUserProject2Content;

        private String resumeUserProject3;
        private String resumeUserProject3Date;
        private String resumeUserProject3Stack;
        private String resumeUserProject3Content;

        private String resumeUserProject4;
        private String resumeUserProject4Date;
        private String resumeUserProject4Stack;
        private String resumeUserProject4Content;

        private String resumeUserEtc1;
        private String resumeUserEtc1Date;
        private String resumeUserEtc1Content;

        private String resumeUserEtc2;
        private String resumeUserEtc2Date;
        private String resumeUserEtc2Content;

        private String resumeUserEtc3;
        private String resumeUserEtc3Date;
        private String resumeUserEtc3Content;

        private String resumeUserEtc4;
        private String resumeUserEtc4Date;
        private String resumeUserEtc4Content;

        private String resumeUserEducation1;
        private String resumeUserEducation1Date;
        private String resumeUserEducation1Content;
        private String resumeUserEducation1Special;

        private String resumeUserEducation2;
        private String resumeUserEducation2Date;
        private String resumeUserEducation2Content;
        private String resumeUserEducation2Special;

        private String resumeUserEducation3;
        private String resumeUserEducation3Date;
        private String resumeUserEducation3Content;
        private String resumeUserEducation3Special;

        private String resumeUserEducation4;
        private String resumeUserEducation4Date;
        private String resumeUserEducation4Content;
        private String resumeUserEducation4Special;
}
