package com.spring.folio_back.service;

import com.spring.folio_back.repository.resume.ResumeRepository;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * ResumeService - 요구사항 관련 비즈니스 로직을 처리하는 클래스
 */
@Service
@Transactional
@RequiredArgsConstructor
public class ResumeService {

    private final ResumeRepository resumeRepository;

    private final UserRepository userRepository;

}
