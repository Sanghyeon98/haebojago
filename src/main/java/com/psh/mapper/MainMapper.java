package com.psh.mapper;

import com.psh.domain.vo.Criteria;
import com.psh.domain.vo.MemberVO;
import com.psh.domain.vo.WordVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainMapper {

    //수정
    public int update(WordVO wordVO);

    //추가
    public int insert(WordVO wordVO);

    //삭제
    public int delete(Long worldId);

    //리스트 가져오기
    public List<WordVO> getList(@Param("memberSeq") Long seq, @Param("cri") Criteria criteria);

    public int selectCountAll(@Param("memberSeq") Long seq, @Param("cri") Criteria criteria);
}
