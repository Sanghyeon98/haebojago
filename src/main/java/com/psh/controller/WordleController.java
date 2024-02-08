package com.psh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WordleController {

    @RequestMapping(value = "/wordle")
    public String test(){
        System.out.println("1");
        return "wordle";
    }
}
