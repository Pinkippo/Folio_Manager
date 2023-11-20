package com.spring.folio_back.repository.board;

import com.spring.folio_back.entity.Board;

import java.util.List;

/**
 * BoardRepositoryCustom -> 커스텀이 필요한 메서드를 정의
 */
public interface BoardRepositoryCustom {

    List<Board> ReadBoardByDsl();

}
