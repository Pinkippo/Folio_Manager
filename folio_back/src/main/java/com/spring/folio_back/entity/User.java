package com.spring.folio_back.entity;

import com.spring.folio_back.constant.Role;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

/**
 * 유저 엔티티
 */
@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uid")
    private Long uid;

    @Column(unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String nickname;

    @Enumerated(EnumType.STRING)
    private Role role;

    @OneToMany(mappedBy = "user", orphanRemoval = true)
    private List<Board> boards;

    @OneToMany(mappedBy = "user", orphanRemoval = true)
    private List<Resume> resumes;

    /**
     * UserDetails 인터페이스의 메소드 구현
     */

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of((GrantedAuthority) () -> this.role.name());
    }

    @Override
    public String getUsername() {
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; // 계정이 만료되지 않았는지 리턴합니다. (true: 만료안됨)
    }

    @Override
    public boolean isAccountNonLocked() {
        return true; // 계정이 잠겨있지 않았는지 리턴합니다. (true: 잠기지 않음)
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true; // 계정의 비밀번호가 만료되지 않았는지 리턴합니다. (true: 만료안됨)
    }

    @Override
    public boolean isEnabled() {
        return true; // 계정이 활성화(사용가능)인지 리턴합니다. (true: 활성화)
    }
}
