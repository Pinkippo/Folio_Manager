package com.spring.folio_back.dto;

import lombok.Data;

@Data
public class RegisterRequestDTO {

        private String email;
        private String password;
        private String nickname;

}
