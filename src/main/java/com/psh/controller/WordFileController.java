package com.psh.controller;

import org.apache.poi.xwpf.usermodel.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
public class WordFileController {

    @PostMapping("/downloadWord")
    public ResponseEntity<byte[]> downloadWord(@RequestBody Map<String, List<Map<String, String>>> requestData) {
        List<Map<String, String>> wordList = requestData.get("wordList");

        try {
            // 워드 문서 생성
            XWPFDocument document = new XWPFDocument();

            // 표 생성
            XWPFTable table = document.createTable();

            // 테이블의 너비 설정 (예: 절반 크기)
            table.setWidth("100%");

            // 첫 번째 행 생성 및 헤더 추가
            XWPFTableRow headerRow = table.getRow(0);
            if (headerRow == null) {
                headerRow = table.createRow();
            }
            // 첫 번째 셀 생성 및 텍스트 설정
            XWPFTableCell cell1 = headerRow.getCell(0);
            if (cell1 == null) {
                cell1 = headerRow.createCell();
            }
            cell1.setText("단어");
            // 두 번째 셀 생성 및 텍스트 설정
            XWPFTableCell cell2 = headerRow.getCell(1);
            if (cell2 == null) {
                cell2 = headerRow.createCell();
            }
            cell2.setText("뜻");

            // 단어 리스트 추가
            for (Map<String, String> wordItem : wordList) {
                XWPFTableRow row = table.createRow();
                XWPFTableCell wordCell = row.getCell(0);
                if (wordCell == null) {
                    wordCell = row.createCell();
                }
                wordCell.setText(wordItem.get("word"));
                wordCell.setVerticalAlignment(XWPFTableCell.XWPFVertAlign.CENTER);
                XWPFTableCell meaningCell = row.getCell(1);
                if (meaningCell == null) {
                    meaningCell = row.createCell();
                }
                meaningCell.setText(wordItem.get("meaning"));
                meaningCell.setVerticalAlignment(XWPFTableCell.XWPFVertAlign.CENTER);
            }

            // 워드 파일을 ByteArrayOutputStream에 쓰기
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            document.write(outputStream);
            document.close();

            // ByteArrayOutputStream을 byte 배열로 변환하여 응답으로 전송
            byte[] wordBytes = outputStream.toByteArray();

            // HTTP 응답에 적절한 헤더 설정
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.valueOf("application/vnd.openxmlformats-officedocument.wordprocessingml.document"));
            responseHeaders.setContentDispositionFormData("filename", "word_list.docx");
            responseHeaders.setContentLength(wordBytes.length);

            // ResponseEntity 생성하여 반환
            return new ResponseEntity<>(wordBytes, responseHeaders, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}