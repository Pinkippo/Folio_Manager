package com.spring.folio_back.repository.resume;

import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * ResumeRespositoryImpl - Querydsl 를 사용해 세부 기능이 구현된 메서드를 작성
 */
@RequiredArgsConstructor
@Repository
public class ResumeRespositoryImpl {

    private final JPAQueryFactory jpaQueryFactory;

}
