package com.psh.controller;

import com.google.gson.Gson;
import com.psh.domain.vo.*;
import com.psh.service.GoogleTranslationService;
import com.psh.service.PapagoService;
import com.psh.service.WordService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {
    private final WordService wordService;
    private final PapagoService papagoService;
    private final GoogleTranslationService googleTranslationService;
    @GetMapping(value = "/")
    public String home(String userId, Model model, HttpSession session, Criteria criteria){
//        System.out.println("test");
//        List<WordVO> list;
//
//        DataVO dataVO = new DataVO();
//        // 세션에서 userId 가져오기
//        MemberVO user = (MemberVO) session.getAttribute("user");
//        System.out.println(user);
//
//        // 세션에 사용자 정보가 없는 경우 빈 리스트로 초기화
//        if (user == null) {
//            list = Collections.emptyList();
//            System.out.println(list);
//        } else {
//            Long userseq = user.getSeq();
//            list = wordService.findAll(userseq,criteria );
//            model.addAttribute("pageDTO",new PageDTO(criteria, wordService.selectCountAll(user.getSeq())));
//        }
//        log.info("!!!!!!!!!!!!!!!!!!!!"+list.toString());
//
//
//        model.addAttribute("list",list);


        return "home";
    }

    @PostMapping(value = "/getAll")
    @ResponseBody
    public String getAll(HttpSession session, Criteria criteria){
        String jsonStr="";
        List<WordVO> list;

        DataVO dataVO = new DataVO();
        // 세션에서 userId 가져오기
        MemberVO user = (MemberVO) session.getAttribute("user");
        System.out.println(user);

        // 세션에 사용자 정보가 없는 경우 빈 리스트로 초기화
        if (user == null) {
            list = Collections.emptyList();
            System.out.println(list);
        } else {
            Long userseq = user.getSeq();
            list = wordService.findAll(userseq, criteria);
        }

        dataVO.setDataList(list);

        jsonStr = new Gson().toJson(dataVO);
        return jsonStr;
    }
    @PostMapping(value = "/translate")
    @ResponseBody
    public String translate(@RequestParam String s, @RequestParam String source, @RequestParam String target){
        return googleTranslationService.TranslateService(s,source,target);
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public String add(WordVO wordVO,HttpSession httpSession){

        MemberVO user = (MemberVO) httpSession.getAttribute("user");
        System.out.println(user);

        if(user != null) {

            wordVO.setMemberSeq(user.getSeq());
            int result = wordService.save(wordVO);

            DataVO dataVO = new DataVO();

            if (result == 10) {
                dataVO.setMsgId("10");
                dataVO.setContents("등록되었습니다.");
            } else {
                dataVO.setMsgId("20");
                dataVO.setContents("등록에 실패하였습니다.");
            }
            String jsonStr=new Gson().toJson(dataVO);

            return jsonStr;
        }else {

            String jsonStr=new Gson().toJson(wordVO);
            return jsonStr;
        }

    }
}
