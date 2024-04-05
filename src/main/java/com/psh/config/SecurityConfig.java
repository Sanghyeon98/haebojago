package com.psh.config;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.filters.CorsFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
//import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//
//import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
//@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

//    @Bean
//    public WebSecurityCustomizer configure(){
//        return (web -> web.ignoring().requestMatchers("/static/**"));
//    }
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//
//        http.cors((corsConfig)->corsConfig.disable());
//        http.authorizeHttpRequests(request -> request
//                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
//                        .requestMatchers("/","/images/**","/signup","/sigup/**","/static/**","/getAll/**").permitAll()
//                        .anyRequest().authenticated()	// 어떠한 요청이라도 인증필요
//                )
//                .formLogin(login -> login
//                        .loginPage("/loginForm")// form 방식 로그인 사용
//                        .loginProcessingUrl("/loginForm/login")	// [B] submit 받을 url
//                        .usernameParameter("id")	// [C] submit할 아이디
//                        .passwordParameter("pwd")	// [D] submit할 비밀번호
//                        .defaultSuccessUrl("/", true)
//                        .permitAll()
//                )
//                .logout(withDefaults());	// 로그아웃은 기본설정으로 (/logout으로 인증해제)
//
//        return http.build();
//    }



}
