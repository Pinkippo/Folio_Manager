package com.spring.folio_back.service;

import com.spring.folio_back.dto.comment.CommentRequestDTO;
import com.spring.folio_back.entity.Board;
import com.spring.folio_back.entity.Comment;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.board.BoardRepository;
import com.spring.folio_back.repository.comment.CommentRepository;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class CommentService {

    private final UserRepository userRepository;
    private final BoardRepository boardRepository;
    private final CommentRepository commentRepository;

    public Boolean CommentWirte(CommentRequestDTO commentRequestDTO, User user){
        Optional<Board> board = boardRepository.findById(commentRequestDTO.getBid());
        if(board.isEmpty())
            return false;
        Comment comment = new Comment(user, board.get(), commentRequestDTO.getContent());
        commentRepository.save(comment);
        return true;
    }
}
