package com.spring.folio_back.Controller;

import com.spring.folio_back.service.ResumeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/resume")
public class ResumeController {

    private final ResumeService resumeService;

    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    /// TODO : 이력서 등록

    /// TODO : 이력서 조회

}
