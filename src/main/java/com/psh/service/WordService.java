package com.psh.service;

import com.psh.domain.dao.WordDAO;
import com.psh.domain.vo.WordVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class WordService {
    private final WordDAO wordDAO;

    //수정
    public int update(WordVO wordVO){
       int result= wordDAO.update(wordVO);

       if(result >0){
           return 10;
       }else {
           return 20;
       }
    }

    //추가
    public int save(WordVO wordVO){
        int result= wordDAO.save(wordVO);
        // 10 성공
        if(result >0){
            return 10;
        }else { // 20 실패
            return 20;
        }
    }

    //삭제
    public int delete(Long worldId){
        int result= wordDAO.delete(worldId);
        // 10 성공
        if(result >0){
            return 10;
        }else { // 20 실패
            return 20;
        }
    }

    //리스트 가져오기
    public List<WordVO> findAll(Long seq){

        return wordDAO.findAll(seq);
    }
}
