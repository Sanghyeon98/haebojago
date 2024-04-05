package com.psh.service;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import org.springframework.stereotype.Service;

import java.net.URI;

@Service
public class GoogleTranslationService {
    public String TranslateService(String text, String source, String target){
        String apiKey ="AIzaSyAX0n2jqesnVEIAw68NUXugMTvkdT5fJxs";
        // 번역 클라이언트 생성
        Translate translate = TranslateOptions.newBuilder().setApiKey(apiKey).build().getService();

        // 번역 요청 보내기
        Translation translation = translate.translate(text,
                Translate.TranslateOption.sourceLanguage(source),
                Translate.TranslateOption.targetLanguage(target));

        // 번역된 텍스트 반환
        return translation.getTranslatedText();
    }

}
