package com.psh.domain.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Date;
import java.util.List;

@Component
@Data
public class MemberVO  {
    private Long seq;
    private String id;
    private String pwd;
    private String name;
    private String email;
    private Date regTime;
    private Date updateTime;


}
