package com.spring.folio_back.dto.board;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BoardRequestDTO {

    private long uid;
    private String title;
    private String content;

}
