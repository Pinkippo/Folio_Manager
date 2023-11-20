package com.spring.folio_back.repository.board;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.spring.folio_back.entity.Board;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.spring.folio_back.entity.QBoard.board;
import static com.spring.folio_back.entity.QComment.comment;

/**
 * BoardRepositoryImpl - Querydsl 를 사용해 세부 기능이 구현된 메서드를 작성
 */
@RequiredArgsConstructor
@Repository
public class BoardRepositoryImpl implements BoardRepositoryCustom{

    private final JPAQueryFactory jpaQueryFactory;

    @Override
    public List<Board> ReadBoardByDsl() {
        return jpaQueryFactory.selectFrom(board)
                .leftJoin(board.comments, comment).fetchJoin()
                .fetch();
    }

}
