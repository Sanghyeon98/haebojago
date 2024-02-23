package com.psh.controller;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.util.UriUtils;


import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Collections;

@Controller
public class PdfController {
    @PostMapping("/generatePDF")
    public ResponseEntity<byte[]> generatePDF(@RequestBody String jsonData, HttpServletResponse response) {
        try (PDDocument document = new PDDocument()) {
            // JSON 데이터 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(jsonData);
            String word = jsonNode.get("word").asText();
            String meaning = jsonNode.get("meaning").asText();

            // PDF 생성
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            // PDF에 테이블 추가
            float margin = 50;
            float yStart = page.getMediaBox().getHeight() - margin;
            float tableWidth = page.getMediaBox().getWidth() - (2 * margin);

            // BaseTable 인스턴스 생성
            try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
                BaseTable baseTable = new BaseTable(yStart, yStart - 20, 10, tableWidth, margin, document, page, true, true);
                Row<PDPage> headerRow = baseTable.createRow(15f);
                Cell<PDPage> headerCell = headerRow.createCell((tableWidth / 2), "단어");
                headerCell.setFont(PDType1Font.HELVETICA_BOLD);
                headerCell.setFontSize(12);
                headerCell.setFillColor(Color.LIGHT_GRAY);
                headerCell.setTextColor(Color.BLACK);

                headerCell = headerRow.createCell((tableWidth / 2), "의미");
                headerCell.setFont(PDType1Font.HELVETICA_BOLD);
                headerCell.setFontSize(12);
                headerCell.setFillColor(Color.LIGHT_GRAY);
                headerCell.setTextColor(Color.BLACK);

                Row<PDPage> row = baseTable.createRow(12f);
                Cell<PDPage> cell = row.createCell((tableWidth / 2), word);
                cell.setFont(PDType1Font.HELVETICA);
                cell.setFontSize(12);

                cell = row.createCell((tableWidth / 2), meaning);
                cell.setFont(PDType1Font.HELVETICA);
                cell.setFontSize(12);

                // 테이블 그리기
                baseTable.draw();
            }

            // PDF를 응답으로 전송
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            document.save(byteArrayOutputStream);
            byte[] bytes = byteArrayOutputStream.toByteArray();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + UriUtils.encode("example.pdf", "UTF-8") + "\"");

            return ResponseEntity.ok().body(bytes);
        } catch (IOException e) {
            // 에러 메시지를 바이트 배열로 변환하여 반환
            String errorMessage = "PDF 생성 중 오류가 발생했습니다.";
            byte[] errorBytes = errorMessage.getBytes();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorBytes);
        }
    }
}

