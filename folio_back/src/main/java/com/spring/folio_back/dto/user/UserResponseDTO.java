package com.spring.folio_back.dto.user;

import com.spring.folio_back.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserResponseDTO {

    private long uid;

    private String email;

    private String nickname;

    public UserResponseDTO(User user){
        this.uid = user.getUid();
        this.email = user.getEmail();
        this.nickname = user.getNickname();
    }

}
