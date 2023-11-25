package com.spring.folio_back.Controller;


import com.spring.folio_back.dto.board.BoardRequestDTO;
import com.spring.folio_back.dto.board.SpecBoardResponseDTO;
import com.spring.folio_back.httpReturn.DefaultRes;
import com.spring.folio_back.httpReturn.ResponseMessage;
import com.spring.folio_back.httpReturn.StatusCode;
import com.spring.folio_back.service.BoardService;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 요구사항 게시판을 위한 컨트롤러
 */
@RestController
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    /// 글 작성
    @PostMapping("/write")
    public ResponseEntity<DefaultRes<Boolean>> WriteBoard(@RequestBody BoardRequestDTO boardRequestDTO){
         boolean isWrite = boardService.BoardWrite(boardRequestDTO);
        if(isWrite){
            return new ResponseEntity<>(DefaultRes.res(StatusCode.OK, ResponseMessage.WRITE_BOARD, true), HttpStatus.OK);
        }else{
            return new ResponseEntity<>(DefaultRes.res(StatusCode.DB_ERROR,ResponseMessage.NOT_FOUND_USER, false), HttpStatus.OK);
        }
    }

    // 전체 글 조회
    @GetMapping("/read")
    public ResponseEntity<DefaultRes<List<SpecBoardResponseDTO>>> ReadBoard(@RequestParam("page") Integer page, @RequestParam(value = "size", defaultValue = "20", required = false) Integer size){
        PageRequest pageRequest = PageRequest.of(page, size);
        try {
            List<SpecBoardResponseDTO> spec = boardService.ReadBoard(pageRequest);
            if(spec != null){
                return new ResponseEntity<>(DefaultRes.res(StatusCode.OK,ResponseMessage.READ_SUCCESS, spec), HttpStatus.OK);
            }else{
                return new ResponseEntity<>(DefaultRes.res(StatusCode.OK,ResponseMessage.NOT_CREATE_BOARD, null), HttpStatus.OK);
            }
        }catch (Exception e){
            return new ResponseEntity<>(DefaultRes.res(StatusCode.DB_ERROR,ResponseMessage.DB_ERROR, null), HttpStatus.OK);
        }
    }

}
