package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.dto.RegisterRequestDTO;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * UserService - 사용자 관련 비즈니스 로직을 처리하는 클래스
 */
@Service
@Transactional
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    /**
     * registerUser() - 사용자 회원가입 엔티티 생성 후 저장
     */
    public long registerUser(RegisterRequestDTO registerRequestDTO){

        User user = User.builder()
                .email(registerRequestDTO.getEmail())
                .password(passwordEncoder.encode(registerRequestDTO.getPassword()))
                .nickname(registerRequestDTO.getNickname())
                .role(Role.USER)
                .build();
        userRepository.save(user);

        return user.getUid();

    }


}
