package com.psh.domain.vo;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Data
public class DataVO {
   private String msgId;
   private String contents;
   private List dataList;
}
