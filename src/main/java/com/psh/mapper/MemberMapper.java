package com.psh.mapper;

import com.psh.domain.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    public int insert(MemberVO memberVO);

    public int delete(String id);

}
