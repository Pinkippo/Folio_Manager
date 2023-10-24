package com.spring.folio_back.dto;


import lombok.Builder;
import lombok.Data;

/**
 * 로그인, 회원가입 응답을 위한 JWT 토큰 DTO
 */
@Data
@Builder
public class JwtResponse {

    private String jwtToken;
    private String username;



}
