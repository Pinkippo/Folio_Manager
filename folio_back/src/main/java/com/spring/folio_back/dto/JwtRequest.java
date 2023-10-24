package com.spring.folio_back.dto;

import lombok.Data;

/**
 * 로그인을 위한 요청을 받는 DTO
 */
@Data
public class JwtRequest {

    private String email;
    private String password;

}
