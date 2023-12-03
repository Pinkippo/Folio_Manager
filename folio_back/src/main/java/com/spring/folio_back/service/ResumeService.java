package com.spring.folio_back.service;

import com.spring.folio_back.dto.resume.ResumeRequestDTO;
import com.spring.folio_back.dto.resume.ResumeResponseDTO;
import com.spring.folio_back.entity.Resume;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.resume.ResumeRepository;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * ResumeService - 요구사항 관련 비즈니스 로직을 처리하는 클래스
 */
@Service
@Transactional
@RequiredArgsConstructor
public class ResumeService {

    private final ResumeRepository resumeRepository;

    private final UserRepository userRepository;

    public Boolean ResumeWrite(ResumeRequestDTO resumeRequestDTO){
        Optional<User> user = userRepository.findById(resumeRequestDTO.getUid());
        if(user.isEmpty()) return false;

        Resume resume = Resume.builder()
                .user(user.get())
                .resumeName(resumeRequestDTO.getResumeName())
                .resumeSubtitle(resumeRequestDTO.getResumeSubtitle())
                .resumeUserName(resumeRequestDTO.getResumeUserName())
                .resumeUserEmail(resumeRequestDTO.getResumeUserEmail())
                .resumeUserPhone(resumeRequestDTO.getResumeUserPhone())
                .resumeUserYear(resumeRequestDTO.getResumeUserYear())
                .resumeUserSelf(resumeRequestDTO.getResumeUserSelf())
                .resumeUserStack(resumeRequestDTO.getResumeUserStack())
                .resumeUserProject1(resumeRequestDTO.getResumeUserProject1())
                .resumeUserProject1Content(resumeRequestDTO.getResumeUserProject1Content())
                .resumeUserProject1Date(resumeRequestDTO.getResumeUserProject1Date())
                .resumeUserProject1Stack(resumeRequestDTO.getResumeUserProject1Stack())
                .resumeUserProject2(resumeRequestDTO.getResumeUserProject2())
                .resumeUserProject2Content(resumeRequestDTO.getResumeUserProject2Content())
                .resumeUserProject2Date(resumeRequestDTO.getResumeUserProject2Date())
                .resumeUserProject2Stack(resumeRequestDTO.getResumeUserProject2Stack())
                .resumeUserProject3(resumeRequestDTO.getResumeUserProject3())
                .resumeUserProject3Content(resumeRequestDTO.getResumeUserProject3Content())
                .resumeUserProject3Date(resumeRequestDTO.getResumeUserProject3Date())
                .resumeUserProject3Stack(resumeRequestDTO.getResumeUserProject3Stack())
                .resumeUserProject4(resumeRequestDTO.getResumeUserProject4())
                .resumeUserProject4Content(resumeRequestDTO.getResumeUserProject4Content())
                .resumeUserProject4Date(resumeRequestDTO.getResumeUserProject4Date())
                .resumeUserProject4Stack(resumeRequestDTO.getResumeUserProject4Stack())
                .resumeUserEducation1(resumeRequestDTO.getResumeUserEducation1())
                .resumeUserEducation1Content(resumeRequestDTO.getResumeUserEducation1Content())
                .resumeUserEducation1Date(resumeRequestDTO.getResumeUserEducation1Date())
                .resumeUserEducation1Special(resumeRequestDTO.getResumeUserEducation1Special())
                .resumeUserEducation2(resumeRequestDTO.getResumeUserEducation2())
                .resumeUserEducation2Content(resumeRequestDTO.getResumeUserEducation2Content())
                .resumeUserEducation2Date(resumeRequestDTO.getResumeUserEducation2Date())
                .resumeUserEducation2Special(resumeRequestDTO.getResumeUserEducation2Special())
                .resumeUserEducation3(resumeRequestDTO.getResumeUserEducation3())
                .resumeUserEducation3Content(resumeRequestDTO.getResumeUserEducation3Content())
                .resumeUserEducation3Date(resumeRequestDTO.getResumeUserEducation3Date())
                .resumeUserEducation3Special(resumeRequestDTO.getResumeUserEducation3Special())
                .resumeUserEducation4(resumeRequestDTO.getResumeUserEducation4())
                .resumeUserEducation4Content(resumeRequestDTO.getResumeUserEducation4Content())
                .resumeUserEducation4Date(resumeRequestDTO.getResumeUserEducation4Date())
                .resumeUserEducation4Special(resumeRequestDTO.getResumeUserEducation4Special())
                .resumeUserEtc1(resumeRequestDTO.getResumeUserEtc1())
                .resumeUserEtc1Content(resumeRequestDTO.getResumeUserEtc1Content())
                .resumeUserEtc1Date(resumeRequestDTO.getResumeUserEtc1Date())
                .resumeUserEtc2(resumeRequestDTO.getResumeUserEtc2())
                .resumeUserEtc2Content(resumeRequestDTO.getResumeUserEtc2Content())
                .resumeUserEtc2Date(resumeRequestDTO.getResumeUserEtc2Date())
                .resumeUserEtc3(resumeRequestDTO.getResumeUserEtc3())
                .resumeUserEtc3Content(resumeRequestDTO.getResumeUserEtc3Content())
                .resumeUserEtc3Date(resumeRequestDTO.getResumeUserEtc3Date())
                .resumeUserEtc4(resumeRequestDTO.getResumeUserEtc4())
                .resumeUserEtc4Content(resumeRequestDTO.getResumeUserEtc4Content())
                .resumeUserEtc4Date(resumeRequestDTO.getResumeUserEtc4Date())
                .build();
        resumeRepository.save(resume);
        return true;
    }

