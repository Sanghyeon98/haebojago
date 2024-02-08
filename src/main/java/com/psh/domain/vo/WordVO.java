package com.psh.domain.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class WordVO {
   private Long   wordId; // 순번
   private String word; //단어
   private String wordType; //단어 타입
   private String meaning; //해석한 단어
   private String meaningType; //해석한 단어
   private String sentence;  // 문장
   private Long memberSeq; //멤버 번호
   private Date regTime;//등록시간
   private Date updateTime;//업데이트시간
}
