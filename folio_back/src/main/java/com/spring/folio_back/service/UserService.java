package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.dto.JwtResponse;
import com.spring.folio_back.dto.RegisterRequestDTO;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

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
