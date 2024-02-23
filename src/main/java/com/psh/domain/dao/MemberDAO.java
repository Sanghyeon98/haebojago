package com.psh.domain.dao;

import com.psh.domain.vo.MemberVO;
import com.psh.domain.vo.WordVO;
import com.psh.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemberDAO {

    private final MemberMapper membermapper;

    public int insert(MemberVO memberVO){
        return membermapper.insert(memberVO);
    };

    public int delete(String id){
        return membermapper.delete(id);
    };

}
