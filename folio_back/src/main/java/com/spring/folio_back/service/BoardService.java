package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.dto.RegisterRequestDTO;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.board.BoardRepository;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


/**
 * BoardService - 요구사항 관련 비즈니스 로직을 처리하는 클래스
 */
@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    private final UserRepository userRepository;

    // TODO : 게시물 작성 서비스

    // TODO : 게시물 삭제 서비스

    // TODO : 게시물 수정 서비스

}
