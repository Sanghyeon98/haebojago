package com.psh.controller;


import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

@RestController
public class ExcelController  {
    @GetMapping("/downloadExcel")
    public ResponseEntity<byte[]> downloadExcel() {
        try {
            // 엑셀 워크북 생성
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Word List");

            // 엑셀에 헤더 추가
            Row headerRow = sheet.createRow(0);
            String[] headers = {"단어", "뜻"};
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            // 엑셀에 데이터 추가
            String[][] data = {
                    {"Apple", "사과"},
                    {"Banana", "바나나"},
                    {"Orange", "오렌지"}
            };
            for (int i = 0; i < data.length; i++) {
                Row row = sheet.createRow(i + 1);
                for (int j = 0; j < data[i].length; j++) {
                    row.createCell(j).setCellValue(data[i][j]);
                }
            }

            // 엑셀 파일을 ByteArrayOutputStream에 쓰기
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            workbook.write(outputStream);
            workbook.close();

            // ByteArrayOutputStream을 byte 배열로 변환하여 응답으로 전송
            byte[] excelBytes = outputStream.toByteArray();

            // HTTP 응답에 적절한 헤더 설정
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.setContentType(MediaType.valueOf("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
            responseHeaders.setContentDispositionFormData("filename", "word_list.xlsx");
            responseHeaders.setContentLength(excelBytes.length);

            // ResponseEntity 생성하여 반환
            return new ResponseEntity<>(excelBytes, responseHeaders, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

