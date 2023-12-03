package com.spring.folio_back.Controller;

import com.spring.folio_back.dto.resume.ResumeRequestDTO;
import com.spring.folio_back.dto.resume.ResumeResponseDTO;
import com.spring.folio_back.httpReturn.DefaultRes;
import com.spring.folio_back.httpReturn.StatusCode;
import com.spring.folio_back.service.ResumeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/resume")
public class ResumeController {

    private final ResumeService resumeService;

    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @PostMapping("/write")
    public ResponseEntity<DefaultRes<Boolean>> WriteResume(@RequestBody ResumeRequestDTO resumeRequestDTO){
        boolean isWrite = resumeService.ResumeWrite(resumeRequestDTO);
        if(isWrite){
            return ResponseEntity.ok(DefaultRes.res(StatusCode.OK, "이력서 작성 성공", true));
        }else{
            return ResponseEntity.ok(DefaultRes.res(StatusCode.DB_ERROR, "이력서 작성 실패", false));
        }
    }

   // 유저 이메일로 이력서 조회
    @GetMapping("/read/{email}")
    public ResponseEntity<DefaultRes<ResumeResponseDTO>> ReadResume(@PathVariable("email") String email){
        ResumeResponseDTO resumeRequestDTO = resumeService.ReadResume(email);
        if(resumeRequestDTO == null){
            return ResponseEntity.ok(DefaultRes.res(StatusCode.NOT_FOUND, "이력서 조회 실패", null));
        }else{
            return ResponseEntity.ok(DefaultRes.res(StatusCode.OK, "이력서 조회 성공", resumeRequestDTO));
        }
    }


}
