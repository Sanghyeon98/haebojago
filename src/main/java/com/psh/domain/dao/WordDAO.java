package com.psh.domain.dao;

import com.psh.domain.vo.Criteria;
import com.psh.domain.vo.MemberVO;
import com.psh.domain.vo.WordVO;
import com.psh.mapper.MainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class WordDAO {
    private final MainMapper mainmapper;

    //수정
    public int update(WordVO wordVO){
       return mainmapper.update(wordVO);
    }

    //추가
    public int save(WordVO wordVO){
        return mainmapper.insert(wordVO);
    }

    //삭제
    public int delete(Long worldId){
     return mainmapper.delete(worldId);
    }

    //리스트 가져오기
    public List<WordVO> findAll(Long seq, Criteria criteria){
     return mainmapper.getList(seq, criteria);
    }
    public int selectCountAll(Long memberseq ,Criteria criteria){
       return mainmapper.selectCountAll(memberseq,criteria);
    }
}
