package com.psh.service;

import com.psh.domain.dao.MemberDAO;
import com.psh.domain.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberDAO memberDAO;

    public int regiser(MemberVO memberVO){
        int result = memberDAO.insert(memberVO);

        // 10 성공
        if(result >0){
            return 10;
        }else { // 20 실패
            return 20;
        }
    }

    public int remove(MemberVO memberVO){
        int result = memberDAO.delete(memberVO.getId());
        if(result >0){
            return 10;
        }else { // 20 실패
            return 20;
        }
    }
}
