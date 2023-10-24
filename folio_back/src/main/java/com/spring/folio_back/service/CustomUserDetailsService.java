package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * CustomUserDetailsService - 사용자의 정보를 불러오는 클래스
 */
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    /**
     * loadUserByUsername() - 사용자의 정보를 불러오는 메서드
     */
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new UsernameNotFoundException("UsernameNotFoundException");
        }else{
            return User.builder()
                    .email(user.getEmail())
                    .nickname(user.getNickname())
                    .password(user.getPassword())
                    .role(Role.USER) // 사용자의 권한(역할)을 설정합니다.
                    .build();
        }

    }
}