    public ResumeResponseDTO ReadResume(String email) {

        User user = userRepository.findByEmail(email);
        if(user == null) return new ResumeResponseDTO();

        Resume resume = resumeRepository.findByUser_Email(user.getEmail());
        if(resume == null) return new ResumeResponseDTO();

        return ResumeResponseDTO.builder()
                .userNickeName(resume.getUser().getNickname())
                .resumeName(resume.getResumeName())
                .resumeSubtitle(resume.getResumeSubtitle())
                .resumeUserName(resume.getResumeUserName())
                .resumeUserEmail(resume.getResumeUserEmail())
                .resumeUserPhone(resume.getResumeUserPhone())
                .resumeUserYear(resume.getResumeUserYear())
                .resumeUserSelf(resume.getResumeUserSelf())
                .resumeUserStack(resume.getResumeUserStack())
                .resumeUserProject1(resume.getResumeUserProject1())
                .resumeUserProject1Content(resume.getResumeUserProject1Content())
                .resumeUserProject1Date(resume.getResumeUserProject1Date())
                .resumeUserProject1Stack(resume.getResumeUserProject1Stack())
                .resumeUserProject2(resume.getResumeUserProject2())
                .resumeUserProject2Content(resume.getResumeUserProject2Content())
                .resumeUserProject2Date(resume.getResumeUserProject2Date())
                .resumeUserProject2Stack(resume.getResumeUserProject2Stack())
                .resumeUserProject3(resume.getResumeUserProject3())
                .resumeUserProject3Content(resume.getResumeUserProject3Content())
                .resumeUserProject3Date(resume.getResumeUserProject3Date())
                .resumeUserProject3Stack(resume.getResumeUserProject3Stack())
                .resumeUserProject4(resume.getResumeUserProject4())
                .resumeUserProject4Content(resume.getResumeUserProject4Content())
                .resumeUserProject4Date(resume.getResumeUserProject4Date())
                .resumeUserProject4Stack(resume.getResumeUserProject4Stack())
                .resumeUserEducation1(resume.getResumeUserEducation1())
                .resumeUserEducation1Content(resume.getResumeUserEducation1Content())
                .resumeUserEducation1Date(resume.getResumeUserEducation1Date())
                .resumeUserEducation1Special(resume.getResumeUserEducation1Special())
                .resumeUserEducation2(resume.getResumeUserEducation2())
                .resumeUserEducation2Content(resume.getResumeUserEducation2Content())
                .resumeUserEducation2Date(resume.getResumeUserEducation2Date())
                .resumeUserEducation2Special(resume.getResumeUserEducation2Special())
                .resumeUserEducation3(resume.getResumeUserEducation3())
                .resumeUserEducation3Content(resume.getResumeUserEducation3Content())
                .resumeUserEducation3Date(resume.getResumeUserEducation3Date())
                .resumeUserEducation3Special(resume.getResumeUserEducation3Special())
                .resumeUserEducation4(resume.getResumeUserEducation4())
                .resumeUserEducation4Content(resume.getResumeUserEducation4Content())
                .resumeUserEducation4Date(resume.getResumeUserEducation4Date())
                .resumeUserEducation4Special(resume.getResumeUserEducation4Special())
                .resumeUserEtc1(resume.getResumeUserEtc1())
                .resumeUserEtc1Content(resume.getResumeUserEtc1Content())
                .resumeUserEtc1Date(resume.getResumeUserEtc1Date())
                .resumeUserEtc2(resume.getResumeUserEtc2())
                .resumeUserEtc2Content(resume.getResumeUserEtc2Content())
                .resumeUserEtc2Date(resume.getResumeUserEtc2Date())
                .resumeUserEtc3(resume.getResumeUserEtc3())
                .resumeUserEtc3Content(resume.getResumeUserEtc3Content())
                .resumeUserEtc3Date(resume.getResumeUserEtc3Date())
                .resumeUserEtc4(resume.getResumeUserEtc4())
                .resumeUserEtc4Content(resume.getResumeUserEtc4Content())
                .resumeUserEtc4Date(resume.getResumeUserEtc4Date())
                .build();
    }

}
