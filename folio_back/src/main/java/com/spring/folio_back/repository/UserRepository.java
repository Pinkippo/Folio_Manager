package com.spring.folio_back.repository;

import com.spring.folio_back.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepository extends JpaRepository<User, Long>{

    User findByEmail(String email);

}
