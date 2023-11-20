package com.spring.folio_back.Controller;

import com.spring.folio_back.dto.comment.CommentRequestDTO;
import com.spring.folio_back.entity.User;
import com.spring.folio_back.httpReturn.DefaultRes;
import com.spring.folio_back.httpReturn.ResponseMessage;
import com.spring.folio_back.httpReturn.StatusCode;
import com.spring.folio_back.service.CommentService;
import com.spring.folio_back.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.Optional;

@RestController
@RequestMapping("/comment")
public class CommentController {

    private final CommentService commentService;
    private final UserService userService;

    public CommentController(CommentService commentService, UserService userService) {
        this.commentService = commentService;
        this.userService = userService;
    }

    @PostMapping("/write")
    public ResponseEntity<DefaultRes<Boolean>> WriteComment(@RequestBody CommentRequestDTO commentRequestDTO){
        // 사용자가 없으면 유저 없음
        Optional<User> user = userService.FindUser(commentRequestDTO.getUid());
        if(user.isEmpty())  return new ResponseEntity<>(DefaultRes.res(StatusCode.OK, ResponseMessage.NOT_FOUND_USER, null), HttpStatus.OK);
        // 댓글 작성
        boolean isWrite = commentService.CommentWirte(commentRequestDTO,user.get());
        if(isWrite) {
            System.out.println("댓글 작성 성공");
            return new ResponseEntity<>(DefaultRes.res(StatusCode.OK, ResponseMessage.WRITE_COMMENT, true), HttpStatus.OK);
        }else{
            System.out.println("댓글 작성 실패");
            return new ResponseEntity<>(DefaultRes.res(StatusCode.OK, ResponseMessage.NOT_CREATE_BOARD, false), HttpStatus.OK);
        }

    }

}
