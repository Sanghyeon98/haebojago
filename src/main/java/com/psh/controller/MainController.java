package com.psh.controller;

import com.psh.service.WordService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@Slf4j
public class MainController {


    @GetMapping("/main")
    public ResponseEntity<?> test(){

        return ResponseEntity.ok("http");
    }
}
