package com.spring.folio_back.dto.comment;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentRequestDTO {

    private long uid;
    private long bid;
    private String content;

}
