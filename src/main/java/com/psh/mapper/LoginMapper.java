package com.psh.mapper;

import com.psh.domain.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {

   public int idCheck(MemberVO memberVO);

   public int idPassCheck(MemberVO memberVO);

   public MemberVO doSelectOne(MemberVO memberVO);
}
