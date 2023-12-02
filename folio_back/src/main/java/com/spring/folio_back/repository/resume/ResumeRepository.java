package com.spring.folio_back.repository.resume;


import com.spring.folio_back.entity.Resume;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 사용자 정의 Repository -> 커스텀이 필요한 메서드 정의를 ResumeRepositoryCustom 인터페이스에 정의하고, ResumeRepositoryImpl 구현체 작성
 */
public interface ResumeRepository extends JpaRepository<Resume, Long>, ResumeRespositoryCustom {

}
