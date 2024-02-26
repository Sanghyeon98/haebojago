package com.psh.controller;

import com.google.gson.Gson;
import com.psh.domain.vo.*;
import com.psh.service.PapagoService;
import com.psh.service.WordService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
public class WordController {
    private final WordService wordService;
    private final PapagoService papagoService;

    @GetMapping(value = "/getAll/{page}/{amount}")
    @ResponseBody
    public ResponseEntity<DataVO> getAll(HttpSession session, @PathVariable("page") int page , @PathVariable("amount") int amount,@RequestParam(value = "type", required = false) String type,
                                         @RequestParam(value = "keyword", required = false) String keyword){

        List<WordVO> list;
        DataVO dataVO = new DataVO();
        Criteria cri;

        System.out.println("!@#@!##!@#!@#!@#!@#!@#!@#!@#@!#!@#"+page);
        ;
        // 세션에서 userId 가져오기
        MemberVO user = (MemberVO) session.getAttribute("user");
        System.out.println(user);

        // 검색 조건이 있는 경우 Criteria 객체에 추가
        if (type != null && keyword != null) {
            cri = new Criteria(page, amount, type, keyword);
        } else {
            cri = new Criteria(page, amount);
        }


        // 세션에 사용자 정보가 없는 경우 빈 리스트로 초기화
        if (user == null) {
            list = Collections.emptyList();
            //System.out.println(list);

            dataVO.setDataList(list);
        } else {
            Long userseq = user.getSeq();
            list = wordService.findAll(userseq, cri);

            dataVO.setTotal(wordService.selectCountAll(user.getSeq(), cri));
            dataVO.setDataList(list);
        }

;
        return new ResponseEntity<>(dataVO,HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<?> deleteWords(@RequestBody List<Long> wordIds) {
        try {
            // 단어 ID 리스트를 서비스로 전달하여 삭제 수행
            int result=wordService.deleteAll(wordIds);
            String message;

            if(result==10){
                message = "성공";
            }else {
                message ="실패";
            }

            DataVO dataVO = new DataVO();
            dataVO.setContents(message);
            return ResponseEntity.ok().body(dataVO);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete words: " + e.getMessage());
        }
    }
}
