package com.spring.folio_back.repository;

import com.spring.folio_back.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 사용자 정의 Repository -> 커스텀이 필요한 메서드 정의를 UserRepositoryCustom 인터페이스에 정의하고, UserRepositoryImpl 구현체 작성
 */
public interface UserRepository extends JpaRepository<User, Long>, UserRepositoryCustom{

    User findByEmail(String email);

}
