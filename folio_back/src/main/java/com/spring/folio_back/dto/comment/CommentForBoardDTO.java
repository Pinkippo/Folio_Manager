package com.spring.folio_back.dto.comment;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;
@Data
@AllArgsConstructor
public class CommentForBoardDTO {

    private String nickname;
    private Date writeDate;
    private String content;

}
