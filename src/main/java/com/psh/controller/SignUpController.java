package com.psh.controller;

import com.google.gson.Gson;
import com.psh.domain.vo.DataVO;
import com.psh.domain.vo.MemberVO;
import com.psh.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/signup")
public class SignUpController {

    private final MemberService memberService;
    @RequestMapping(value = "")
    public String home(){
        System.out.println("signup");
        return "signup";
    }

    @PostMapping(value = "/register")
    @ResponseBody
    public String register(MemberVO memberVO, BindingResult bindingResult, Model model) {
        String jsonStr = "";
        DataVO dataVO = new DataVO();

        // 입력된 값의 유효성을 검사합니다.
        if (bindingResult.hasErrors()) {
            // 입력된 값에 문제가 있는 경우
            dataVO.setMsgId("30");
            dataVO.setContents("입력된 값이 올바르지 않습니다. 다시 확인해주세요.");
        } else {
            // 입력된 값이 유효한 경우
            int result = memberService.regiser(memberVO);

            if (result == 10) {
                dataVO.setMsgId("10");
                dataVO.setContents("등록되었습니다.");
            } else {
                dataVO.setMsgId("20");
                dataVO.setContents("등록에 실패하였습니다.");
            }
        }

        jsonStr = new Gson().toJson(dataVO);
        return jsonStr;
    }
}
