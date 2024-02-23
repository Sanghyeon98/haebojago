package com.psh.domain.vo;


import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class PageMessageDTO {
    private Long totalWord;
    private List list;
}
