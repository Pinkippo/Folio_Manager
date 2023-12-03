package com.spring.folio_back.repository.resume;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.spring.folio_back.entity.Resume;
import com.spring.folio_back.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import static com.spring.folio_back.entity.QResume.resume;
import static com.spring.folio_back.entity.QUser.user;

/**
 * ResumeRespositoryImpl - Querydsl 를 사용해 세부 기능이 구현된 메서드를 작성
 */
@RequiredArgsConstructor
@Repository
public class ResumeRespositoryImpl implements ResumeRespositoryCustom {

    private final JPAQueryFactory jpaQueryFactory;


}
