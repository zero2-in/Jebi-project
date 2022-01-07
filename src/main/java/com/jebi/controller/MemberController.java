package com.jebi.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jebi.command.member.*;
import com.jebi.common.Command;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
    @RequestMapping("Member")
    public String member(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String separate = request.getParameter("separate");
        String pageLink = "";

        if(separate == null || separate == "") separate = "login";

        switch(separate) {
            // 로그인 페이지
            case "login" : {
                pageLink = "member/login";
                break;
            }
            // 회원가입 페이지
            case "join" : {
                pageLink = "member/join";
                break;
            }
            case "dologin" : {
                Command login = new MemberLogin();
                login.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 가입
            case "register" : {
                Command register = new MemberJoin();
                register.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 로그아웃
            case "logout" : {
                Command logout = new MemberLogout();
                logout.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
            // 네이버 로그인
            case "naverSave" : {
                Command naver = new NaverLogin();
                naver.execute(request, response);
                pageLink = "common_alert_popup";
                break;
            }
            // 카카오 로그인
            case "kakaoSave" : {
                Command kakao = new KakaoLogin();
                kakao.execute(request, response);
                pageLink = "common_alert_page";
                break;
            }
        } 

        return pageLink;
    }

    // 아이디 (중복) 검사
    @RequestMapping("Checkid")
    public void checkId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Command checkid = new CheckId();
        checkid.execute(request, response);
    }

    @RequestMapping("NaverLogin")
    public String naverLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return "member/naver_login";
    }

    @RequestMapping("ServiceTerms")
    public String serviceTerms() {
        return "member/service_terms_form";
    }

    @RequestMapping("PersonalTerms")
    public String personalTerms() {
        return "member/personal_terms_form";
    }
}
