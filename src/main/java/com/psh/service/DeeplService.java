package com.psh.service;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import org.springframework.stereotype.Service;
import com.deepl.api.*;

@Service
public class DeeplService {
    Translator translator;
    public String TranslateService(String text, String source, String target){
        String authKey ="9fed6956-eab7-4b90-a47b-5c5f12e83600:fx";
        translator = new Translator(authKey);
        TextResult result;

        try {
            result = translator.translateText(text, source, target);
        } catch (Exception e) {
            String error ="error 확인후 입력을 다시 진행 해주세요";
            return error;
        }

        // 번역된 텍스트 반환
        return result.getText();
    }
}
