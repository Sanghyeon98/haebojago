package com.psh.controller;

import com.google.gson.Gson;
import com.psh.domain.vo.DataVO;
import com.psh.domain.vo.MemberVO;
import com.psh.service.LoginService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/loginForm")
public class LoginController {

    private final LoginService loginService;

    @RequestMapping(value = "")
    public String loginForm(String userId, Model model, HttpSession session){
        System.out.println("login");
        return "login";
    }

    @PostMapping(value = "/login")
    @ResponseBody
    public String login(MemberVO memberVO, HttpSession httpSession){

        DataVO dataVO = new DataVO();

        //id 널처리
        if(null == memberVO.getId() || "".equals(memberVO.getId())){
            dataVO.setMsgId("1");
            dataVO.setContents("아이디를 입력해주세요");
            String jsonString = new Gson().toJson(dataVO);

            return jsonString;
        }
        //pwd null처리

        if(null == memberVO.getPwd() || "".equals(memberVO.getPwd())){
            dataVO.setMsgId("2");
            dataVO.setContents("비밀번호를 입력해주세요");
            String jsonString = new Gson().toJson(dataVO);

            return jsonString;
        }

        int check = loginService.loginCheck(memberVO);
        if(check==10){
            dataVO.setMsgId("10");
            dataVO.setContents("아이디를 확인 하세요.");
        }else if(check==20){
            dataVO.setMsgId("20");
            dataVO.setContents("비번을 확인 하세요.");
        }else if(check==30){
            MemberVO user = loginService.doSelectOne(memberVO);
            dataVO.setMsgId("30");
            dataVO.setContents(user.getName()+"님 환영합니다.");

        if(null != user){
            httpSession.setAttribute("user",user);
            System.out.print(httpSession.getId());
        }}else {
            dataVO.setMsgId("99");
            dataVO.setContents("오류가 발생했습니다.");
        }
        String jsonString = new Gson().toJson(dataVO);

        return jsonString;
    }

    @PostMapping(value = "/logout")
    @ResponseBody
    public String logout(HttpSession httpSession){
        httpSession.removeAttribute("user");

        DataVO dataVO = new DataVO();
        dataVO.setMsgId("40");
        dataVO.setContents("로그아웃 되었습니다.");

        String jsonString = new Gson().toJson(dataVO);
        return jsonString;
    }
}
