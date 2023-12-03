package com.spring.folio_back.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

/**
 * 이력서 엔티티
 */
@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Resume {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rid")
    private Long rid;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "uid")
    private User user;

    @Column(name = "resumeName")
    private String resumeName;

    @Column(name = "resumeSubtitle")
    private String resumeSubtitle;

    @Column(name = "resumeUserName")
    private String resumeUserName;

    @Column(name = "resumeUserEmail")
    private String resumeUserEmail;

    @Column(name = "resumeUserPhone")
    private String resumeUserPhone;

    @Column(name = "resumeUserYear")
    private String resumeUserYear;

    @Column(name = "resumeUserSelf")
    private String resumeUserSelf;

    @Column(name = "resumeUserStack")
    private String resumeUserStack;

    @Column(name = "resumeUserProject1")
    private String resumeUserProject1;

    @Column(name = "resumeUserProject1Date")
    private String resumeUserProject1Date;

    @Column(name = "resumeUserProject1Stack")
    private String resumeUserProject1Stack;

    @Column(name = "resumeUserProject1Content")
    private String resumeUserProject1Content;

    @Column(name = "resumeUserProject2")
    private String resumeUserProject2;

    @Column(name = "resumeUserProject2Date")
    private String resumeUserProject2Date;

    @Column(name = "resumeUserProject2Stack")
    private String resumeUserProject2Stack;

    @Column(name = "resumeUserProject2Content")
    private String resumeUserProject2Content;

    @Column(name = "resumeUserProject3")
    private String resumeUserProject3;

    @Column(name = "resumeUserProject3Date")
    private String resumeUserProject3Date;

    @Column(name = "resumeUserProject3Stack")
    private String resumeUserProject3Stack;

    @Column(name = "resumeUserProject3Content")
    private String resumeUserProject3Content;

    @Column(name = "resumeUserProject4")
    private String resumeUserProject4;

    @Column(name = "resumeUserProject4Date")
    private String resumeUserProject4Date;

    @Column(name = "resumeUserProject4Stack")
    private String resumeUserProject4Stack;

    @Column(name = "resumeUserProject4Content")
    private String resumeUserProject4Content;

    @Column(name = "resumeUserEtc1")
    private String resumeUserEtc1;

    @Column(name = "resumeUserEtc1Date")
    private String resumeUserEtc1Date;

    @Column(name = "resumeUserEtc1Content")
    private String resumeUserEtc1Content;

    @Column(name = "resumeUserEtc2")
    private String resumeUserEtc2;

    @Column(name = "resumeUserEtc2Date")
    private String resumeUserEtc2Date;

    @Column(name = "resumeUserEtc2Content")
    private String resumeUserEtc2Content;

    @Column(name = "resumeUserEtc3")
    private String resumeUserEtc3;

    @Column(name = "resumeUserEtc3Date")
    private String resumeUserEtc3Date;

    @Column(name = "resumeUserEtc3Content")
    private String resumeUserEtc3Content;

    @Column(name = "resumeUserEtc4")
    private String resumeUserEtc4;

    @Column(name = "resumeUserEtc4Date")
    private String resumeUserEtc4Date;

    @Column(name = "resumeUserEtc4Content")
    private String resumeUserEtc4Content;

    @Column(name = "resumeUserEducation1")
    private String resumeUserEducation1;

    @Column(name = "resumeUserEducation1Date")
    private String resumeUserEducation1Date;

    @Column(name = "resumeUserEducation1Content")
    private String resumeUserEducation1Content;

    @Column(name = "resumeUserEducation1Special")
    private String resumeUserEducation1Special;

    @Column(name = "resumeUserEducation2")
    private String resumeUserEducation2;

    @Column(name = "resumeUserEducation2Date")
    private String resumeUserEducation2Date;

    @Column(name = "resumeUserEducation2Content")
    private String resumeUserEducation2Content;

    @Column(name = "resumeUserEducation2Special")
    private String resumeUserEducation2Special;

    @Column(name = "resumeUserEducation3")
    private String resumeUserEducation3;

    @Column(name = "resumeUserEducation3Date")
    private String resumeUserEducation3Date;

    @Column(name = "resumeUserEducation3Content")
    private String resumeUserEducation3Content;

    @Column(name = "resumeUserEducation3Special")
    private String resumeUserEducation3Special;

    @Column(name = "resumeUserEducation4")
    private String resumeUserEducation4;

    @Column(name = "resumeUserEducation4Date")
    private String resumeUserEducation4Date;

    @Column(name = "resumeUserEducation4Content")
    private String resumeUserEducation4Content;

    @Column(name = "resumeUserEducation4Special")
    private String resumeUserEducation4Special;

}