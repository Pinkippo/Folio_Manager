package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // 이 메서드는 주어진 username으로 사용자 정보를 가져오는 역할을 합니다.
        // 실제로는 데이터베이스 또는 다른 데이터 저장소에서 사용자 정보를 검색해야 합니다.
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
