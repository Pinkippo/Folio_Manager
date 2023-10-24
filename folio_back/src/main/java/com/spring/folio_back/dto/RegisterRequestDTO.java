package com.spring.folio_back.dto;

import lombok.Data;

/**
 * 회원가입을 위한 요청을 받는 DTO
 */
@Data
public class RegisterRequestDTO {

        private String email;
        private String password;
        private String nickname;

}
