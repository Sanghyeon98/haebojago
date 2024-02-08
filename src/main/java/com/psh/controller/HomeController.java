package com.psh.controller;

import com.google.gson.Gson;
import com.psh.domain.vo.DataVO;
import com.psh.domain.vo.MemberVO;
import com.psh.domain.vo.WordVO;
import com.psh.service.PapagoService;
import com.psh.service.WordService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {
    private final WordService wordService;
    private final PapagoService papagoService;
    @RequestMapping(value = "/")
    public String home(String userId, Model model, HttpSession session){
        System.out.println("test");

        return "home";
    }

    @PostMapping(value = "/getAll")
    @ResponseBody
    public String getAll(HttpSession session){
        String jsonStr="";
        List<WordVO> list;

        // 세션에서 userId 가져오기
        MemberVO user = (MemberVO) session.getAttribute("user");
        System.out.println(user);

        // 세션에 사용자 정보가 없는 경우 빈 리스트로 초기화
        if (user == null) {
            list = Collections.emptyList();
            System.out.println(list);
        } else {
            Long userseq = user.getSeq();
            list = wordService.findAll(userseq);
        }

        jsonStr = new Gson().toJson(list);
        return jsonStr;
    }
    @PostMapping(value = "/translate")
    @ResponseBody
    public String translate(@RequestParam String s, @RequestParam String source, @RequestParam String target){
        return papagoService.getTransSentence(s,source,target);
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
