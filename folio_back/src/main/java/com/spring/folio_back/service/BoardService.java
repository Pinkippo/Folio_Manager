package com.spring.folio_back.service;

import com.spring.folio_back.constant.Role;
import com.spring.folio_back.dto.RegisterRequestDTO;
import com.spring.folio_back.dto.board.BoardRequestDTO;
import com.spring.folio_back.dto.board.SpecBoardResponseDTO;
import com.spring.folio_back.dto.comment.CommentForBoardDTO;
import com.spring.folio_back.dto.user.UserResponseDTO;
import com.spring.folio_back.entity.Board;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.repository.board.BoardRepository;
import com.spring.folio_back.repository.user.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


/**
 * BoardService - 요구사항 관련 비즈니스 로직을 처리하는 클래스
 */
@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    private final UserRepository userRepository;

    public Boolean BoardWrite(BoardRequestDTO boardRequestDTO){
        Optional<User> user = userRepository.findById(boardRequestDTO.getUid());
        if(user.isEmpty()) return false;
        Board board = Board.builder()
                .user(user.get())
                .title(boardRequestDTO.getTitle())
                .content(boardRequestDTO.getContent())
                .build();
        boardRepository.save(board);
        return true;
    }

    public List<SpecBoardResponseDTO> ReadBoard(PageRequest pageRequest){
        List<Board> boardEntities = boardRepository.ReadBoardByDsl(pageRequest);
        List<SpecBoardResponseDTO> result = new ArrayList<>();

        for (Board board: boardEntities) {
            List<CommentForBoardDTO> comments = board.getComments().stream().map(
                    comment -> new CommentForBoardDTO(comment.getUser().getNickname(), comment.getWriteDate(), comment.getContent())
            ).toList();

            SpecBoardResponseDTO specBoardResponseDTO = SpecBoardResponseDTO.builder()
                    .bid(board.getBid())
                    .userResponseDTO(new UserResponseDTO(board.getUser()))
                    .writeDate(board.getWriteDate())
                    .title(board.getTitle())
                    .content(board.getContent())
                    .comments(comments)
                    .build();

            result.add(specBoardResponseDTO);

        }

        return result;
    }

    // TODO : 게시물 삭제 서비스

    // TODO : 게시물 수정 서비스

}
