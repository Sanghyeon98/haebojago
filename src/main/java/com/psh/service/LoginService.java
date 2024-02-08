package com.psh.service;

import com.psh.domain.dao.LoginDAO;
import com.psh.domain.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginService {

    private final LoginDAO loginDAO;


    public int loginCheck(MemberVO memberVO){
        //10:ID 없음
        //20:비번이상
        //30:로그인
        int checkStatus =0;

        int status= loginDAO.idCheck(memberVO);
        if(status==0) {
            checkStatus = 10;
            return checkStatus;
        }
        status = loginDAO.idPassCheck(memberVO);
        if(status==0){
            checkStatus=20;
            return checkStatus;
        }
        checkStatus=30;
        return checkStatus;

    }



    public MemberVO doSelectOne(MemberVO memberVO){
        return loginDAO.doSelectOne(memberVO);
    }

}
