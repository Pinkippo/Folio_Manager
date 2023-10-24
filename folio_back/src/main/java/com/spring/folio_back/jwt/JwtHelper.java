package com.spring.folio_back.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;
import org.springframework.beans.factory.annotation.Value;

/**
 * JwtHelper - JWT 토큰을 생성하고 검증
 */
@Component
public class JwtHelper {

    /**
     * jwtKey - application.yml에 설정한 jwt_key 값
     */
    @Value("${jwt_key}")
    private String jwtKey;

    /**
     * JWT 토큰의 유효시간 3600 * 60 * 60 = 150일
     */
    public static final long JWT_TOKEN_VALIDITY = 3600 * 60 * 60;

    /**
     * getUsernameFromToken() - JWT 토큰에서 username을 추출
     */
    public String getUsernameFromToken(String token) {
        return getClaimFromToken(token, Claims::getSubject);
    }

    /**
     * getExpirationDateFromToken() - JWT 토큰에서 만료일자를 추출
     */
    public Date getExpirationDateFromToken(String token) {
        return getClaimFromToken(token, Claims::getExpiration);
    }

    /**
     * getClaimFromToken() - JWT 토큰에서 정보 추출
     */
    public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToken(token);
        return claimsResolver.apply(claims);
    }

    /**
     * getAllClaimsFromToken() - JWT 토큰에서 모든 정보 추출
     */
    private Claims getAllClaimsFromToken(String token) {
        return Jwts.parser().setSigningKey(jwtKey).parseClaimsJws(token).getBody();
    }

    /**
     * isTokenExpired() - JWT 토큰이 만료되었는지 확인
     */
    private Boolean isTokenExpired(String token) {
        final Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    /**
     * generateToken() - JWT 토큰 생성
     */
    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        return doGenerateToken(claims, userDetails.getUsername());
    }

    /**
     * doGenerateToken() - JWT 토큰 생성
     */
    private String doGenerateToken(Map<String, Object> claims, String subject) {

        return Jwts.builder().setClaims(claims).setSubject(subject).setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY * 1000))
                .signWith(SignatureAlgorithm.HS512, jwtKey).compact();
    }

    /**
     * validateToken() - JWT 토큰 검증
     */
    public Boolean validateToken(String token, UserDetails userDetails) {
        final String username = getUsernameFromToken(token);
        return (username.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }


}