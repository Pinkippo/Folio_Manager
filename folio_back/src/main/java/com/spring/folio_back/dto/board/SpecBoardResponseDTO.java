package com.spring.folio_back.dto.board;

import com.spring.folio_back.dto.comment.CommentForBoardDTO;
import com.spring.folio_back.dto.user.UserResponseDTO;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
public class SpecBoardResponseDTO {

    private long bid;
    private UserResponseDTO userResponseDTO;
    private Date writeDate;
    private String title;
    private String content;
    private int view;
    private List<CommentForBoardDTO> comments;

    @Builder
    public SpecBoardResponseDTO(long bid, UserResponseDTO userResponseDTO, Date writeDate, String title, String content, int view, List<CommentForBoardDTO> comments) {
        this.bid = bid;
        this.userResponseDTO = userResponseDTO;
        this.writeDate = writeDate;
        this.title = title;
        this.content = content;
        this.comments = comments;
    }


}
