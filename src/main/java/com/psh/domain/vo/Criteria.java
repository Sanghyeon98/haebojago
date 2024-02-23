package com.psh.domain.vo;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class Criteria {
    //페이지 번호
    private int pageNum;

    //페이지에 보여질 데이터 수
    private int amount;

    private int offset;

    //검색타임
    private String type;
    //검색 키워드
    private String keyword;

    public Criteria() {
        this(1,10);
    }
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.offset = (pageNum - 1) * amount; // 오프셋 계산
    }

    public Criteria(int pageNum, int amount, String type, String keyword) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.type = type;
        this.keyword = keyword;
        this.offset = (pageNum - 1) * amount; // 오프셋 계산
    }

    public String getParams(){
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum",this.pageNum);
        return builder.toUriString();
    }
}
