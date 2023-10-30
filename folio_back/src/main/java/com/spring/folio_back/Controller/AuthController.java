package com.spring.folio_back.Controller;

import com.spring.folio_back.jwt.JwtHelper;
import com.spring.folio_back.dto.JwtRequest;
import com.spring.folio_back.dto.JwtResponse;
import com.spring.folio_back.dto.RegisterRequestDTO;
import com.spring.folio_back.service.CustomUserDetailsService;
import com.spring.folio_back.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

/**
 * 로그인 회원가입을 위한 컨트롤러
 */
@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticationManager manager;


    @Autowired
    private JwtHelper helper;

    private Logger logger = LoggerFactory.getLogger(AuthController.class);


    /**
     * 로그인 - 정보가 있는지 확인한 후 JWT 토큰 발급
     */
    @PostMapping("/login")
    public JwtResponse login(@RequestBody JwtRequest request) {

        this.doAuthenticate(request.getEmail(), request.getPassword());
        UserDetails userDetails = userDetailsService.loadUserByUsername(request.getEmail());

        String token = this.helper.generateToken(userDetails);

        JwtResponse response = JwtResponse.builder()
                .jwtToken(token)
                .username(userDetails.getUsername()).build();
        return response;
    }

    /**
     * 회원가입 - 정보가 있는지 확인한 후 JWT 토큰 발급
     */
    @PostMapping("/register")
    public ResponseEntity<JwtResponse> register(@RequestBody RegisterRequestDTO request) {
            long uid = userService.registerUser(request);

            UserDetails userDetails = userDetailsService.loadUserByUsername(request.getEmail());
            String token = this.helper.generateToken(userDetails);

            JwtResponse response = JwtResponse.builder()
                    .jwtToken(token)
                    .username(userDetails.getUsername()).build();

            return new ResponseEntity<>(response, HttpStatus.OK);
    }

    /**
     * 인증 - 아이디와 비밀번호가 일치하는지 확인
     */
    private void doAuthenticate(String email, String password) {

        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(email, password);
        try {
            manager.authenticate(authentication);

        } catch (BadCredentialsException e) {
            throw new BadCredentialsException(" Invalid Username or Password  !!");
        }

    }

    @ExceptionHandler(BadCredentialsException.class)
    public String exceptionHandler() {
        return "Credentials Invalid !!";
    }

}