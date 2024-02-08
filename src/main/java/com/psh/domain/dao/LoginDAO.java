package com.psh.domain.dao;

import com.psh.domain.vo.MemberVO;
import com.psh.mapper.LoginMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class LoginDAO {

    private final LoginMapper loginMapper;

   public int idCheck(MemberVO memberVO){
       return loginMapper.idCheck(memberVO);
   }

   public int idPassCheck(MemberVO memberVO){
      return loginMapper.idPassCheck(memberVO);
   }

   public MemberVO doSelectOne(MemberVO memberVO){
      return loginMapper.doSelectOne(memberVO);
   }
}
