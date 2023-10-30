package com.spring.folio_back.Controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 플러터 연결 테스트용 컨트롤러
 */
@RestController
@RequestMapping("/unit")
public class UnitController {

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

}
