package com.psh.service;

import com.psh.domain.dao.WordDAO;
import com.psh.domain.vo.Criteria;
import com.psh.domain.vo.WordVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.beans.Transient;
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
    public int delete(Long wordId){
        int result= wordDAO.delete(wordId);
        // 10 성공
        if(result >0){
            return 10;
        }else { // 20 실패
            return 20;
        }
    }

    @Transient
    public int deleteAll(List<Long> wordIdlist){
        for(Long wordId : wordIdlist){
            int result= wordDAO.delete(wordId);
            if(result ==0){
                // 20 실패
                return 20;
            }
        }
        return 10;
    }


    //리스트 가져오기
    public List<WordVO> findAll(Long seq, Criteria criteria){

        return wordDAO.findAll(seq, criteria);
    }

    public long selectCountAll(Long memberSeq,Criteria criteria){
        return wordDAO.selectCountAll(memberSeq,criteria);
    };


}
